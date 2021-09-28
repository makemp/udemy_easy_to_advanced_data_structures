require 'adjacency_list_builder'

require_relative 'lib/maciej_data_structures'

@letters = ('a'..'z').to_a
@letter_to_index = @letters.each_with_object({}).with_index { |(el, memo), index| memo[el] = index}

@disjoint_set = MaciejDataStructures::DisjointSet.new(('a'..'j').to_a.size)

def unify(letter_one, letter_two)
  @disjoint_set.unify(@letter_to_index[letter_one], @letter_to_index[letter_two])
end

def inspect_set
  puts @disjoint_set.tracking_array.map { |i| @letters[i] }.inspect
  puts @disjoint_set.groups_size.inspect
end

def find_me(letter)
  puts @disjoint_set.find(@letter_to_index[letter]).inspect
end

unify('a', 'b')
unify('c', 'd')
unify('e', 'f')
unify('g', 'h')
unify('i', 'j')

unify('b', 'c')

find_me('d')

inspect_set

