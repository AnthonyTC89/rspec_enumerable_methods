# frozen_string_literal: true

module Enumerable
  def my_each
    length.times { |i| yield self[i] }
  end

  def my_each_with_index
    length.times { |i| yield self[i], i }
  end

  def my_select
    aux_array = []
    length.times { |i| aux_array << self[i] if yield self[i] }
    aux_array
  end

  def my_all?
    if block_given?
      length.times { |i| return false unless yield self[i] }
    else
      length.times { |i| return false unless self[i] }
    end
    true
  end

  def my_any?
    if block_given?
      length.times { |i| return true if yield self[i] }
    else
      length.times { |i| return true if self[i] }
    end
    false
  end

  def my_none?
    if block_given?
      length.times { |i| return false if yield self[i] }
    else
      length.times { |i| return false if self[i] }
    end
    true
  end

  def my_count(*arg)
    count = 0
    if arg.empty?
      block_given? ? length.times { |i| count += 1 if yield self[i] } : count = length
    else
      length.times { |i| count += 1 if self[i] == arg[0] }
    end
    count
  end

  def my_map(*arg)
    if arg.empty?
      length.times do |i|
        self[i] = yield self[i]
      end
    else
      length.times do |i|
        self[i] = arg[0].call(self[i])
      end
    end
    self
  end

  def my_inject(*arg)
    memo = arg.empty? ? self[0] : arg[0]
    (length - 1).times do |i|
      memo = yield memo, self[i + 1]
    end
    memo
  end
end

def multiply_els(array)
  array.my_inject { |elem, n| elem * n }
end

# array = [1, 2, 3, 4, 5]

# p array.my_map { |elem| elem + 2 }
# p array.my_map(proc { |elem| elem * 2 })
# p array.map { |elem| elem * 2 }

# p multiply_els array
# p array.inject { |elem, n| elem * n}

# p array.my_inject(10) { |elem, n| elem * n}
# p array.inject(10) { |elem, n| elem * n}

# p array.my_count(1) {|elem| elem > 2}
# p array.count(1) { |elem| elem > 2}

# p array.my_none? {|elem| elem == true}
# p array.none? {|elem| elem == true}

# p array.my_any? { |elem| elem == 4 }
# p array.any? { |elem| elem == 4 }

# p array.my_all? { |elem| elem < 10 }
# p array.all? { |elem| elem < 10}

# p array.my_select { |elem| elem.odd? }
# p array.select{ |elem| elem.odd? }

# array.each_with_index {|elem,index| p "elem: " + elem.to_s + ", index:" + index.to_s}
# array.my_each_with_index { |elem, index| p "elem: " + elem.to_s + ", index:" + index.to_s }

# array.each {|elem| p elem }
# array.my_each { |elem| p elem }
