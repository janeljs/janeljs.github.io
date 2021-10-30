---
title: Programmers 방문 길이
date: 2021-10-30 22:10:78
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/49994

## Solution

```java
import java.util.*;

class Solution {

    int[][] moves = {{0, -1}, {0, 1}, {-1, 0}, {1, 0}};
    char[] commands = {'L', 'R', 'U', 'D'};
    Set<Point> visited = new HashSet<>();

    static class Point {
        private int x;
        private int y;
        private int nx;
        private int ny;

        public Point(int x, int y, int nx, int ny) {
            this.x = x;
            this.y = y;
            this.nx = nx;
            this.ny = ny;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Point point = (Point) o;
            return x == point.x && y == point.y && nx == point.nx && ny == point.ny;
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y, nx, ny);
        }
    }

    public int solution(String dirs) {
        int x = 0, y = 0, nx = 0, ny = 0, answer = 0;

        for (int i = 0; i < dirs.length(); i++) {
            for (int j = 0; j < moves.length; j++) {
                if (dirs.charAt(i) == commands[j]) {
                    nx = x + moves[j][0];
                    ny = y + moves[j][1];
                }
            }
            if (nx < -5 || ny < -5 || nx > 5 || ny > 5) continue;

            Point p1 = new Point(x, y, nx, ny);
            Point p2 = new Point(nx, ny, x, y);

            if (!visited.contains(p1)) {
                visited.add(p1);
                visited.add(p2);
                answer++;
            }
            x = nx;
            y = ny;
        }

        return answer;
    }
}
```
