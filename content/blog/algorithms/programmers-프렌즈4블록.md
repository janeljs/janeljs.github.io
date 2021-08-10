---
title: Programmers 프렌즈4블록
date: 2021-08-09 11:08:53
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17679

## Solution

- 1차 시도: 엣지케이스로 제시된 테스트 케이스 13개 모두 통과하지만 일부 테스트케이스에서 시간 초과가 난다. 짜놓은 알고리즘을 보면 당연한 결과...

```py
def solution(m, n, board):
    global count
    board = [list(x) for x in board]
    while True:
        before = count(board, m, n)
        print(board)
        for i in range(m - 1):
            for j in range(n - 1):
                checkfour(m, n, i, j, board)
                realign(m, n, board)
        after = count(board, m, n)
        print(board)
        if before == after:
            return after


def count(board, m, n):
    num = 0
    for i in range(m):
        for j in range(n):
            if board[i][j] == 0:
                num += 1
    return num


def checkfour(m, n, i, j, board):
    if i > m - 2 or j > n - 2:
        return
    if board[i][j] == board[i][j + 1] == board[i + 1][j] == board[i + 1][j + 1]:
        checkfour(m, n, i, j + 1, board)
        checkfour(m, n, i + 1, j, board)
        checkfour(m, n, i + 1, j + 1, board)
        board[i][j] = 0
        board[i][j + 1] = 0
        board[i + 1][j] = 0
        board[i + 1][j + 1] = 0


def realign(m, n, board):
    for i in range(m - 1):
        for j in range(n):
            if board[i][j] == 0:
                continue
            if board[i + 1][j] == 0:
                board[i + 1][j] = board[i][j]
                board[i][j] = 0
    return board


print(solution(4, 4, ["ABCD", "BACE", "BCDD", "BCDD"]))
```

- 2차 시도

```py
def solution(m, n, board):
    answer = 0
    board = [list(x) for x in board]

    while True:
        mark = [[0] * n for _ in range(m)]
        for i in range(m - 1):
            for j in range(n - 1):
                # 같은 모양이 4개면 1로 표시
                if board[i][j] != 0 and board[i][j] == board[i][j + 1] == board[i + 1][j] == board[i + 1][j + 1]:
                    mark[i][j], mark[i][j + 1], mark[i + 1][j], mark[i + 1][j + 1] = 1, 1, 1, 1

        removed = 0
        for i in range(m):
            removed += sum(mark[i])
        # 지워진 블록의 수를 더한다.
        answer += removed
        if removed == 0:
            break

        # 블록 내리기
        for i in range(m - 1, -1, -1):
            for j in range(n):
                if mark[i][j] == 1:
                    idx = i - 1
                    while idx >= 0 and mark[idx][j] == 1:
                        idx -= 1
                    if idx < 0:
                        board[i][j] = 0
                    else:
                        board[i][j] = board[idx][j]
                        mark[idx][j] = 1

    return answer
```

- 다른 사람 풀이

```py
def solution(m, n, board):
    x = board
    x2 =[]

    for i in x:
        x1 = []
        for i2 in i:
            x1.append(i2)
        x2.append(x1)

    point = 1
    while point != 0:
        list = []
        point = 0
        for i in range(m - 1):
            for j in range(n - 1):
                if x2[i][j] == x2[i][j + 1] == x2[i + 1][j] == x2[i + 1][j + 1] != '팡!':
                    list.append([i, j])
                    point += 1

        for i2 in list:
            i, j = i2[0], i2[1]
            x2[i][j], x2[i][j + 1], x2[i + 1][j], x2[i + 1][j + 1] = '팡!', '팡!', '팡!', '팡!'

        for i3 in range(m):
            for i in range(m - 1):
                for j in range(n):
                    if x2[i + 1][j] == '팡!':
                        x2[i + 1][j], x2[i][j] = x2[i][j], '팡!'

    cnt = 0
    for i in x2:
        cnt += i.count('팡!')
    return cnt
```
