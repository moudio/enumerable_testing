# frozen_string_literal: true

# Creating the enumerable module
module Enumerable
  # my_each method
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end

  # my_each_with_index method
  def my_each_with_index
    index = 0
    i = 0
    while i < length
      yield(self[i], index)
      index += 1
      i += 1
    end
    self
  end

  # my_select method
  def my_select
    arr = []
    my_each { |el| arr << el if yield(el) }
    arr
  end

  # my_all? method
  def my_all?
    result = true
    my_each do |el|
      return false unless yield(el)
    end
    result
  end

  # my_any?

  def my_any?
    my_each { |el| return true if yield(el) }
    false
  end

  def my_none?
    my_each do |el|
      return true unless yield(el)
    end
    false
  end

  # count method
  def my_count(param = nil)
    count = 0
    if block_given?
      my_each { |el| count += 1 if yield(el) }
      count
    elsif param
      my_select { |el| el == 2 }.length
    else
      return length
    end
  end

  # my_map method
  def my_map(proc = nil)
    arr = []
    if proc.class == Proc
      my_each(&proc)
    elsif block_given?
      my_each { |el| arr << yield(el) }
    end
    arr
  end

  # my_inject

  def my_inject(element = nil)
    total = element || 0
    (0...length).each do |i|
      total = yield(total, self[i])
    end
    total
  end
end

# testing the my_inject method
def multiply_els(arr)
  arr.my_inject do |a, b|
    a *= b
    a
  end
end
