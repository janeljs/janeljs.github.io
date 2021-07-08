---
title: Programmers 예산
date: 2021-07-08 22:07:28
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12982

## Solution

```py
def solution(d, budget):
    answer = 0
    d.sort()
    while budget > 0:
        if (budget - d[0] >= 0):
            budget -= d[0]
            answer += 1
            d.pop(0)
        if len(d) == 0 or budget < min(d):
            break
    return answer
```

- 신청 총액이 예산보다 더 작아질 때까지 지원못하는 부서를 리스트에서 제외하면 더 간결하게 풀 수 있다.

```py
def solution(d, budget):
    d.sort()
    while budget < sum(d):
        d.pop()
    return len(d)
```
