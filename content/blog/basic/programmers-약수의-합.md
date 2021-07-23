---
title: Programmers 약수의 합
date: 2021-07-24 05:07:81
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12928

## Solution

```py
def solution(n):
    answer = 0

    for i in range(1, n // 2 + 1):
        if (n % i == 0):
            answer += i

    return answer + n
```

- 다른 사람 풀이

```py
def sumDivisor(num):
    return num + sum([i for i in range(1, (num // 2) + 1) if num % i == 0])
```
