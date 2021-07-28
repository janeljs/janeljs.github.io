---
title: Programmers 내적
date: 2021-07-07 16:07:90
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## 문제 설명

길이가 같은 두 1차원 정수 배열 a, b가 매개변수로 주어집니다. a와 b의 [내적](https://en.wikipedia.org/wiki/Dot_product)을 return 하도록 solution 함수를 완성해주세요.

이때, a와 b의 내적은 `a[0]*b[0] + a[1]*b[1] + ... + a[n-1]*b[n-1]` 입니다. (n은 a, b의 길이)

---

## 제한사항

- a, b의 길이는 1 이상 1,000 이하입니다.
- a, b의 모든 수는 -1,000 이상 1,000 이하입니다.

---

## 입출력 예

| a           | b             | result |
| ----------- | ------------- | ------ |
| `[1,2,3,4]` | `[-3,-1,0,2]` | 3      |
| `[-1,0,1]`  | `[1,0,-1]`    | -2     |

---

##### 입출력 예 설명

입출력 예 #1

- a와 b의 내적은 `1*(-3) + 2*(-1) + 3*0 + 4*2 = 3` 입니다.

입출력 예 #2

- a와 b의 내적은 `(-1)*1 + 0*0 + 1*(-1) = -2` 입니다.

## 답안

```py
def solution(a, b):
    answer = 0
    for i in range(len(a)):
        answer += a[i]*b[i]
    return answer
```

- 다른 사람 풀이

```py
def solution(a, b):
    return sum([x*y for x, y in zip(a,b)])
```

#

**_Source_**

- https://wikidocs.net/22383
- https://wikidocs.net/22384
- https://programmers.co.kr/learn/courses/30/lessons/70128
