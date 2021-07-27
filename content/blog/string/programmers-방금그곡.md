---
title: Programmers 방금그곡
date: 2021-07-27 03:07:33
category: string
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17683

## Solution

- 문제를 제대로 안 읽어서 헤맸다.
  - 조건이 일치하는 음악이 여러 개일 때에는 라디오에서 **재생된 시간이 제일 긴** 음악 제목을 반환한다.
  - 재생된 시간도 같을 경우 먼저 입력된 음악 제목을 반환한다.
- 조건을 반영한 다음에도 20, 21, 30번이 통과되지 않는다.
- 아래 조건을 빼먹었다.
  - 음악 길이보다 재생된 시간이 짧을 때는 처음부터 재생 시간만큼만 재생된다.
- 마지막으로 재생시간으로 정렬시 `reverse = True`를 빼먹었다.

```py
from datetime import datetime


def solution(m, musicinfos):
    dic = dict()
    m = process(m)
    answer = []

    for music in musicinfos:
        start, end, title, melody = music.split(',')

        temp = str(datetime.strptime(end, '%H:%M') - datetime.strptime(start, '%H:%M'))
        minute = int(temp[-5:-3])
        hour = int(temp[:-6])
        duration = minute + hour * 60

        melody = process(melody)

        if duration < len(melody):
            dic[title] = (melody[:duration], duration)
        else:
            q, r = divmod(duration, len(melody))
            dic[title] = (melody * q + melody[:r], duration)

    for key, value in dic.items():
        if m in value[0]:
            answer.append([key, value[1]])

    print(answer)
    try:
        answer = sorted(answer, key=lambda x: x[1], reverse=True)
        return answer[0][0]
    except:
        return '(None)'


def process(m):
    return m.replace('C#', 'c').replace('D#', 'd').replace('F#', 'f').replace('G#', 'g').replace('A#', 'a')
```
