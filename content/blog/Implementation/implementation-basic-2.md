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
  (뭔가 좋은 글감인 것 같아 velog에 정리해봐야겠다.)

### Solution

- 금방 풀었다. 아직 책 앞쪽이라 난이도가 쉬운 것 같다.
- 테케 자동생성 시도하다가 실패하고 5개 정도만 테스트해봤는데 통과가 되었다. import random을 사용해서 문제 상황에 맞게 조작하는 것 말고 조금 더 편한 방법 없을까?

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

### Testcase 1

```py

```

### Testcase 2

```py

```

### Solution

```py

```
