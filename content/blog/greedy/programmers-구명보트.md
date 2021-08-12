---
title: Programmers 구명보트
date: 2021-08-13 00:08:00
category: greedy
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42885#

## Solution

- 1차 시도 : 실패
  - 실패하는 케이스 : `[10, 20, 30, 40, 50, 60, 70, 80, 90], 100`, `5`

```py
from collections import deque


def solution(people, limit):
    people.sort(reverse=True)
    people = deque(people)
    answer = 0
    while people:
        boat = people[0]
        count = 1
        for i in range(len(people) - 1, 0, -1):
            boat += people[i]
            count += 1
            if boat > limit:
                boat -= people[i]
                count -= 1
                break
        for _ in range(count):
            people.popleft()
        answer += 1
    return answer
```

- 2차 시도

```py
def solution(people, limit):
    answer = 0
    people.sort(reverse=True)
    left = 0
    right = len(people) - 1

    while (left < right):
        # 가장 큰 수와 가장 작은 수를 더했을 때
        sum = people[left] + people[right]
        # 합이 limit보다 크다면
        if sum > limit:
            # 큰 수만 배에 태운다.
            left += 1
        # 작다면
        else:
            # 두 수 모두 배에 태우고 인덱스를 업데이트
            left += 1
            right -= 1
        # 배의 수 증가
        answer += 1
    # 남은 사람도 태워준다.
    if left == right:
        answer += 1
    return answer
```

- 다른 사람 풀이

```py
def solution(people, limit) :
    answer = 0
    people.sort()

    a = 0
    b = len(people) - 1
    while a < b :
        if people[b] + people[a] <= limit:
            a += 1
            answer += 1
        b -= 1
    return len(people) - answer
```
