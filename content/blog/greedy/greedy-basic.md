---
title: 이코테 Chapter 3 그리디 알고리즘
date: 2021-01-22 21:01:14
category: greedy
thumbnail: { thumbnailSrc }
draft: false
---

## 그리디 알고리즘

- 매 순간 가장 좋아보이는 것을 선택하는 알고리즘
- 힌트 keyword: **`가장 큰 순서대로`**, **`가장 작은 순서대로`**

## 예제 1: 거스름돈

- 그리디 알고리즘의 대표적인 문제 중 하나
- 단위가 큰 동전이 항상 단위가 작은 동전의 배수이므로 그리디 알고리즘을 적용할 수 있다.

```py
# 교재 풀이

n = 1260
count = 0

# 큰 단위의 화폐부터 차례대로 확인하기
coin_types = [500, 100, 50, 10]

for coin in coin_types:
    count += n // coin # 해당 화폐로 거슬러 줄 수 있는 동전의 개수 세기
    n %= coin

print(count)
```

- 교재에 나와있는 파이썬 코드를 안 보고 자바로 다시 풀어보았다.

```java
// java 풀이

class Main {
    public static void main(String[] args) {
        int n = 1260;
        int count = 0;
        int[] list = {500, 100, 50, 10};
        for (int coin : list) {
            count += (n / coin);
            n %= coin;
        }
        System.out.println(count);
    }
}
```

## 실전 문제 1: 큰 수의 법칙

- 금방 풀었다. 오랜만에 쉬운 문제 풀었더니 자존감이 올라간다.

```py
# 내 풀이

n, m, k = map(int, input().split())
_list = list(map(int, input().split()))
answer = []

_list.sort()

while (m > 0):
    m -= k
    for _ in range(k):
        answer.append(_list[-1])
    m -= 1
    answer.append(_list[-2])

print(sum(answer))
```

- 교재에 나와있는 풀이는 아래와 같다.

```py
# N, M, K를 공백을 기준으로 구분하여 입력 받기
n, m, k = map(int, input().split())
# N개의 수를 공백을 기준으로 구분하여 입력 받기
data = list(map(int, input().split()))

data.sort() # 입력 받은 수들 정렬하기
first = data[n - 1] # 가장 큰 수
second = data[n - 2] # 두 번째로 큰 수

# 가장 큰 수가 더해지는 횟수 계산
count = int(m / (k + 1)) * k
count += m % (k + 1)

result = 0
result += (count) * first # 가장 큰 수 더하기
result += (m - count) * second # 두 번째로 큰 수 더하기

print(result) # 최종 답안 출력
```

## 실전 문제 2: 숫자 카드 게임

### Testcase 1

```py
3 3
3 1 2
4 1 4
2 2 2
```

```py
2
```

### Testcase 2

```py
2 4
7 3 1 8
3 3 3 4
```

```py
2
```

두 번째 문제도 쉽다.

```py
# 내 풀이

n, m = map(int, input().split())
card = []
answer = []
for _ in range(n):
    card.append(list(map(int, input().split())))

for x in range(n):
    answer.append(min(card[x]))

print(max(answer))
```

- 모범 답안

```py
# N, M을 공백을 기준으로 구분하여 입력 받기
n, m = map(int, input().split())

result = 0
# 한 줄씩 입력 받아 확인하기
for i in range(n):
    data = list(map(int, input().split()))
    # 현재 줄에서 '가장 작은 수' 찾기
    min_value = 10001
    for a in data:
        min_value = min(min_value, a)
    # '가장 작은 수'들 중에서 가장 큰 수 찾기
    result = max(result, min_value)

print(result) # 최종 답안 출력
```

## 실전문제 3: 1이 될 때까지

- 문제들이 쉽게 풀리기는 하는데 테스트케이스가 1~2개밖에 없으니 불안하다.

```py
# 내 풀이

n, k = map(int, input().split())

count = 0
while n > 1:
    if n % k == 0:
        n /= k
        count += 1
    else:
        n -= 1
        count += 1

print(count)
```

- 모범 풀이

```py
# N, K공백을 기준으로 구분하여 입력 받기
n, k = map(int, input().split())

result = 0

while True:
    # N이 K로 나누어 떨어지는 수가 될 때까지만 1씩 빼기
    target = (n // k) * k
    result += (n - target)
    n = target
    # N이 K보다 작을 때 (더 이상 나눌 수 없을 때) 반복문 탈출
    if n < k:
        break
    # K로 나누기
    result += 1
    n //= k

# 마지막으로 남은 수에 대하여 1씩 빼기
result += (n - 1)
print(result)
```

- 좋은 팁을 찾았다. 모범 풀이에 엄청 큰 숫자를 넣고 내 풀이에서도 같은 수가 나오는지 확인하면 된다.

```py
123875 78954
44922
```

- 다행히 같은 수가 나온다.

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
