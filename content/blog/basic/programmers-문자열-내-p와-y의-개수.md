---
title: Programmers 문자열 내 p와 y의 개수
date: 2021-07-24 03:07:64
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12916

## Solution

```py
def solution(s):
    s = s.lower()
    if s.count('p') == s.count('y'):
        return True
    return False
```

- 다른 사람 풀이

```py
def numPY(s):
    return s.lower().count('p') == s.lower().count('y')
```
