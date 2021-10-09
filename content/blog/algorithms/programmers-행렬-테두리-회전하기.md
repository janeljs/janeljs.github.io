---
title: Programmers 행렬 테두리 회전하기
date: 2021-08-12 02:08:61
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/77485

## Solution

```py
def solution(rows, columns, queries):
    answer = []
    board = []
    num = 0
    for i in range(rows):
        b = []
        for j in range(columns):
            num += 1
            b.append(num)
        board.append(b)

    for a, b, c, d in queries:
        x1, y1, x2, y2 = a - 1, b - 1, c - 1, d - 1
        removed = board[x1][y1]
        minimum = removed

        for x in range(x1, x2):
            # 위로 한 칸씩 올리기
            save = board[x + 1][y1]
            board[x][y1] = save
            minimum = min(minimum, save)

        for y in range(y1, y2):
            # 왼쪽으로 밀기
            save = board[x2][y + 1]
            board[x2][y] = save
            minimum = min(minimum, save)

        for x in range(x2, x1, -1):
            # 아래로 내리기
            save = board[x - 1][y2]
            board[x][y2] = save
            minimum = min(minimum, save)

        for y in range(y2, y1, -1):
            # 오른쪽으로 밀기
            save = board[x1][y - 1]
            board[x1][y] = save
            minimum = min(minimum, save)

        board[x1][y1 + 1] = removed
        answer.append(minimum)

    return answer
```

- java 풀이

```java
import java.util.Arrays;

class Solution {
    public int[] solution(int rows, int columns, int[][] queries) {
        int[] answer = new int[queries.length];
        int[][] matrix = new int[rows][columns];
        int data = 0;

        // 보드 채우기
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                data++;
                matrix[i][j] = data;
            }
        }

        int index = 0;
        for (int[] query : queries) {
            int x1 = query[0] - 1;
            int y1 = query[1] - 1;
            int x2 = query[2] - 1;
            int y2 = query[3] - 1;
            int removed = matrix[x1][y1];
            int min = removed;

            // 위로 밀기
            for (int x = x1; x < x2; x++) {
                int temp = matrix[x + 1][y1];
                matrix[x][y1] = temp;
                min = Math.min(min, temp);
            }

            // 왼쪽으로 밀기
            for (int y = y1; y < y2; y++) {
                int temp = matrix[x2][y + 1];
                matrix[x2][y] = temp;
                min = Math.min(min, temp);
            }

            // 아래로 밀기
            for (int x = x2; x > x1; x--) {
                int temp = matrix[x - 1][y2];
                matrix[x][y2] = temp;
                min = Math.min(min, temp);
            }

            // 우로 밀기
            for (int y = y2; y > y1; y--) {
                int temp = matrix[x1][y - 1];
                matrix[x1][y] = temp;
                min = Math.min(min, temp);
            }

            matrix[x1][y1 + 1] = removed;
            answer[index++] = min;
        }

        return answer;
    }
}
```

- 다른 사람 풀이

```py
def solution(rows, columns, queries):
    answer = []

    board = [[i+(j)*columns for i in range(1,columns+1)] for j in range(rows)]
    # print(board)

    for a,b,c,d in queries:
        stack = []
        r1, c1, r2, c2 = a-1, b-1, c-1, d-1


        for i in range(c1, c2+1):

            stack.append(board[r1][i])
            if len(stack) == 1:
                continue
            else:
                board[r1][i] = stack[-2]


        for j in range(r1+1, r2+1):
            stack.append(board[j][i])
            board[j][i] = stack[-2]

        for k in range(c2-1, c1-1, -1):
            stack.append(board[j][k])
            board[j][k] = stack[-2]

        for l in range(r2-1, r1-1, -1):
            stack.append(board[l][k])
            board[l][k] = stack[-2]

        answer.append(min(stack))


    return answer
```
