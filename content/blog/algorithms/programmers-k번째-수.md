---
title: Programmers K번째 수
date: 2021-01-20 21:01:27
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.

예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면

array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.
2에서 나온 배열의 3번째 숫자는 5입니다.
배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.
```

## Constraints

```py
array의 길이는 1 이상 100 이하입니다.
array의 각 원소는 1 이상 100 이하입니다.
commands의 길이는 1 이상 50 이하입니다.
commands의 각 원소는 길이가 3입니다.
```

## Solution

```java
import java.util.ArrayList;
import java.util.Arrays;

class Solution {
    public int[] solution(int[] array, int[][] commands) {
        ArrayList<Integer> list = new ArrayList<>();
        // commands를 돌면서
        for (int i = 0; i < commands.length; i++) {
            // copyOfRange(final index exclusive)
            int[] temp  = Arrays.copyOfRange(array, commands[i][0]-1, commands[i][1]);
            // 정렬 후 
            Arrays.sort(temp);
            // 정답 리스트 추가
            list.add(temp[commands[i][2]-1]);
        }
        // int 배열로 바꾸기, mapToInt(int 타입의 스트림으로 바꿔줌)
        return list.stream().mapToInt(i -> i).toArray();
    }
}
```

#

**_Source_**

- https://programmers.co.kr/learn/courses/30/lessons/42748
