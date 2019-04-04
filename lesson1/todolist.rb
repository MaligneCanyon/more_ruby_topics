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


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

puts todo1
puts todo2
puts todo3

# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym


todo1.done!

puts todo1
puts todo2
puts todo3

# [X] Buy milk
# [ ] Clean room
# [ ] Go to gym


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
    @todos.fetch(ndx).done! # calls the Todo#done! method
  # rescue
  #   puts "invalid ndx (#{ndx})"
  end

  def mark_undone_at(ndx)
    @todos.fetch(ndx).undone! # calls the Todo#undone! method
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
    # @todos.map { |todo| todo.to_s }.join("\n") # calls the Todo#to_s method
    @todos.map(&:to_s).join("\n")
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
puts "add:"
puts list.add(todo1)            # adds todo1 to end of list, returns list
puts list.add(todo2)            # adds todo2 to end of list, returns list
puts list.add(todo3)            # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add


# ---- Interrogating the list -----

# size
puts "size:"
puts list.size                  # returns 3

# first
puts "first:"
puts list.first                 # returns todo1, which is the first item in the list

# last
puts "last:"
puts list.last                  # returns todo3, which is the last item in the list

#to_a
puts "to_a:"
puts list.to_a                  # returns an array of all items in the list

#done?
puts "done?:"
puts list.done?                 # returns true if all todos in the list are done, otherwise false
# todo1.done!
# todo2.done!
# todo3.done!
# p list.done?
# todo1.undone!
# todo2.undone!
# todo3.undone!
# p list.done?


# ---- Retrieving an item in the list ----

# item_at
puts "item_at:"
# list.item_at                    # raises ArgumentError
puts list.item_at(1)            # returns 2nd item in list (zero based index)
# puts list.item_at(100)          # raises IndexError
# puts list.item_at(3)            # raises IndexError
# puts list.item_at(2)            # returns last item in list (zero based index)
# puts list.item_at(-1)           # returns last item in list (zero based index)
# puts list.item_at(-3)           # returns first item in list (zero based index)
# puts list.item_at(-4)           # raises IndexError


# ---- Marking items in the list -----

# mark_done_at
puts "mark_done_at:"
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
puts list.item_at(1)
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
puts "mark_undone_at:"
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done
puts list.item_at(1)
# list.mark_undone_at(100)        # raises IndexError

# done!
puts "done!:"
list.done!                      # marks all items as done
puts list.to_a


# ---- Deleting from the list -----

# shift
puts "shift:"
puts list.shift                 # removes and returns the first item in list

# pop
puts "pop:"
puts list.pop                   # removes and returns the last item in list

# remove_at
# rebuild the list first ...
list.pop
list.add(todo1)
list.add(todo2)
list.add(todo3)
puts "remove_at:"
# list.remove_at                  # raises ArgumentError
puts list.remove_at(1)          # removes and returns the 2nd item
# puts list.remove_at(100)        # raises IndexError


# ---- Outputting the list -----

# to_s
# rebuild the list first ...
list.pop
list.pop
list.pop
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.mark_undone_at(0)
puts "to_s:"
puts list.to_s                       # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym


puts "additional tests:"
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Tomorrow's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

puts list
list.pop
puts list
list.mark_done_at(1)
puts list
