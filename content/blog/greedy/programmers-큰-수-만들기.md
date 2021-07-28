---
title: Programmers 큰 수 만들기
date: 2021-07-29 03:07:64
category: greedy
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42883

## Solution

```py
def solution(number, k):
    answer = []

    for i in range(len(number)):
        # 가장 큰 숫자가 첫 자리에 오도록
        # 현재 숫자보다 마지막에 들어있는 숫자가 작다면 계속 pop을 해준다.
        while k > 0 and answer and answer[-1] < number[i]:
            answer.pop(-1)
            k -= 1

        # 숫자를 안 빼도 되면 뒤에있는 숫자를 전부 붙여준다.
        if k == 0:
            answer += number[i:]
            break

        answer.append(number[i])

    if k > 0:
        answer = answer[:-k]

    return ''.join(answer)
```
