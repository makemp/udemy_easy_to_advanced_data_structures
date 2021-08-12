require_relative 'priority_queue'

pq = PriorityQueue.new(heap: ((1..999).to_a + (1..999).to_a).reverse)

pq.test_implementation


puts pq.poll
puts pq.poll
puts pq.poll
puts pq.poll

puts pq.inspect
