---
title: Programmers 핸드폰 번호 가리기
date: 2021-07-25 01:07:01
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12948

## Solution

```py
def solution(phone_number):
    # 뒤에서부터 4글자 슬라이싱
    save = phone_number[-4:]
    return '*' * (len(phone_number) - len(save)) + save
```
