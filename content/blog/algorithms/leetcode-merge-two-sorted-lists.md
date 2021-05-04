---
title: LeetCode Merge Two Sorted Lists
date: 2021-05-05 01:05:79
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.
```

## Constraints

- The number of nodes in both lists is in the range [0, 50].
- -100 <= Node.val <= 100
- Both l1 and l2 are sorted in non-decreasing order.

## Solution

```java
class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode answer = null;

        if (l1 == null) {
            answer = l2;
        } else if (l2 == null) {
            answer = l1;
        } else if (l1.val < l2.val) {
            answer = l1;
            l1.next = mergeTwoLists(l1.next, l2);
        } else {
            answer = l2;
            l2.next =  mergeTwoLists(l1, l2.next);
        }

        return answer;
    }
}
```

#

**_Source_**

- https://leetcode.com/problems/merge-two-sorted-lists/
