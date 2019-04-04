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

    # setup is called for each test, so @list is always re-init'd
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
    assert_equal(@todos.size, @list.size) # or ...
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first) # or ...
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last) # or ...
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift) # and ...
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop) # and ...
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @list.mark_all_done
    assert(@list.done?) # equiv to assert_equal(true, @list.done?)
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
    @list.add(@todo2)
    assert_equal([@todo1, @todo2, @todo3, @todo2], @list.to_a)
  end

  def test_item_at
    assert_equal(@todo3, @list.item_at(2)) # and ...
    assert_raises(IndexError) { @list.item_at(5) }
  end

  def test_mark_done_at
    assert_equal(@todo3.done!, @list.mark_done_at(2)) # and ...
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
    @todo3.undone!
    assert_equal(@todo3.undone!, @list.mark_undone_at(2)) # and ...
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
    # remove_at calls Array#delete w/ arg item_at(idx) which rtns an IndexError
    # if the idx is invalid; otherwise, Array#delete rtns the deleted elem
    assert_equal(@todo2, @list.remove_at(1)) # and ...
    assert_equal([@todo1, @todo3], @list.to_a) # and ...
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

    # test the rtn value also
    # assert_equal(@list, @list.each { |todo| nil })
    assert_equal(@list, @list.each { }) # sufficient ?
  end

  def test_select
    # be careful to use todo#done? and not the getter todo#done
    new_list = @list.select { |todo| todo.done? }
    assert_equal(@list.title, new_list.title)
    assert_equal([], new_list.to_a)

    @todo2.done!
    new_list = @list.select { |todo| todo.done? }
    assert_equal(@list.title, new_list.title)
    assert_equal([@todo2], new_list.to_a)
  end


  # additional tests affecting CC
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


  # test_mark_all_done and the related test_mark_all_undone apparently have
  # no effect on CC
  def test_mark_all_done
    @list.mark_all_done
    assert(@todos.all? { |todo| todo.done? }) # this assertion was tested in #test_done!
  end
  def test_mark_all_undone
    @list.mark_all_undone
    assert(@todos.all? { |todo| !todo.done? })
  end


  # additional tests w/ no effect on CC
  def test_title
    assert_equal("Today's Todos", @list.title)
  end
  def test_initialize # does this really test initialize ?
    @list = TodoList.new("Wishlist")
    assert_equal("Wishlist", @list.title)
    assert_equal([], @list.to_a)
  end
end
