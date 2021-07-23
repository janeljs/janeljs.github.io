---
title: Programmers 정수 내림차순으로 배치하기
date: 2021-07-24 05:07:99
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12933

## Solution

```py
def solution(n):
    answer = sorted(list(map(int, list(str(n)))), reverse = True)
    answer = ''.join([str(x) for x in answer])
    return int(answer)
```

- 다른 사람 풀이

```py
def solution(n):
    ls = list(str(n))
    ls.sort(reverse = True)
    return int("".join(ls))
```
