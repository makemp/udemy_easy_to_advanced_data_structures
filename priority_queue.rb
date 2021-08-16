class PriorityQueue # Min Version
  def initialize(heap: [])
    @heap = heap
    @sorted = false
  end

  def empty?
    heap.empty?
  end

  def clear
    @heap = heap.class.new
  end

  def size
    heap.size
  end

  def peek
    sort
    heap[0]
  end

  def poll
    sort
    swap(0, -1)
    sorted = false
    heap.pop
  end

  def contains?(obj)
    heap.include?(obj)
  end

  def add(obj)
    sorted = false
    heap.push(obj)
  end

  def inspect
    heap.inspect
  end

  def test_implementation
    sort
    heap.each_with_index do |el, index|
      left = heap[left_index(index)]
      right = heap[right_index(index)]
      check_left = left.nil? || el <= left
      check_right = right.nil? || el <= right

      raise 'SOMETHING WRONG!' if !check_left || !check_right
    end
  end

  private

  def left_index(index)
    2 * index + 1
  end

  def right_index(index)
    2 * index + 2
  end

  def left_smaller?(index)
    l = heap[left_index(index)]
    return false if l.nil?
    l < heap[index]
  end

  def right_smaller?(index)
    r = heap[right_index(index)]
    return false if r.nil?
    r < heap[index]
  end

  def sort
    return if sorted
    changed = false
    heap.each_with_index do |_, index|
      if left_smaller?(index)
        changed = true
        swap(index, left_index(index))
      elsif right_smaller?(index)
        changed = true
        swap(index, right_index(index))
      end
    end
    return sort if changed
    sorted = true
  end

  def swap(parent_index, child_index)
    parent_value = heap[parent_index]
    heap[parent_index] = heap[child_index]
    heap[child_index] = parent_value
  end

  attr_accessor :sorted
  attr_reader :heap
end
