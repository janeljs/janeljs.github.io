---
title: Programmers 숫자 문자열과 영단어
date: 2021-07-08 21:07:66
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/81301

## Solution

- 무려 2021년에 나온 따끈따끈한 문제

```py
def solution(s):
    words = {'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine': 9}

    for i in range(1, len(s)):
        if (s.isdigit()):
            return s
        if not s[i - 1].isdigit():
            for w in words.keys():
                if (w.startswith(s[i - 1] + s[i])):
                    s = s.replace(w, str(words[w]))
                    break
    return s
```

- 순회하면서 확인할 것도 없이 key를 value로 전부 바꾸면 된다.

```py
num_dic = {"zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"}

def solution(s):
    answer = s
    for key, value in num_dic.items():
        answer = answer.replace(key, value)
    return int(answer)
```
