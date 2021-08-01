---
title: Programmers 오픈채팅방
date: 2021-08-01 22:08:26
category: string
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42888

## Solution

```py
def solution(record):
    save = []
    result = []
    dic = dict()
    for r in record:
        if len(r.split()) == 3:
            command, userid, nickname = r.split()
            if command == "Enter":
                save.append([userid, "님이 들어왔습니다."])
                dic[userid] = nickname
            else:
                dic[userid] = nickname

        else:
            command, userid = r.split()
            save.append([userid, "님이 나갔습니다."])

    for userid, message in save:
        result.append(dic[userid] + message)

    return result
```

- 다른 사람 풀이

```py
def solution(record):
    answer = []
    namespace = {}
    printer = {'Enter':'님이 들어왔습니다.', 'Leave':'님이 나갔습니다.'}
    for r in record:
        rr = r.split(' ')
        if rr[0] in ['Enter', 'Change']:
            namespace[rr[1]] = rr[2]

    for r in record:
        if r.split(' ')[0] != 'Change':
            answer.append(namespace[r.split(' ')[1]] + printer[r.split(' ')[0]])

    return answer
```
