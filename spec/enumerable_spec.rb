require './lib/iterator_methods.rb'

RSpec.describe Enumerable do
    describe '#my_each' do
        it 'iterates through numbers in an array' do
            arr = [1,2,3,4,5]
            count = 0
            arr.my_each { |i| count += 1 }
            expect(count).to eq(arr.length)
        end

        it 'iterates through string in an array' do
            arr = ['hi','my','name','is','Ariel Camus']
            accum = ''
            arr.my_each { |elem| accum += elem + ' ' }
            expect(accum).to eq('hi my name is Ariel Camus ')
        end
    end
    describe ' #my_each_with_index' do
        it ' iterates numbers with index in an array' do
            arr = [0,1,2,3,4]
            sum = 0
            arr.my_each_with_index { |elem, index| sum += elem + index}
            expect(sum).to eql(20)
        end
    end
    describe ' #my_select' do
        it ' iterates and select odd numbers in an array' do
            arr = [0,1,2,3,4,5,6,7,8,9]
            arr_select = arr.my_select { |elem| elem.odd? }
            expect(arr_select).to match_array([1,3,5,7,9])
        end
    end
    describe ' #my_all?' do
        it ' iterates and compare all numbers in an array with a condition true' do
            arr = [0,1,2,3,4,5,6,7,8,9]
            cond = arr.my_all? { |elem| elem < 10 }
            expect(cond).to be true
        end
    end
    describe ' #my_any?' do
        it ' iterates and compare if any element in the array have the condition in the block' do
            arr = [0,1,2,3,4,5,6,7,8,9]
            cond = arr.my_any? { |elem| elem == 4 }
            expect(cond).to be true
        end
    end
    describe '#my_none?' do
        it 'descripcion' do
            
        end
    end
    describe '#my_count' do
        it 'descripcion' do
            
        end
    end
    describe '#my_map' do
        it 'descripcion' do
            
        end
    end
    describe '#my_inject' do
        it 'descripcion' do
            
        end
    end
end