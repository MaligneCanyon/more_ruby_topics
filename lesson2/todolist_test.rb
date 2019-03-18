require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'todolist'

require "minitest/reporters"
Minitest::Reporters.use!

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  def test_size
    assert_equal(@todos.size, @list.size)
    assert_equal(3, @list.size)
  end
  def test_first
    assert_equal(@todos.first, @list.first)
    assert_equal(@todo1, @list.first)
  end
  def test_last
    assert_equal(@todos.last, @list.last)
    assert_equal(@todo3, @list.last)
  end
  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  def test_pop # setup is called for each test, so @list has been re-init'd
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  def test_done?
    @list.mark_all_done
    assert(@list.done?) # equiv to assert(true, @list.done?)
    @todo1.undone!
    assert_equal(false, @list.done?)
  end
  def test_type_error
    assert_raises(TypeError) { @list << 'strings are not allowed' }
  end
  def test_shovel
    @list << @todo1
    assert_equal([@todo1, @todo2, @todo3, @todo1], @list.to_a)
  end
  def test_add
    @list << @todo2
    assert_equal([@todo1, @todo2, @todo3, @todo2], @list.to_a)
  end
  def test_item_at
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(5) }
  end
  def test_mark_done_at
    assert_equal(@todo3.done!, @list.mark_done_at(2))
    assert_raises(IndexError) { @list.mark_done_at(5) }
    # should chk each of the todos (as per the solution), to make sure that
    # the correct one was marked done ...
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end
  def test_mark_undone_at
    @list.mark_all_done
    assert_equal(@todo3.undone!, @list.mark_undone_at(2))
    assert_raises(IndexError) { @list.mark_undone_at(5) }
    # should chk each of the todos (as per the solution), to make sure that
    # the correct one was marked undone ...
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  def test_done!
    @list.done!
    assert(@todos.all? { |todo| todo.done? })
  end
  def test_remove_at
    assert_equal(@todo2, @list.remove_at(1)) # delete rtns the deleted elem
    assert_equal([@todo1, @todo3], @list.to_a)
    # remove_at calls Array#delete which calls item_at which rtns an IndexError
    # if the ndx is invalid
    assert_raises(IndexError) { @list.remove_at(5) }
  end
  def test_to_s
    # remove trailing newlines and any leading whitespace from beginning of
    # each line
    # output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    output = <<~OUTPUT.chomp # for R. >= v2.3
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)

    @todo1.done!
    output = <<~OUTPUT.chomp # for R. >= v2.3
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)

    @todo2.done!
    @todo3.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end
  def test_each
    new_arr = []
    @list.each { |todo| new_arr << todo }
    assert_equal([@todo1, @todo2, @todo3], new_arr)

    # assert_equal(@list, @list.each { }) # sufficient ?
    assert_equal(@list, @list.each { |todo| nil })
  end
  def test_select
    new_list = @list.select { |todo| todo.done? } # be careful to use todo#done? and not the getter todo#done
    assert_equal([], new_list.to_a)
    assert_equal(@list.title, new_list.title)

    @todo2.done!
    new_list = @list.select { |todo| todo.done? }
    assert_equal([@todo2], new_list.to_a)
    assert_equal(@list.title, new_list.title)
  end

  # additional tests affecting CC
  # strangely, these 6 methods rep 5 LOC re: CC
  # test_mark_all_done and the related test_mark_all_undone have no effect ???
  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end
  def test_all_done
    @list.done!
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end
  def test_all_not_done
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end
  def test_mark_done
    @list.mark_done("Buy milk")
    assert(@todo1.done?)
  end
  def test_mark_all_done
    @list.mark_all_done
    assert(@todos.all? { |todo| todo.done? })
  end
  def test_mark_all_undone
    @list.mark_all_undone
    assert(@todos.all? { |todo| !todo.done? })
  end


  # additional tests w/ no effect on CC
  def test_title
    assert_equal("Today's Todos", @list.title)
  end
  def test_initialize
    assert_equal("Today's Todos", @list.title)
  end
end
