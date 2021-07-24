---
title: Programmers 하샤드 수
date: 2021-07-25 00:07:57
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12947

## Solution

```py
def solution(x):
    return True if x % int(sum(list(map(int, list(str(x)))))) == 0 else False
```

- 다른 사람 풀이

```py
def Harshad(n):
    return n % sum([int(c) for c in str(n)]) == 0
```
