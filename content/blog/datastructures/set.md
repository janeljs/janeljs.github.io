---
title: "[DS] 집합(Set)"
date: 2020-10-30 13:10:03
category: datastructures
thumbnail: { thumbnailSrc }
draft: false
---
## 집합(Set)

중복값을 허용하지 않는 자료구조

<br/>

**읽기**

- O(1)

<br/>

**검색**

- O(N)


<br/>

**삽입**

- 중복값이 있을 경우 삽입 금지
    - 삽입할 값이 집합에 들어있는지 결정해야 함 → 삽입 전 `검색` 필요
    - 맨 뒤에 삽입할 경우 N(검색) + 1(삽입) 필요
    - 맨 앞에 삽입할 경우 N(검색) + N(이동) + 1(삽입) 필요

        → 중복값이 존재해도 되면 배열이 더 효율적

    - 결과적으로 O(N)
- 활용
    - 같은 전화번호가 존재하면 안 되는 전화번호부 관리


<br/>

**삭제**

- O(N)

#

Source: A Common-Sense Guide to Data Structures and Algorithms