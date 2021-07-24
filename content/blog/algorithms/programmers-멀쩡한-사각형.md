---
title: Programmers 멀쩡한 사각형
date: 2021-07-25 02:07:49
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/62048

## Solution

1. 대각선은 시작점을 제외하고 가로와 세로 길이의 최대공약수만큼 점을 지난다.
2. 동일한 패턴은 가로와 세로의 최대공약수만큼 반복된다.
3. 반복되는 패턴에 나타나는 흰색 사각형의 수는 `(반복되는 패턴의) 가로 + 세로 - 1`개이다. 첫 사각형에서 가로와 세로가 중복되기 때문이다.
4. 그러므로 제거해야 할 사각형의 수는 `최대공약수*(가로//최대공약수 + 세로//최대공약수 -1)`이다.

```py
from fractions import gcd

def solution(w, h):
    g = gcd(w, h)
    return w * h - g * (w // g + h // g - 1)
```
