require_relative 'priority_queue'

pq = PriorityQueue.new

pq.add(9)
pq.add(4)
pq.add(6)
pq.add(5)
pq.add(1)
pq.add(2)
pq.add(3)
pq.add(15)
pq.add(65)
pq.poll
pq.add(2)
pq.add(-4)

puts pq.inspect
