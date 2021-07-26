---
title: Programmers 가장 큰 정사각형 찾기
date: 2021-07-27 03:07:78
category: dynamic programming
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12905

## Solution

```py
from itertools import chain


def solution(board):
    for i in range(1, len(board)):
        for j in range(1, len(board[0])):
            if board[i][j] >= 1:
                # 대각선, 위, 왼쪽 확인
                board[i][j] = min(board[i - 1][j - 1], board[i - 1][j], board[i][j - 1]) + 1
    return max(list(chain.from_iterable(board))) ** 2


print(solution([[0, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 1, 0]]))
```
