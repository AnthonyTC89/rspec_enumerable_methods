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
    describe '#my_each_with_index' do
        it 'descripcion' do
            
        end
    end
    describe '#my_select' do
        it 'descripcion' do
            
        end
    end
    describe '#my_all?' do
        it 'descripcion' do
            
        end
    end
    describe '#my_any?' do
        it 'descripcion' do
            
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