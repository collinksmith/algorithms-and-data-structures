# Detects any loop in a linked list
# O(n) time, O(1) space
def has_loop?(list)
  tortoise = list
  hare = list

  while hare.next && hare.next.next
    tortoise = tortoise.next
    hare = hare.next.next
    return true if tortoise == hare
  end

  false
end
