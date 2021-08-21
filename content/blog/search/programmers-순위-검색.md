---
title: Programmers 순위 검색
date: 2021-08-21 23:08:52
category: search
thumbnail: { thumbnailSrc }
draft: false
---

-

## Solution

- 정확성 테스트는 통과하지만 효율성 테스트 실패

```py
def solution(info, query):
    answer = []
    info = [list(i.split()) for i in info]

    query = [list(i.split()) for i in query]
    for i in range(len(query)):
        query[i] = list(filter(lambda x: x != "and", query[i]))

    for qu in query:
        result = 0
        for inf in info:
            count = 0
            if int(qu[4]) > int(inf[4]):
                continue
            else:
                for idx in range(4):
                    if qu[idx] == "-" or qu[idx] == inf[idx]:
                        count += 1
                    else:
                        count -= 1
            if count == 4:
                result += 1
        answer.append(result)
    return answer
```

- 카카오 해설
  > 따라서 모든 지원자들을 위와 같은 방식으로 분류한 후 같은 그룹의 지원자끼리 묶어두고, 해당 그룹에서 점수를 기준으로 오름차순 정렬해 둡니다.
  > 이제, 검색 조건이 주어질 경우 INFO 배열에서 지원자들을 찾지 않고, 미리 분류해둔 그룹에서 X점 이상 맞은 지원자 수를 세주기만 하면 됩니다.
  > 이때, X점 이상 맞은 지원자를 찾기 위해 해당 그룹의 최저점, 혹은 최고점부터 순차적으로 검색한다면 여전히 오랜 시간이 걸리게 됩니다. 이때, 숫자가 오름차순으로 정렬된 배열에서 X라는 숫자를 찾는 효율적인 방법으로 binary search를 사용할 수 있습니다. 이때, 배열에 X가 없을 수도 있으므로, 배열에서 X보다 크거나 같은 숫자가 처음 나타나는 위치를 찾아야 하며, 이는 lower bound를 이용하면 됩니다.

```py
def solution(info, query):
    answer = []

    info = [list(i.split()) for i in info]
    query = [list(i.split()) for i in query]

    dic = get_groups()

    for i in info:
        for l in [i[0], '-']:
            for p in [i[1], '-']:
                for c in [i[2], '-']:
                    for f in [i[3], '-']:
                        dic[(l, p, c, f)].append(int(i[4]))
    dic = {key: sorted(value) for key, value in dic.items()}

    for q in query:
        key = (q[0], q[2], q[4], q[6])
        results = dic[key]

        score = int(q[7])

        left = 0
        right = len(results)

        while left < right:
            mid = (left + right) // 2
            if results[mid] >= score:
                right = mid
            else:
                left = mid + 1

        answer.append(len(results) - left)
    return answer


def get_groups():
    dic = dict()

    language = ["cpp", "java", "python", "-"]
    part = ['backend', 'frontend', '-']
    career = ['junior', 'senior', '-']
    food = ['chicken', 'pizza', '-']

    for l in language:
        for p in part:
            for c in career:
                for f in food:
                    dic.setdefault((l, p, c, f), [])
    return dic


solution(["java backend junior pizza 150", "python frontend senior chicken 210", "python frontend senior chicken 150",
          "cpp backend senior pizza 260", "java backend junior chicken 80", "python backend senior chicken 50"],
         ["java and backend and junior and pizza 100", "python and frontend and senior and chicken 200",
          "cpp and - and senior and pizza 250", "- and backend and senior and - 150", "- and - and - and chicken 100",
          "- and - and - and - 150"])
```
