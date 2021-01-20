---
title: Programmers 모의고사
date: 2021-01-20 21:01:74
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.

1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...

1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.
```

## Constraints

```py
시험은 최대 10,000 문제로 구성되어있습니다.
문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.
```

## Solution

```java
// 내 풀이

import java.util.ArrayList;
import java.util.List;

class Solution {
    public int[] solution(int[] answers) {
        int[] p1 = {1, 2, 3, 4, 5};
        int[] p2 = {2, 1, 2, 3, 2, 4, 2, 5};
        int[] p3 = {3, 3, 1, 1, 2, 2, 4, 4, 5, 5};
        int c1 = 0;
        int c2 = 0;
        int c3 = 0;
        int max = 0;
        for (int i = 0; i < answers.length; i++) {
            if (answers[i] == p1[i % p1.length]) {
                c1++;
                if (c1 >= max) {
                    max = c1;
                }
            }
            if (answers[i] == p2[i % p2.length]) {
                c2++;
                if (c2 >= max) {
                    max = c2;
                }
            }
            if (answers[i] == p3[i % p3.length]) {
                c3++;
                if (c3 >= max) {
                    max = c3;
                }
            }
        }
        int[] arr = {c1, c2, c3};
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            if (max == arr[i])
                list.add(i + 1);
        }

        int[] answer = new int[list.size()];
        for (int i = 0; i < answer.length; i++) {
            answer[i] = list.get(i);
        }
        return answer;
    }
}
```

## Feedback

-

```java
// 풀이 1


```

```java
// 풀이 2


```

#

**_Source_**

- https://programmers.co.kr/learn/courses/30/lessons/42840
