---
title: Programmers 숫자의 표현
date: 2021-07-26 00:07:01
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12924

## Solution

```py
def solution(n):
    answer = 0
    idx = 1
    while (idx <= n):
        sum = 0
        for i in range(idx, n + 1):
            sum += i
            if sum == n:
                answer += 1
                idx += 1
                break
            elif sum > n:
                idx += 1
                break
    return answer
```

- 다른 사람 풀이

```py
def expressions(num):
    return len([i  for i in range(1,num+1,2) if num % i is 0])
```

- 투포인터를 이용한 풀이 (from 알고리즘 스터디 k)

```java
class Solution {
  public int solution(int n) {
      int answer = 0;
      int left = 1;
      int right = 1;

      int sum = 1;

      while (right <= n) {
          if (sum == n) {
              answer++;
              right++;
              sum += right;
          } else if (sum < n) {
              right++;
              sum += right;
          } else if (sum > n) {
              sum -= left;
              left++;
          }
      }
      return answer;
  }
}
```
