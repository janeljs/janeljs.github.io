---
title: Programmers 점프와 순간 이동
date: 2021-08-09 11:08:34
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12980

## Solution

```py
def solution(n):
    ans = 0

    while n > 0:
        if n % 2 == 0:
            n /= 2
        else:
            ans += 1
            n -= 1

    return ans
```

- 다른 사람 풀이

```py
def solution(n):
    return bin(n).count('1')
```
