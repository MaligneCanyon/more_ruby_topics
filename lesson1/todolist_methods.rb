# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def add(todo)
    begin
      # raise TypeError, "Can only add Todo objects" unless todo.class.name == "Todo"
      raise TypeError, "Can only add Todo objects" unless todo.instance_of?(Todo)
      @todos << todo
    # rescue
    #   puts "invalid class (#{todo.class.name})"
    end
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done? # are all todos done ?
    @todos.all? { |todo| todo.done? } # calls the Todo#done? method
  end

  def item_at(ndx)
    # raise IndexError unless (-self.size...self.size).include?(ndx)
    # @todos[ndx]
    @todos.fetch(ndx) # much simpler
  # rescue
  #   puts "invalid ndx (#{ndx})"
  end

  def mark_done_at(ndx)
    @todos.fetch(ndx).done!
  # rescue
  #   puts "invalid ndx (#{ndx})"
  end

  def mark_undone_at(ndx)
    @todos.fetch(ndx).undone!
  # rescue
  #   puts "invalid ndx (#{ndx})"
  end

  def done! # mark all todos as done
    @todos.each { |todo| todo.done! } # calls the Todo#done! method
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(ndx)
    raise IndexError unless (-self.size...self.size).include?(ndx)
    @todos.delete_at(ndx)
  # rescue
  #   puts "invalid ndx (#{ndx})"
  end

  def to_s
    "---- #{title} ----\n" +
    @todos.map(&:to_s).join("\n")
    # @todos.map { |todo| todo.to_s }.join("\n")
  end

  def each
    @todos.each do |todo| # use Array#each
      yield(todo)
    end
    self # rtn a TodoList obj
  end

  # def select
  #   new_arr = []
  #   self.each do |todo| # don't need to use 'self.each' here (just use 'each')
  #     new_arr << todo if yield(todo)
  #   end
  #   new_arr # rtn an arr of Todo objs
  # end

  def select
    # new_list = TodoList.new("Selected Todos")
    new_list = TodoList.new(title) # should probably keep the original title
    self.each do |todo| # don't need to use 'self.each' here (just use 'each')
      new_list.add(todo) if yield(todo)
    end
    new_list # rtn a TodoList obj
  end

  # Takes a string as argument, and returns the first Todo object that matches the argument.
  # Return nil if no todo is found.
  def find_by_title(str)
    self.each do |todo|
      return todo if todo.title == str
    end
    nil
    # select { |todo| todo.title == str }.first # alt from solution
  end

  # Return a new TodoList object containing only the done items
  def all_done
    self.select { |todo| todo.done? }
  end

  # Return a new TodoList object containing only the not done items
  def all_not_done
    self.select { |todo| !todo.done? }
  end

  # Takes a string as argument, and marks the first Todo object that matches the argument as done.
  def mark_done(str)
    todo = self.find_by_title(str)
    todo.done! if todo
    # find_by_title(str) && find_by_title(str).done! # alt from solution
  end

  # Mark every todo as done
  def mark_all_done
    self.each { |todo| todo.done! }
  end

  # Mark every todo as not done
  def mark_all_undone
    self.each { |todo| todo.undone! }
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
todo1.done!

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

# [X] Buy milk
# [ ] Clean room
# [ ] Go to gym

# results = list.select { |todo| todo.done? }
# puts results.inspect
p list.select { |todo| todo.done? }

# when we rtn an arr of Todo objs, we get
# [#<Todo:0x007fd88c0ad9f0 @title="Buy milk", @description="", @done=true>]

# when we rtn a TodoList obj, we get
#<TodoList:0x0000000001ab7ad8 @title="Selected Todos", @todos=[#<Todo:0x0000000001ab7e48 @title="Buy milk", @description="", @done=true>]>

puts
puts list # calls TodoList#to_s
puts "find_by_title:"
p list.find_by_title("Clean room")
p list.find_by_title("Clean car") # nil
puts "all_done:"
p list.all_done
puts "all_not_done:"
p list.all_not_done
puts "mark_done:"
p list.mark_done("Clean room")
p list.mark_done("Clean car") # nil
puts list
puts "mark_all_done:"
list.mark_all_done
puts list
puts "mark_all_undone:"
list.mark_all_undone
puts list
