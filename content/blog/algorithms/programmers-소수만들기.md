---
title: Programmers 소수만들기
date: 2021-07-08 14:07:82
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12977

## Solution

```py
from itertools import combinations


def solution(nums):
    answer = 0
    for n1, n2, n3 in list(combinations(nums, 3)):
        if is_prime(n1 + n2 + n3):
            answer += 1
    return answer


def is_prime(n):
    if n == 2:
        return True
    if n == 1 or n % 2 == 0:
        return False
    # 짝수는 제외하고 검사
    for i in range(3, n, 2):
        if (n % i) == 0:
            return False
    return True

```

- 다른 사람 풀이

```py
from itertools import combinations


def prime_number(x):
    answer = 0
    for i in range(1, int(x ** 0.5) + 1):
        if x % i == 0:
            answer += 1
    return 1 if answer == 1 else 0


def solution(nums):
    return sum([prime_number(sum(c)) for c in combinations(nums, 3)])
```

- 코드 개선

```py
from itertools import combinations
import math


def is_prime(n):
    sqrt = math.sqrt(n)

    if sqrt < 2:
        return False

    for i in range(2, int(sqrt + 1)):
        if n % i == 0:
            return False
    return True


def solution(nums):
    answer = 0

    for c in combinations(nums, 3):
        if is_prime(sum(c)):
            answer += 1

    return answer
```

- [에라토스테네스의 체](https://wikidocs.net/21638)
