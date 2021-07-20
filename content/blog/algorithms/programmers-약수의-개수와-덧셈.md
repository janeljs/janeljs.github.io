---
title: Programmers 약수의 개수와 덧셈
date: 2021-07-19 18:00:12
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/77884

## Solution

- 제곱수의 약수의 개수는 홀수이다.

```py
import math

def solution(left, right):
    answer = 0
    for i in range(left, right + 1):
        if math.sqrt(i) % 1 == 0:
            answer -= i
        else:
            answer += i
    return answer
```

- 다른 사람 풀이

```py
def solution(left, right):
    answer = 0
    for i in range(left,right+1):
        if int(i**0.5) == i**0.5:
            answer -= i
        else:
            answer += i
    return answer
```
