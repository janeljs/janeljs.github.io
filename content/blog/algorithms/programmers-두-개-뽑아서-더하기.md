---
title: Programmers 두 개 뽑아서 더하기
date: 2021-07-20 12:07:00
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/68644

## Solution

```py
from itertools import combinations

def solution(numbers):
    answer = []

    com = combinations(numbers, 2)

    for x, y in list(com):
        answer.append(x+y)

    return sorted(list(set(answer)))
```

- 다른 사람 풀이

```py
def solution(numbers):
    answer = []
    for i in range(len(numbers)):
        for j in range(i+1, len(numbers)):
            answer.append(numbers[i] + numbers[j])
    return sorted(list(set(answer)))
```
