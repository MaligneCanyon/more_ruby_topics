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
    arr = @todos
    ndx = 0
    while ndx < arr.size
      yield(arr[ndx])
      ndx += 1
    end
    arr
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym
