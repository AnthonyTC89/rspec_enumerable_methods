# frozen_string_literal: true

require './lib/iterator_methods.rb'

RSpec.describe Enumerable do
  let (:arrNum){[0, 1, 2, 3, 4]}
  describe '#my_each' do
    it 'iterates through numbers in an array' do
      count = 0
      arrNum.my_each { count += 1 }
      expect(count).to eq(arrNum.length)
    end

    it 'iterates through string in an array' do
      arr = ['hi', 'my', 'name', 'is', 'Ariel Camus']
      accum = ''
      arr.my_each { |elem| accum += elem + ' ' }
      expect(accum).to eq('hi my name is Ariel Camus ')
    end
  end

  describe ' #my_each_with_index' do
    it ' iterates numbers with index in an array' do
      sum = 0
      arrNum.my_each_with_index { |elem, index| sum += elem + index }
      expect(sum).to eql(20)
    end

    it 'returns a array of concatenated strings with their index' do
      arr = %w[a b c d e]
      concat = ''
      arr.my_each_with_index { |elem, index| concat += "#{elem}#{index}" }
      expect(concat).to eql('a0b1c2d3e4')
    end
  end

  describe ' #my_select' do
    it ' iterates and select odd numbers in an array' do
      arr_select = arrNum.my_select(&:odd?)
      expect(arr_select).to match_array([1, 3])
    end

    it 'iterates and returns string of lenght 5' do
      arr2 = %w[how there many carry taken yes]
      arr_select2 = arr2.my_select { |word| word.length == 5 }
      expect(arr_select2).to match_array(%w[there carry taken])
    end
  end

  describe ' #my_all?' do
    it 'returns elements less than 10' do
      cond = arrNum.my_all? { |elem| elem < 10 }
      expect(cond).to be true
    end

    it ' returns true when all elements start with s' do
      arr = %w[school soccer sugar rain]
      cond = arr.my_all? { |elem| elem[0] == 's' }
      expect(cond).to be false
    end
  end

  describe ' #my_any?' do
    it ' iterates and compare if any element in the array have the condition in the block' do
      cond = arrNum.my_any? { |elem| elem == 4 }
      expect(cond).to be true
    end

    it ' iterates and compare if any element in the array have the condition in the block' do
      arr = %w[word school bus eat]
      cond = arr.my_any? { |elem| elem == 'take' }
      expect(cond).to be false
    end
  end

  describe '#my_none?' do
    it 'returns true' do
      cond = arrNum.my_none? { |elem| elem == 10 }
      expect(cond).to be true
    end
    it 'returns false' do
      arr = %w[name lastname age]
      cond = arr.my_none? { |elem| elem == 'name' }
      expect(cond).to be false
    end
  end

  describe ' #my_count' do
    it ' without arguments nor block' do
      expect(arrNum.length).to eql(arrNum.my_count)
    end

    it ' with an argument without block' do
      expect(arrNum.my_count(3)).to eql(1)
    end

    it ' with a block' do
      count = [1, 3, 3, 4].my_count { |num| num > 1 }
      expect(count).to eql(3)
    end

    it ' with a block and argument' do
      count = [1, 3, 3, 4].my_count(3) { |num| num > 1 }
      expect(count).to eql(2)
    end

    it 'comparing count and my_count methods' do
      expect(arrNum.count).to eql(arrNum.my_count)
    end
  end

  describe '#my_map' do
    it ' with a PROC as an argument' do
      arrNum.my_map(proc { |elem| elem * 2 })
      expect(arrNum).to match_array([0, 2, 4, 6, 8])
    end

    it 'with a block' do
      arrNum.my_map { |elem| elem * 3 }
      expect(arrNum).to match_array([0, 3, 6, 9, 12])
    end
  end
  describe '#my_inject' do
    let (:arrInject){[1, 2, 3, 4]}
    it ' with a block ' do
      sum = arrInject.my_inject { |elem, n| elem + n }
      expect(sum).to eq(10)
    end
    it ' with a block and an argument' do
      sum = arrInject.my_inject(5) { |elem, n| elem + n }
      expect(sum).to eq(15)
    end
  end
  describe ' #multiply_els ' do
    it ' my_inject with multiply block ' do
      arr = [5, 10, 20, 30]
      result = multiply_els(arr)
      expect(result).to eql(30000)
    end 
  end
end
