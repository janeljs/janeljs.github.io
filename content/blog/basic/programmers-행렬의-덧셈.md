---
title: Programmers 행렬의 덧셈
date: 2021-07-25 01:07:21
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12950

## Solution

```py
def solution(arr1, arr2):
    n = len(arr1)
    m = len(arr1[0])
    for i in range(n):
        for j in range(m):
            arr1[i][j] += arr2[i][j]
    return arr1
```

- 다른 사람 풀이

```py
def sumMatrix(A,B):
    answer = [[c + d for c, d in zip(a, b)] for a, b in zip(A,B)]
    return answer
```
