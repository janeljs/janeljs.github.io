---
title: 백준 9663번 N-Queen
date: 2021-09-07 22:09:32
category: brute force
thumbnail: { thumbnailSrc }
draft: false
---

- https://www.acmicpc.net/problem/9663

## Solution

- PyPy3으로 제출해야 시간 초과가 안 뜬다.

```py
import sys

n = int(sys.stdin.readline())
column = [0] * n
answer = 0


def check(r1, c1, r2, c2):
    if c1 == c2:
        return False
    if r1 - c1 == r2 - c2:
        return False
    if r1 + c1 == r2 + c2:
        return False
    return True


def solve(row):
    global answer
    # 퀸 n개를 다 놓음
    if row == n:
        answer += 1
    else:
        for col in range(n):
            possible = True
            for prev_row in range(row):
                if not check(row, col, prev_row, column[prev_row]):
                    possible = False
                    break
            if possible:
                # 각 인덱스가 row이고 row 별로 몇 번째 column에 여왕을 놓았는지 저장
                column[row] = col
                solve(row + 1)
                column[row] = 0


solve(0)
print(answer)
```

- 모범 풀이

```py
import sys
n = int(sys.stdin.readline())
col = [0 for _ in range(n)]
ans = 0

def attackable(r1, c1, r2, c2):
    if c1 == c2:
        return True
    if r1 - c1 == r2 - c2:
        return True
    if r1 + c1 == r2 + c2:
        return True
    return False

def rec_func(row):
    if row == n:
        global ans
        ans += 1
    else:
        for cand in range(n):
            possible = True
            for i in range(row):
                if attackable(row, cand, i, col[i]):
                    possible = False
                    break

            if possible:
                col[row] = cand
                rec_func(row + 1)
                col[row] = 0

rec_func(0)
print(ans)
```
