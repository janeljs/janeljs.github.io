---
title: 이코테 Chapter 4 구현 알고리즘
date: 2021-01-22 23:01:46
category: Implementation
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

## 예제 2: 시각

#

## 예제 2:

**_Source_**

- https://github.com/ndb796/python-for-coding-test
