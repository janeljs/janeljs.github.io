---
title: Programmers 땅따먹기
date: 2021-07-26 01:07:88
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12913

## Solution

- 1차 시도 : 실패
  - 해당 행과 전 행의 관계만 살피기 때문에 5, 8, 4와 같이 선택하는 경우의 수가 생긴다.

```py
def solution(land):
    sum = 0
    answer = [0] * 4
    for i in range(1, len(land) + 1):
        for j in range(4):
            answer[j] += max(land[i - 1][:j] + land[i - 1][j + 1:])
    print(answer)
    return max(answer)

solution([[1, 2, 3, 5], [5, 6, 7, 8], [4, 3, 2, 1]])
```

- 2차 시도
  ![image](https://user-images.githubusercontent.com/68000537/126907228-f92051fb-6b4e-474e-9417-96117352d2ad.png)

```py
def solution(land):
    sum = 0

    for i in range(1, len(land)):
        for j in range(4):
            land[i][j] += max(land[i-1][:j]+ land[i-1][j+1:])

    return max(land[-1])
```
