---
title: Programmers 폰겟몬
date: 2021-07-13 18:07:43
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/1845

## Solution

```py
def solution(nums):
    max = len(nums) // 2
    nums = list(set(nums))
    return min(max, len(nums))
```
