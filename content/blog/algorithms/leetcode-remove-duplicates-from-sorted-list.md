---
title: LeetCode Remove Duplicates from Sorted List
date: 2021-01-14 10:01:12
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

Input: head = [1,1,2,3,3]
Output: [1,2,3]
```

## Constraints

```py
The number of nodes in the list is in the range [0, 300].
-100 <= Node.val <= 100
The list is guaranteed to be sorted in ascending order.
```

## Solution

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode deleteDuplicates(ListNode head) {
        ListNode current = head;
        while(current != null) {
            ListNode save = current;
            while(save.next != null) {
                save = save.next;
                if (current.val == save.val) {
                    current.next = save.next;
                }
            }
            current = current.next;
        }
        return head;
    }
}
```

## Feedback

```java
public ListNode deleteDuplicates(ListNode head) {
    ListNode current = head;
    while (current != null && current.next != null) {
        if (current.next.val == current.val) {
            current.next = current.next.next;
        } else {
            current = current.next;
        }
    }
    return head;
}
```

#

**_Source_**

- https://leetcode.com/problems/remove-duplicates-from-sorted-list/
