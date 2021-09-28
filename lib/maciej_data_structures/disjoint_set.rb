module MaciejDataStructures
  class DisjointSet # Union find
    attr_reader :tracking_array, :groups_size, :number_of_groups

    def initialize(size)
      # basic implementation contains just array size, but in the future I think it should accept adjacency list
      @size = size
      @tracking_array = (0...size).to_a # track the size of each component -> at the beginning everything is size one
      @groups_size = Array.new(size) { 1 }
      @number_of_groups = size
    end

    # finds a root of given node index. With path compression
    def find(node_index)
      root_index = node_index
      while root_index != tracking_array[root_index]
        root_index = tracking_array[root_index] # finding top-element/ the root of the group
      end

      compress_path(node_index, root_index)

      root_index
    end

    # with path compression
    def unify(p, q)
      # unify the components containing nodes with indices p and q
      root1 = find(p)
      root2 = find(q)

      return false if root1 == root2

      # merge smaller into larger group
      if groups_size[root1] < groups_size[root2]
        groups_size[root2] += groups_size[root1]
        groups_size[root1] = 0
        tracking_array[root1] = root2
      else
        groups_size[root1] += groups_size[root2]
        groups_size[root2] = 0
        tracking_array[root2] = root1
      end

      #@number_of_groups -= 1
      true
    end

    def compress_path!
      tracking_array.each_with_index  { |_, i| find(i) }
    end

    private

    def compress_path(node_index, root_index)
      while node_index != root_index #compress the path leading back to the root - path compression - it gives an amortized constant time complexity.
        next_index = tracking_array[node_index]
        tracking_array[node_index] = root_index
        node_index = next_index
      end
    end

    attr_reader :friends, :size
  end
end
