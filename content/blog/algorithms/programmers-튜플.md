---
title: Programmers 튜플
date: 2021-08-07 01:08:08
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/64065

## Solution

```py
from collections import deque
import ast

def solution(s):
    string = deque(sorted(ast.literal_eval(s.replace("{", "[").replace("}", "]")), key=lambda x:len(x)))
    answer = []
    while string:
        if string[0][0] not in answer:
            answer.append(string.popleft()[0])
        else:
            if len(string[0])!=0:
                string[0].pop(0)
    return answer
```

- 다른 사람 풀이

```py
def solution(s):

    s = Counter(re.findall('\d+', s))
    return list(map(int, [k for k, v in sorted(s.items(), key=lambda x: x[1], reverse=True)]))

import re
from collections import Counter
```

- 다른 사람 풀이2

```py
def solution(s):
    answer = []

    s1 = s.lstrip('{').rstrip('}').split('},{')

    new_s = []
    for i in s1:
        new_s.append(i.split(','))

    new_s.sort(key = len)

    for i in new_s:
        for j in range(len(i)):
            if int(i[j]) not in answer:
                answer.append(int(i[j]))

    return answer
```
