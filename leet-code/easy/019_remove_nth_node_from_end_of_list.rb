=begin
Title: Remove Nth Node From End of List
Difficulty: Easy
Percent correct: 28.0%

Given a linked list, remove the nth node from the end of list and return its head.


For example,


   Given linked list: 1->2->3->4->5, and n = 2.

   After removing the second node from the end, the linked list becomes 1->2->3->5.



Note:
Given n will always be valid.
Try to do this in one pass.
  Show Tags          Linked List        Two Pointers
=end

def remove_nth(list, n)
  list.delete_at(-n)
  list
end

p remove_nth([1,2,3,4,5], 2)