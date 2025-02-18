# frozen_string_literal: true

require_relative '../lib/linked_lists'

RSpec.describe LinkedList do
  let(:linked_list) { LinkedList.new }

  describe '#append' do
    it 'begins with an empty list' do
      expect(linked_list.size).to eq(0)
    end

    it 'appends items to the list' do
      linked_list.append('dog')
      expect(linked_list.to_s).to eq('( dog ) -> nil')
    end

    it 'appends multiple items to the list' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> ( parrot ) -> nil')
    end
  end

  describe '#prepend' do
    it 'prepends items to the list' do
      linked_list.append('cat')
      linked_list.prepend('dog')
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> nil')
    end

    it 'prepends multiple items to the list' do
      linked_list.prepend('cat')
      linked_list.prepend('dog')
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> nil')
    end
  end
  
  describe '#size' do
    it 'returns the size of the linked list' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.size).to eq(3)
    end
  end

  describe '#head' do
    it 'returns the first node in the list' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.head.value).to eq('dog')
    end
  end

  describe '#tail' do
    it 'returns the last node in the list' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.tail.value).to eq('parrot')
    end
  end
  
  describe '#at' do
    it 'returns the node at the given index' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.at(1).value).to eq('cat')
    end

    it 'returns nil for an out-of-bounds index' do
      linked_list.append('dog')
      expect(linked_list.at(5)).to be_nil
    end
  end

  describe '#pop' do
    it 'removes the last node from the list' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      linked_list.pop
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> nil')
    end

    it 'returns the value of the removed node' do
      linked_list.append('dog')
      linked_list.append('cat')
      expect(linked_list.pop.value).to eq('cat')
    end

    it 'returns nil when popping from an empty list' do
      expect(linked_list.pop).to be_nil
    end

    it 'reduces the size of the list by one' do
      linked_list.append('dog')
      linked_list.append('cat')
      expect { linked_list.pop }.to change { linked_list.size }.by(-1)
    end
  end

  describe '#contains?' do
    it 'returns true if the list contains the value' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.contains?('cat')).to be true
    end

    it 'returns false if the list does not contain the value' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.contains?('hamster')).to be false
    end

    it 'returns false for an empty list' do
      expect(linked_list.contains?('dog')).to be false
    end
  end

  describe '#find' do
    it 'returns the index of the node containing the value' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.find('cat')).to eq(1)
    end

    it 'returns nil if the value is not found' do
      linked_list.append('dog')
      linked_list.append('cat')
      expect(linked_list.find('hamster')).to be_nil
    end
  end

  describe '#to_s' do
    it 'represents the linked list as a string' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> ( parrot ) -> nil')
    end
  end

  describe '#insert_at' do
    it 'inserts a node at the given index' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.insert_at('parrot', 1)
      expect(linked_list.to_s).to eq('( dog ) -> ( parrot ) -> ( cat ) -> nil')
    end

    it 'prepends if index is 0' do
      linked_list.append('cat')
      linked_list.insert_at('dog', 0)
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> nil')
    end

    it 'appends if index is greater than size' do
      linked_list.append('dog')
      linked_list.insert_at('cat', 5)
      expect(linked_list.to_s).to eq('( dog ) -> ( cat ) -> nil')
    end
  end

  describe '#remove_at' do
    it 'removes the node at the given index' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      linked_list.remove_at(1)
      expect(linked_list.to_s).to eq('( dog ) -> ( parrot ) -> nil')
    end

    it 'removes the head if index is 0' do
      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.remove_at(0)
      expect(linked_list.to_s).to eq('( cat ) -> nil')
    end

    it 'does nothing if index is out of bounds' do
      linked_list.append('dog')
      linked_list.remove_at(5)
      expect(linked_list.to_s).to eq('( dog ) -> nil')
    end
  end
end
