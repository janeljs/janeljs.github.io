---
title: Programmers 거리두기 확인하기
date: 2021-08-11 22:08:66
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/81302

## Solution

- 파티션이 있는 칸을 제외하고 각 칸을 정점으로 연결되어있는 그래프 문제라고 생각하면 된다.
- bfs를 시도해보자.

```py
from collections import deque

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]


def bfs(place):
    # 시작점이 되는 P 좌표 배열
    starts = []
    for i in range(5):
        for j in range(5):
            if place[i][j] == 'P':
                starts.append([i, j])

    for start in starts:
        queue = deque([start])
        visited = [[0] * 5 for _ in range(5)]
        distance = [[0] * 5 for _ in range(5)]
        visited[start[0]][start[1]] = 1

        while queue:
            y, x = queue.popleft()

            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]

                # 이동 범위 내에 있고 방문하지 않았다면
                if 0 <= nx < 5 and 0 <= ny < 5 and visited[ny][nx] == 0:

                    # 책상일 경우
                    if place[ny][nx] == 'O':
                        # 시작점 queue에 추가
                        queue.append([ny, nx])
                        visited[ny][nx] = 1
                        distance[ny][nx] = distance[y][x] + 1

                    # 맨해튼 거리가 2이하면 방역수칙 위반
                    if place[ny][nx] == 'P' and distance[y][x] < 2:
                        return 0
    return 1


def solution(places):
    answer = []

    for place in places:
        answer.append(bfs(place))

    return answer
```

- 아래는 실패한 풀이... 얼마나 멍청했는지 반성하는 의미로 기록

```py
def solution(places):
    answers = []

    for i in range(len(places)):
        for j in range(len(places[i])):
            places[i][j] = list(places[i][j])

    for i in range(len(places)):
        answer = []
        save = []
        for j in range(len(places[i])):
            for z in range(len(places[i][j])):
                if places[i][j][z] == 'P':
                    if len(save) == 0:
                        save.append(j)
                        save.append(z)
                    elif len(save) == 2:
                        save.append(j)
                        save.append(z)
                    elif len(save) == 4:
                        distance = getdistance(save)
                        if distance == 1:
                            answer.append(0)
                            break
                        elif distance == 2:
                            if save[0] == save[2]:
                                if places[i][j - 1][z] == 'X':
                                    answer.append(1)
                                else:
                                    answer.append(0)
                                    break
                            elif save[1] == save[3]:
                                if places[i][j][z - 1] == 'X':
                                    answer.append(1)
                                else:
                                    answer.append(0)
                                    break
                            else:
                                if (save[0] < save[2] and places[i][j][z - 1] == 'X' and places[i][j - 1][z] == 'X') or \
                                        places[i][j - 1][z] == 'X' and places[i][j][z + 1] == 'X':
                                    answer.append(1)
                                else:
                                    answer.append(0)
                                    break
                        else:
                            answer.append(1)
        if answer.count(0) > 0:
            answers.append(0)
        else:
            answers.append(1)
    return answers


def getdistance(save):
    return abs(save[0] - save[2]) + abs(save[1] - save[3])
```
