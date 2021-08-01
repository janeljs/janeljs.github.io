---
title: Programmers H-Index
date: 2021-08-02 02:08:50
category: sorting
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42747

## Solution

```py
def solution(citations):
    citations.sort()
    h = 0
    for i in range(max(citations)):
        a = len([x for x in citations if x >= i])
        if i <= a:
            h = i
    return h
```

- 다른 사람 풀이

```py
def solution(citations):
    citations.sort(reverse=True)
    answer = max(map(min, enumerate(citations, start=1)))
    return answer
```
