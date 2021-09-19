---
title: Codility FrogJmp
date: 2021-09-19 11:09:55
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/3-time_complexity/frog_jmp/

## Solution

```java
class Solution {
    public int solution(int X, int Y, int D) {
        int count = (Y - X) / D;
        int remainder = (Y - X) % D;
        if (remainder>0) {
            return count+1;
        }
        return count;
    }
}
```

- 다른 사람 풀이

```java
public int solution(int X, int Y, int D) {
  double divideNum = (Y - X) * 1.0 / D;
      return (int) Math.ceil(divideNum);
}
```
