---
title: Programmers 파일명 정렬
date: 2021-07-26 03:07:87
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17686

## Solution

```py
def solution(files):
    answer = [[''] * 3 for _ in files]

    for idx in range(len(files)):
        file = files[idx]

        save = 0
        for i in range(len(file)):
            if file[i].isdigit():
                answer[idx][0] = file[:i]
                save = i
                break

        for i in range(save, len(file)):
            # 숫자는 5글자가 최대이다.
            if i == save + 5:
                answer[idx][1] = file[save:i]
                answer[idx][2] = file[i:]
                break
            if not file[i].isdigit():
                answer[idx][1] = file[save:i]
                answer[idx][2] = file[i:]
                break
            # 뒤에 문자열이 없는 경우도 고려해야 한다.
            if file[save:].isdigit():
                answer[idx][1] = file[save:len(file)]
                break

    temp = sorted(answer, key=lambda x: (x[0].lower(), int(x[1])))

    answer = [''.join(e) for e in temp]

    return answer
```

- 다른 사람 풀이

```py
import re

def solution(files):
    a = sorted(files, key=lambda file : int(re.findall('\d+', file)[0]))
    b = sorted(a, key=lambda file : re.split('\d+', file.lower())[0])
    return b
```
