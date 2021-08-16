require_relative 'priority_queue'

pq = PriorityQueue.new(heap: ((1..9999).to_a + (1..9999).to_a).reverse)


pq.add(123)
pq.add(7)
pq.add(6754)

pq.test_implementation

pq.poll
pq.poll
pq.add(0)
pq.poll
pq.poll

pq.test_implementation


pq.inspect
