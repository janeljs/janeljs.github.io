---
title: Leetcode Two Sum
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
Constraints:

2 <= nums.length <= 103
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.
```

## Solution

```python

# 내 풀이

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

```python

# 다른 사람 풀이


```

#

**_Source_**

-
