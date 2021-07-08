---
title: Programmers 전화번호 목록
date: 2021-07-08 17:07:30
category: hash
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42577

## Solution

```py
def solution(phone_book):
    phone_book.sort()
    phone_book_length = len(phone_book)
    for i in range(phone_book_length - 1):
        if phone_book_length == 1:
            return True
        if phone_book[i + 1].startswith(phone_book[i]):
            return False
    return True
```

- zip 이용

```py
def solution(phone_book):
    phone_book = sorted(phone_book)
    for p1, p2 in zip(phone_book, phone_book[1:]):
        if p2.startswith(p1):
            return False
    return True
```
