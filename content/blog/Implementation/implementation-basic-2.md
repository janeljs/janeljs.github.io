---
title: 이코테 Chapter 4 구현 알고리즘 (2)
date: 2021-01-24 06:01:47
category: implementation
thumbnail: { thumbnailSrc }
draft: false
---

> 구현 알고리즘의 개념 및 기초 예제는 [이코테 Chapter 4 구현 알고리즘](https://janeljs.github.io/Implementation/implementation-basic/)에서 확인할 수 있다.

## 실전 문제 1: 왕실의 나이트

- 테스트케이스가 하나밖에 없으니 불안하다.  
  (내 풀이는 백준에서 한 번에 통과된 적이 거의 없기 때문...😂)
- 자동적으로 테스트케이스를 생성해주는(?) 방법도 있을 것 같아 test case generator를 구글링하다가 [Test Case Generator](http://test-case-generator.herokuapp.com/)라는 사이트를 찾았다.
- 그런데 문제마다 입력 조건이 달라 사이트를 이용하면 세부적으로 설정해야 할 것이 많았다.
- 그냥 테스트케이스를 생성하는 코드를 내가 만드는 게 더 좋을 것 같다. 천 개쯤은 한 번에 만들고 싶은데 가능할까?  
  (뭔가 좋은 글감인 것 같아 알게되면 [velog](https://velog.io/@janeljs)에 정리해봐야겠다.)

### Solution

- 금방 풀었다. 아직 책 앞쪽이라 난이도가 쉬운 것 같다.
- 테케 자동생성 시도하다가 실패하고 5개 정도만 테스트해봤는데 통과가 되었다.
- 테케 생성하는 법 아시는 분 댓글로 알려주시면 감사드려요🙏

```py
# 내 풀이

cmd = input()
x, y = int(cmd[1]), ord(cmd[0]) - 96

move = [(-2, 1), (-1, 2), (1, 2), (2, 1), (-2, -1), (2, -1), (-1, -2), (1, -2)]
count = 0
for p in move:
    nx = x + p[0]
    ny = y + p[1]
    if nx < 1 or ny < 1 or nx > 8 or ny > 8:
        continue
    count += 1

print(count)
```

- 모범 풀이는 아래와 같다.

```py
# 현재 나이트의 위치 입력받기
input_data = input()
row = int(input_data[1])
column = int(ord(input_data[0])) - int(ord('a')) + 1

# 나이트가 이동할 수 있는 8가지 방향 정의
steps = [(-2, -1), (-1, -2), (1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1)]

# 8가지 방향에 대하여 각 위치로 이동이 가능한지 확인
result = 0
for step in steps:
    # 이동하고자 하는 위치 확인
    next_row = row + step[0]
    next_column = column + step[1]
    # 해당 위치로 이동이 가능하다면 카운트 증가
    if next_row >= 1 and next_row <= 8 and next_column >= 1 and next_column <= 8:
        result += 1

print(result)
```

## 실전 문제 2: 게임 개발

- 쉽다고 생각 하자마자 어려워졌다.

### Testcase 1

```py
4 4
1 1 0
1 1 1 1
1 0 0 1
1 1 0 1
1 1 1 1
# 3
```

- 예시 테스트케이스를 통과했는데 뭔가 찜찜해서 추가 케이스를 돌려보았는데 다행히 통과가 된다.

### Testcase 2

```py
6 6
3 2 2
1 1 1 1 1 1
1 1 0 0 0 1
1 0 0 0 0 1
1 1 1 0 0 1
1 1 1 0 0 1
1 1 1 1 1 1
# 11
```

### Solution

```py
# 내 풀이

n, m = map(int, input().split())
x, y, d = map(int, input().split())
map = [list(map(int, input().split())) for _ in range(n)]
move = [(-1, 0), (0, 1), (1, 0), (0, -1)]

def turn_left():
    global d
    if d == 0:
        d = 3
    elif d == 1:
        d = 0
    elif d == 2:
        d = 1
    else:
        d = 2

x = x - 1
y = y - 1
map[x][y] = 3
turn_count = 0
while True:
    turn_left()
    turn_count += 1
    if map[x + move[d][0]][y + move[d][1]] == 0:
        x = x + move[d][0]
        y = y + move[d][1]
        map[x][y] = 3
        turn_count = 0
    else:
        turn_left()
        turn_count += 1
        if turn_count == 4:
            if (map[x - move[d][0]][y - move[d][1]]) != 1:
                x = x - move[d][0]
                y = y - move[d][1]
                turn_count = 0
            else:
                break

answer = 0
for x in map:
    for y in x:
        if y == 3:
            answer += 1

print(answer)

```

- 모범 풀이는 아래과 같다.

```py
# N, M을 공백을 기준으로 구분하여 입력받기
n, m = map(int, input().split())

# 방문한 위치를 저장하기 위한 맵을 생성하여 0으로 초기화
d = [[0] * m for _ in range(n)]
# 현재 캐릭터의 X 좌표, Y 좌표, 방향을 입력받기
x, y, direction = map(int, input().split())
d[x][y] = 1 # 현재 좌표 방문 처리

# 전체 맵 정보를 입력받기
array = []
for i in range(n):
    array.append(list(map(int, input().split())))

# 북, 동, 남, 서 방향 정의
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

# 왼쪽으로 회전
def turn_left():
    global direction
    direction -= 1
    if direction == -1:
        direction = 3

# 시뮬레이션 시작
count = 1
turn_time = 0
while True:
    # 왼쪽으로 회전
    turn_left()
    nx = x + dx[direction]
    ny = y + dy[direction]
    # 회전한 이후 정면에 가보지 않은 칸이 존재하는 경우 이동
    if d[nx][ny] == 0 and array[nx][ny] == 0:
        d[nx][ny] = 1
        x = nx
        y = ny
        count += 1
        turn_time = 0
        continue
    # 회전한 이후 정면에 가보지 않은 칸이 없거나 바다인 경우
    else:
        turn_time += 1
    # 네 방향 모두 갈 수 없는 경우
    if turn_time == 4:
        nx = x - dx[direction]
        ny = y - dy[direction]
        # 뒤로 갈 수 있다면 이동하기
        if array[nx][ny] == 0:
            x = nx
            y = ny
        # 뒤가 바다로 막혀있는 경우
        else:
            break
        turn_time = 0

# 정답 출력
print(count)
```
