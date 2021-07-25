---
title: Programmers n진수 게임
date: 2021-07-26 02:07:75
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17687

## Solution

- 0을 빼먹어서 한참 헤맸다. 왜 n진수 게임을 하는지도 모르겠고, 왜 0부터 시작하는지도 모르겠다.
- 각자 한 글자씩 끊어 말하지 않고 한 숫자씩 말한다고 가정했을 때 나올 수 있는 최대 길이 스트링을 temp에 저장하고, 거기서 tube 차례에 해당하는 문자만 끊어서 가져오면 된다.

```py
def solution(n, t, m, p):
    temp = ''
    for i in range(t * m):
        temp += dec_to_n(i, n)
    tube = ''
    for j in range(p - 1, t * m, m):
        tube += temp[j]
    return tube


def dec_to_n(number, n):
    str = "0123456789ABCDEF"
    rev_base = ''
    if number == 0:
        return '0'
    while number > 0:
        number, mod = divmod(number, n)
        rev_base += str[mod]
    return rev_base[::-1]
```
