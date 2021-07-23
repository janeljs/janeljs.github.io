---
title: Programmers 카카오 프렌즈 컬러링북
date: 2021-07-23 18:07:41
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/1829

## Solution

- [BFS (Breath-First Search)](https://janeljs.github.io/search/dfs-bfs-basic-3/)

```py
from collections import deque

dy = [-1, 0, 1, 0]
dx = [0, 1, 0, -1]


def solution(m, n, picture):
    number_of_area = 0
    max_size_of_one_area = 0
    global visited

    visited = [[False] * n for _ in range(m)]

    for i in range(m):
        for j in range(n):
            # 방문 표시도 안 되었고 그림에 색도 칠해져 있을 때
            if (not visited[i][j]) and picture[i][j] != 0:
                max_size_of_one_area = max(max_size_of_one_area, bfs(i, j, picture, m, n))
                number_of_area += 1
    return number_of_area, max_size_of_one_area


def bfs(i, j, picture, m, n):
    count = 1
    pixel = picture[i][j]
    queue = deque()
    queue.append((i, j))

    visited[i][j] = True
    while queue:
        y, x = queue.popleft()
        for idx in range(4):
            nextY, nextX = y + dy[idx], x + dx[idx]
            if 0 <= nextY < m and 0 <= nextX < n and not visited[nextY][nextX] and pixel == picture[nextY][nextX]:
                queue.append((nextY, nextX))
                visited[nextY][nextX] = True
                count += 1
    return count


print(solution(6, 4, [[1, 1, 1, 0], [1, 2, 2, 0], [1, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 3], [0, 0, 0, 3]]))
print(solution(6, 4, [[1, 1, 1, 0], [1, 1, 1, 0], [0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 1]]))
```
