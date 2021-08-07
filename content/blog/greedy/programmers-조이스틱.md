---
title: Programmers 조이스틱
date: 2021-08-08 00:08:35
category: greedy
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42860

## Solution

- 1차 시도: 실패

```py
def solution(name):
    answer = 0
    location = []
    for n in name:
        location.append(min(ord(n) - ord('A'), ord('Z') - ord(n) + 1))

    idx = 0
    while True:
        answer += location[idx]
        location[idx] = 0
        if sum(location) == 0:
            break
        left = 1
        right = 1
        while location[idx - left] == 0:
            left += 1
        while location[idx + right] == 0:
            right += 1
        if left > right:
            answer += right
            idx += right
        else:
            answer += left
            idx -= left
    return answer
```

- 통과되는 코드
  - `left==right`인 경우에서 오른쪽으로 가야만 정답처리된다.

```py
def solution(name):
    answer = 0
    location = []
    for n in name:
        location.append(min(ord(n) - ord('A'), ord('Z') - ord(n) + 1))

    idx = 0
    while True:
        answer += location[idx]
        location[idx] = 0
        if sum(location) == 0:
            break
        left = 1
        right = 1
        while location[idx - left] == 0:
            left += 1
        while location[idx + right] == 0:
            right += 1
        if left > right:
            answer += right
            idx += right
        elif right > left:
            answer += left
            idx -= left
        else:
            answer += right
            idx += right
    return answer
```
