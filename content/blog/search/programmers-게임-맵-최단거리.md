---
title: Programmers 게임 맵 최단거리
date: 2021-08-13 01:08:00
category: search
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/1844

## Solution

- [Programmers 거리두기 확인하기](https://janeljs.github.io/algorithms/programmers-%EA%B1%B0%EB%A6%AC%EB%91%90%EA%B8%B0-%ED%99%95%EC%9D%B8%ED%95%98%EA%B8%B0/)랑 비슷한 문제이다.
- bfs에 조금은 더 익숙해진 것 같다.

```py
from collections import deque

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]


def solution(maps):
    n = len(maps)
    m = len(maps[0])

    queue = deque([[0, 0]])
    visited = [[0] * m for _ in range(n)]

    while queue:
        y, x = queue.popleft()

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]

            if 0 <= nx < m and 0 <= ny < n and visited[ny][nx] == 0:
                if maps[ny][nx] == 1:
                    queue.append([ny, nx])
                    visited[ny][nx] = visited[y][x] + 1

    if visited[-1][-1] == 0:
        return -1
    answer = visited[-1][-1] + 1
    return answer
```

- 다른 사람 풀이

```py
from collections import deque


def solution(maps):
    x_move = [1, 0, -1, 0]
    y_move = [0, 1, 0, -1]

    x_h, y_h = (len(maps[0]), len(maps))
    queue = deque([(0, 0, 1)])

    while queue:
        x, y, d = queue.popleft()

        for i in range(4):
            nx = x + x_move[i]
            ny = y + y_move[i]

            if nx > -1 and ny > -1 and nx < x_h and ny < y_h:
                if maps[ny][nx] == 1 or maps[ny][nx] > d + 1:
                    maps[ny][nx] = d + 1
                    # 도착한 시점에 끝내버리자.
                    if nx == x_h - 1 and ny == y_h - 1:
                        return d + 1

                    queue.append((nx, ny, d + 1))

    return -1
```
