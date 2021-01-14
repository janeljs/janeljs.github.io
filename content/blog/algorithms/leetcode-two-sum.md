---
title: LeetCode Two Sum
date: 2021-01-13 16:01:79
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
```

## Constraints

```py
2 <= nums.length <= 103
-10^9 <= nums[i] <= 10^9
-10^9 <= target <= 10^9
Only one valid answer exists.
```

## Solution

```java
# 내 풀이

class Solution {
    public int[] twoSum(int[] nums, int target) {
        int[] answer = new int[2];
        outerloop:
        for (int i = 0; i < nums.length; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                int sum = nums[i] + nums[j];
                if (sum == target) {
                    answer[0] = i;
                    answer[1] = j;
                    break outerloop;
                }
            }
        }
        return answer;
    }
}
```

## Feedback

- Brute Force로 풀면 $O(n^2)$의 시간복잡도와 O(1)의 공간복잡도를 갖지만, 해시테이블을 이용하면 시간복잡도를 O(n)으로 줄일 수 있다. (대신 공간복잡도는 O(n)으로 증가한다.)

```java
// 풀이 1

public int[] twoSum(int[] nums, int target) {
    Map<Integer, Integer> map = new HashMap<>();
    for (int i = 0; i < nums.length; i++) {
        map.put(nums[i], i);
    }
    for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (map.containsKey(complement) && map.get(complement) != i) {
            return new int[] { i, map.get(complement) };
        }
    }
    throw new IllegalArgumentException("No two sum solution");
}
```

```java
// 풀이 2

public int[] twoSum(int[] nums, int target) {
    Map<Integer, Integer> map = new HashMap<>();
    for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (map.containsKey(complement)) {
            return new int[] { map.get(complement), i };
        }
        map.put(nums[i], i);
    }
    throw new IllegalArgumentException("No two sum solution");
}
```

#

**_Source_**

- https://leetcode.com/problems/two-sum/
