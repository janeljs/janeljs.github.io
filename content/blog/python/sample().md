---
title: "[python] random.sample() 함수"
date: 2020-10-31 10:10:11
category: python
thumbnail: { thumbnailSrc }
draft: false
---
# random.sample() 함수

- sequence에서 지정한 숫자만큼의 요소들을 랜덤으로 뽑아 리스트로 반환해주는 함수
- 구현한 알고리즘을 테스트하고 싶을 때 테스트용으로 사용할 예제를 쉽게 만들 수 있다.



## 사용 방법

```python
random.sample(*sequence*, *k*)
```

sequence: 리스트, 집합, range() 등 random의 범위가 될 sequence 입력

k: 반환될 리스트의 크기 입력



## 활용 예시

- 5개의 과일 중 2개의 과일 랜덤으로 출력

    ```python
    import random
    mylist = ["apple", "banana", "cherry", "orange", "blueberry"]
    print(random.sample(mylist, k=2))
    ```
    ```sh
    # result
    ['orange', 'blueberry']
    ```

- 0에서 99 중 10개의 숫자를 랜덤으로 출력

    ```python
    import random
    data_list = random.sample(range(100), 10)
    print(data_list)
    ```
    ```sh
    # result
    [75, 20, 98, 60, 5, 47, 4, 21, 90, 52]
    ```

    