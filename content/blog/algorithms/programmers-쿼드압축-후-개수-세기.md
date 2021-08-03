---
title: Programmers 쿼드압축 후 개수 세기
date: 2021-08-03 01:08:71
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/68936

## Solution

- 1의 수와 사각형의 넓이를 비교하여 문제를 해결할 수 있다.

```py
def solution(arr):
    _sum = 0
    for i in arr:
        _sum += sum(i)
    if _sum == 0:
        return [1, 0]
    elif _sum == len(arr) ** 2:
        return [0, 1]
    else:
        n = len(arr) // 2
        return [sum(i) for i in zip(*[solution([x[:n] for x in arr[:n]]),
                                      solution([x[n:] for x in arr[:n]]),
                                      solution([x[:n] for x in arr[n:]]),
                                      solution([x[n:] for x in arr[n:]])])]
```

- 다른 사람 풀이

```py
def solution(arr):
    answer = [0, 0]

    def check(size, x, y):
        if size == 1:
            answer[arr[y][x]] += 1
            return
        else:
            first = arr[y][x]

            for dy in range(size):
                for dx in range(size):
                    if first != arr[y + dy][x + dx]:
                        check(size // 2, x, y)
                        check(size // 2, x + size // 2, y)
                        check(size // 2, x, y + size // 2)
                        check(size // 2, x + size // 2, y + size // 2)
                        return
            answer[first] += 1

    check(len(arr), 0, 0)

    return answer
```
