---
title: Programmers 주식가격
date: 2021-07-28 03:07:26
category: stack
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42584

## Solution

```py
def solution(prices):
    n = len(prices)
    answer = [0] * n
    for i in range(n):
        for j in range(i + 1, n):
            answer[i] += 1
            if prices[j] < prices[i]:
                break
    return answer
```

- 다른 사람 풀이 1

```py
from collections import deque


def solution(prices):
    answer = []
    prices = deque(prices)
    while prices:
        c = prices.popleft()

        count = 0
        for i in prices:
            if c > i:
                count += 1
                break
            count += 1

        answer.append(count)

    return answer
```

- 다른 사람 풀이 2

```py
def solution(p):
    ans = [0] * len(p)
    stack = [0]
    for i in range(1, len(p)):
        if p[i] < p[stack[-1]]:
            for j in stack[::-1]:
                if p[i] < p[j]:
                    ans[j] = i-j
                    stack.remove(j)
                else:
                    break
        stack.append(i)
    for i in range(0, len(stack)-1):
        ans[stack[i]] = len(p) - stack[i] - 1
    return ans
```
