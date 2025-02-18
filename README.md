
# LinkedList Implementation in Ruby

This project implements a singly linked list in Ruby. The linked list consists of two classes: `LinkedList` and `Node`.

## LinkedList Class

The `LinkedList` class represents the full list and provides the following methods:

- `#initialize`: Initializes an empty linked list.
- `#append(value)`: Adds a new node containing `value` to the end of the list.
- `#prepend(value)`: Adds a new node containing `value` to the start of the list.
- `#size`: Returns the total number of nodes in the list.
- `#head`: Returns the first node in the list.
- `#tail`: Returns the last node in the list.
- `#at(index)`: Returns the node at the given index.
- `#pop`: Removes the last element from the list and returns it.
- `#contains?(value)`: Returns `true` if the passed-in value is in the list, otherwise returns `false`.
- `#find(value)`: Returns the index of the node containing `value`, or `nil` if not found.
- `#to_s`: Represents the linked list as a string in the format: `( value ) -> ( value ) -> nil`.
- `#insert_at(value, index)`: Inserts a new node with the provided value at the given index.
- `#remove_at(index)`: Removes the node at the given index.

## Node Class

The `Node` class represents a single element in the linked list and contains the following attributes:

- `value`: The value stored in the node.
- `next_node`: A reference to the next node in the list.

## Usage

To use the linked list, create an instance of `LinkedList` and use the provided methods to manipulate the list.

```ruby
require_relative 'lib/linked_lists'

list = LinkedList.new
list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
```

This will output:

```
( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil
```

## Running Tests

To run the tests, use the following command:

```sh
rspec spec/linked_lists_spec.rb
```