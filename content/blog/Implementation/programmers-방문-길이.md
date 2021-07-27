---
title: Programmers 방문 길이
date: 2021-07-28 02:07:21
category: implementation
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/49994

## Solution

```py
dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]
dir_type = ['L', 'R', 'U', 'D']
visited = set()


def solution(dirs):
    x, y = 0, 0
    answer = 0
    for dir in dirs:
        for i in range(4):
            if dir == dir_type[i]:
                nx = x + dx[i]
                ny = y + dy[i]
        if nx < -5 or ny < -5 or nx > 5 or ny > 5:
            continue

        if (x, y, nx, ny) not in visited:
            visited.add((x, y, nx, ny))
            visited.add((nx, ny, x, y))
            answer += 1
        x, y = nx, ny
    print(answer)
    return answer
```

- 다른 사람 풀이

```py
def solution(dirs):
    s = set()
    d = {'U': (0,1), 'D': (0, -1), 'R': (1, 0), 'L': (-1, 0)}
    x, y = 0, 0
    for i in dirs:
        nx, ny = x + d[i][0], y + d[i][1]
        if -5 <= nx <= 5 and -5 <= ny <= 5:
            s.add((x,y,nx,ny))
            s.add((nx,ny,x,y))
            x, y = nx, ny
    return len(s)//2
```
