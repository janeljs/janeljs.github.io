---
title: 이코테 Chapter 4 구현 (1)
date: 2021-01-25 06:01:15
category: implementation
thumbnail: { thumbnailSrc }
draft: false
---

## 구현 알고리즘

- 주로 알고리즘은 간단한데 긴 코드를 작성해야 하는 문제, 특정 소수점 자리까지 출력해야 하는 문제, 파싱해야 하는 문제 등이 나온다.
- 언어별 표준 라이브러리를 익혀두는 것이 유용하다.
- 완전탐색: 모든 경우의 수를 계산
- 시뮬레이션: 문제에서 제시한 알고리즘을 한 단계씩 직접 구현
- 주의사항
  - java의 경우 int 자료형의 범위가 넘어가면 long이나 BigInteger를 사용해야 한다.
  - python에서 리스트를 이용할 때 메모리 제한에 주의해야 한다.

## 예제 1: 상하좌우

- $O(N)$의 시간복잡도를 갖는다.
- Simulation 유형
- 풀이 방법
  1. 배열에 이동 방향에 따른 cmd, x, y 좌표 변화, move_type을 모두 저장한다.
  2. 입력받은 명령을 순회하면서 move_type과 cmd가 일치할 경우 nx와 ny에 그 값을 저장한다.
  3. 좌표값이 범위에 있는지 확인하고, 범위에 있다면 x, y좌표를 갱신해준다.

### Testcase

```py
5
R R R U D D
# 3 4
```

### Solution

```py
# N 입력받기
n = int(input())
x, y = 1, 1
plans = input().split()

# L, R, U, D에 따른 이동 방향
dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]
move_types = ['L', 'R', 'U', 'D']

# 이동 계획을 하나씩 확인
for plan in plans:
    # 이동 후 좌표 구하기
    for i in range(len(move_types)):
        if plan == move_types[i]:
            nx = x + dx[i]
            ny = y + dy[i]
    # 공간을 벗어나는 경우 무시
    if nx < 1 or ny < 1 or nx > n or ny > n:
        continue
    # 이동 수행
    x, y = nx, ny

print(x, y)
```

- 기본 예제를 익히기 위해 자바로 다시 짜보았다.
- 모범 풀이와 다른 점은 주석을 달아놓았다.
- 추가 테스트케이스를 돌려보았는데 통과되었다.

### Testcase 1

```py
6
R R U D R U
# 1 4
```

### Testcase 2

```py
10
D D D U R R L L R U
# 2 2
```

### Solution

```java
class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();
        int x = 1;
        int y = 1;  // int x = 1, y = 1; 식으로 선언해줘도 된다.
        String[] plans = sc.nextLine().split(" ");
        int[] dx = {0, 0, -1, 1};
        int[] dy = {-1, 1, 0, 0};
        String[] move_types = {"L", "R", "U", "D"}; // char[] moveTypes = {'L', 'R', 'U', 'D'};
        int nx = 0;
        int ny = 0;
        for (String plan : plans) {
            // int nx = -1, ny = -1;
            for (int i = 0; i < move_types.length; i++) {
                if (plan.equals(move_types[i])) {
                    nx = x + dx[i];
                    ny = y + dy[i];
                }
            }
            if (nx < 1 || ny < 1 || nx > n || ny > n) {
                continue;
            }
            x = nx;
            y = ny;
        }
        System.out.println(x + " " + y);
    }
}
```

## 예제 2: 시각

- 완전 탐색(Brute Forcing) 유형
- 가능한 경우의 수를 모두 검사하면 된다.
- 탐색을 해야 할 전체 데이터의 개수가 100만 개 이하일 때 사용하기 적절하다.
- 풀이 방법
  1. 매 시각을 문자열로 바꾼 다음 해당 문자열에 '3'이 포함되어 있는지 확인한다.
  2. 3이 포함되어 있다면 count에 1을 더해준 뒤, 최종 count값을 출력하면 된다.

### Testcase

```py
5
# 11475
```

### Solution

```py
# H를 입력받기
h = int(input())

count = 0
for i in range(h + 1):
    for j in range(60):
        for k in range(60):
            # 매 시각 안에 '3'이 포함되어 있다면 카운트 증가
            if '3' in str(i) + str(j) + str(k):
                count += 1

print(count)
```

- 마찬가지로 java로 고쳐서 풀어보았다.
- 추가 테스트케이스도 돌려봤는데 통과되었다.

### Testcase 1

```py
12
# 22500
```

### Testcase 2

```py
23
# 43875
```

### Solution

```java
class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int h = sc.nextInt();
        int count = 0;
        for (int i = 0; i < h + 1; i++) {
            for (int j = 0; j < 60; j++) {
                for (int k = 0; k < 60; k++) {
                    String s = i + " " + j + " " + k + " ";
                    if (s.indexOf('3') != -1) {
                        count++;
                    }
                }
            }
        }
        System.out.println(count);
    }
}
```

- 모범 java 코드는 check라는 메서드를 만들었는데 내 풀이가 더 간단한 느낌이다.

```java
import java.util.*;

public class Main {

    // 특정한 시각 안에 '3'이 포함되어 있는지의 여부
    public static boolean check(int h, int m, int s) {
        if (h % 10 == 3 || m / 10 == 3 || m % 10 == 3 || s / 10 == 3 || s % 10 == 3)
            return true;
        return false;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // H를 입력받기
        int h = sc.nextInt();
        int cnt = 0;

        for (int i = 0; i <= h; i++) {
            for (int j = 0; j < 60; j++) {
                for (int k = 0; k < 60; k++) {
                    // 매 시각 안에 '3'이 포함되어 있다면 카운트 증가
                    if (check(i, j, k)) cnt++;
                }
            }
        }

        System.out.println(cnt);
    }

}
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
