---
title: Programmers 후보키
date: 2021-09-05 11:09:31
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42890

## Solution

```py
from itertools import combinations


def solution(relation):
    key_index = []
    keys = []
    for i in range(len(relation[0])):
        key_index.append(i)
    # 모든 키 조합 구하기
    for i in range(1, len(relation[0]) + 1):
        keys.extend(list(combinations(key_index, i)))

    unique_key = []
    for key in keys:
        temps = set()
        for row in relation:
            temp = tuple()
            for i in key:
                temp += tuple(row[i])
            temps.add(temp)
        # 현재 키에 대해 유일성이 보장되면 unique_key에 추가
        if len(temps) == len(relation):
            unique_key.append(key)

    uk_set = [set(uk) for uk in unique_key]

    answer = 0
    for i in range(len(uk_set)):
        for j in range(i + 1, len(uk_set)):
            # 최소성 보장
            if uk_set[i].issubset(uk_set[j]):
                uk_set[j] = {-1}

    for u in uk_set:
        if list(u)[0] != -1:
            answer += 1

    return answer
```

- 다른 사람 풀이 1

```py
def solution(relation):
    answer_list = list()
    for i in range(1, 1 << len(relation[0])):
        tmp_set = set()
        for j in range(len(relation)):
            tmp = ''
            for k in range(len(relation[0])):
                if i & (1 << k):
                    tmp += str(relation[j][k])
            tmp_set.add(tmp)

        if len(tmp_set) == len(relation):
            not_duplicate = True
            for num in answer_list:
                if (num & i) == num:
                    not_duplicate = False
                    break
            if not_duplicate:
                answer_list.append(i)
    return len(answer_list)
```

- java 풀이
  - 출처: https://girawhale.tistory.com/102

```java
import java.util.*;

class Solution {
    List<Integer> key = new ArrayList<>();

    boolean ckMinimality(int i) {
        for (int k : key)
            if ((k & i) == k) return false;
        return true;
    }

    public int solution(String[][] relation) {
        int n = relation.length, m = relation[0].length;

        for (int k = 1; k < (1 << m); k++) {
            if (!ckMinimality(k)) continue;

            Set<String> set = new HashSet<>();
            for (int i = 0; i < n; i++) {
                StringBuilder key = new StringBuilder();

                for (int j = 0; j < m; j++) {
                    if (((1 << j) & k) > 0) key.append(relation[i][j]).append('/');
                }

                if (!set.add(key.toString())) break;
            }
            if (set.size() == n) key.add(k);
        }
        return key.size();
    }
}
```
