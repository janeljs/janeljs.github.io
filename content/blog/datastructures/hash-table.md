---
title: "[DS] 해시 테이블(Hash table)"
date: 2020-10-30 13:10:82
category: datastructures
thumbnail: { thumbnailSrc }
draft: false
---
## 해시 테이블(Hash table)

- 쌍으로 이뤄진 값들의 리스트
- key와 value로 구성
- 해시 테이블 = 해시 = 맵 = 해시 맵 = 딕셔너리 = 연관 배열
<br/>

### 사용 목적
- 효율적인 데이터 관리 가능
  - 무한에 가까운 데이터들을 유한한 개수의 해시값으로 매핑 -> 작은 크기의 캐시 메모리로도 프로세스 관리 가능 
- 데이터 처리 속도가 빠름 

### 해싱

문자를 숫자로 변환
<br/>

### 해시 함수

- 문자를 특정 숫자로 변환하는데 사용한 코드
  - Hash code: f(x): keys -> integers
    - Memory address
    - Integer Cast
    - Component sum
      - key를 특정 길이의 컴포넌트로 나눈다음 각 컴포넌트를 더한다 (overflow 무시)
      - integer type의 bit와 같거나 더 긴 길이를 갖고있는 numeric key에 적합 (e.g. java의 long, double)
    - Polynomial accumulation
      - 충돌을 피하는데 유리함 
  - Compression function: g(x): integers -> [O, N-1]
    - h(x) = g(f(x))
    - 다른 사람이 사용한 좋은 hash code가 있다면 compression function을 사용해서 재활용할 수 있음
- 동일한 문자열을 받으면 항상 동일한 숫자를 반환해야 함
- 충돌을 피하게 key를 분산시키는 것이 목적 
e.g. h(x) = x mod N
e.g. h(x) = last four digits of x



<br/>

### 데이터 저장

1. 키에 해시 함수 적용
2. value를 해시 함수에서 반환된 값 인덱스에 저장


### 데이터 검색

1. function["apple"]에서 apple을 해싱
2. 해시 함수가 반환한 값의 인덱스로 가서 저장되어 있는 값을 반환

💡 키를 이용하면 바로 검색하는 것이 가능하기 때문에 시간복잡도는 $O(1)$이다.

**But**, 해시테이블에 충돌이 일어나 모든 데이터가 해시 테이블의 한 셀에 들어간다면 $O(n)$ 소요

<br/>

### 충돌

해시 함수가 반환하는 값이 동일하여 이미 채워진 셀에 데이터를 추가하는 것

😎 분리 연결법으로 해결할 수 있다.


### 분리 연결법(Seperate Chaining)

- **개방 해슁 또는 Open Hashing 기법** 중 하나: 해쉬 테이블 저장공간 외의 공간을 활용하는 기법
  - 링크드 리스트
    - 충돌이 일어나면, 링크드 리스트로 데이터를 추가로 뒤에 연결시켜서 저장
    ```python
    hash_table = list([0 for i in range(8)])

    def get_key(data):
        return hash(data)

    def hash_function(key):
        return key % 8

    def save_data(data, value):
        index_key = get_key(data)
        hash_address = hash_function(index_key)
        if hash_table[hash_address] != 0:
            for index in range(len(hash_table[hash_address])):
                if hash_table[hash_address][index][0] == index_key:
                    hash_table[hash_address][index][1] = value
                    return
            hash_table[hash_address].append([index_key, value])
        else:
            hash_table[hash_address] = [[index_key, value]]
        
    def read_data(data):
        index_key = get_key(data)
        hash_address = hash_function(index_key)

        if hash_table[hash_address] != 0:
            for index in range(len(hash_table[hash_address])):
                if hash_table[hash_address][index][0] == index_key:
                    return hash_table[hash_address][index][1]
            return None
        else:
            return None
    ```

  - 배열
    - 충돌이 발생했을 때 셀에 하나의 값을 넣는 대신 배열로의 참조를 저장 
      1. 키를 해싱
      2. 해당 주소에 값이 아닌 배열들의 배열이 있음 발견
            - 배열들의 배열:  각 인덱스에 한 쌍의 key와 value로 구성된 배열 존재
      3. 배열들의 배열의 하위 배열에서 key를 확인하며 일치하는 key를 찾을 때까지 검색, key가 있는 배열의 인덱스 1에 있는 value를 반환

<br/>

### 개방 주소법(Open Addressing)
- 해쉬 테이블 저장공간 안에서 충돌 문제를 해결하는 기법
- hash table array의 빈공간을 사용 
- Linear Probing(선형 탐색)
  - **폐쇄 해슁 또는 Close Hashing 기법** 중 하나 
  - 해시 충돌 시, 해당 hash address의 다음 address부터 맨 처음 나오는 빈공간에 데이터를 삽입 
    - 저장공간 활용도가 높다. 
- Quadratic Probing(제곱 탐색)
  - 해시충돌 시 제곱만큼 건너뛴 버켓에 데이터를 삽입(1,4,9,16..)
- Double Hahsing(이중 해시)
  - 해시충돌 시 다른 해시함수를 한 번 더 적용한 결과를 이용

### 해시 테이블의 효율성 결정 요인

- 해시 테이블에 저장하는 데이터의 수
- 해시 테이블에서 사용 가능한 셀의 수
    - 사용가능한 셀이 적은데 많은 데이터를 저장하면 비효율적
- 사용하는 해시 함수의 종류
    - 셀의 갯수는 100인데 해시 함수의 return 값이 1~9 사이의 숫자라면 비효율적
    - 좋은 해시함수 = 사용 가능한 모든 셀에 데이터를 분산시키는 함수

💡 해시테이블 설계시 메모리 낭비와 충돌 모두 고려해야 한다.

<br/>

### 부하율

데이터와 셀 간 비율

- 부하율을 정해놓으면 데이터가 새로운 셀들에 균등하게 분산되어 저장되도록 해시 테이블을 확장할 수 있음

<br/>

### 해시테이블을 집합으로 사용하기

각 데이터를 해시 테이블의 key, value에는 true 등 boolean값 할당

```jsx
var set = {};
set["candy"] = 1;
set["chocolate"] = 1; // O(1)에 삽입 가능

/*이미 있는 키를 추가한다면*/
set["candy"] = 1; // O(1)에 삽입 가능, 덮어쓰기 때문에 검색이 필요없다
```


### 예제: 카카오톡 투표 기능 (항목 추가 가능)

```jsx
var votes = {};

function addVote(candidate) {
  if(votes[candidate]) {    // 이미 항목이 있으면
    votes[candidate]++;     // 투표수 추가
  } else {
    votes[candidate] = 1;   // 없으면 1 배정
  }
}

function countVotes() {
  return votes;             // 각 키에 득표수가 저장되어 있는 해시테이블 반환
}
```
#

***Source***  
- A Common-Sense Guide to Data Structures and Algorithms
- Data Structures and Algorithms in Java
- [yjshin tistory blog](https://yjshin.tistory.com/entry/%EC%95%94%ED%98%B8%ED%95%99-%ED%95%B4%EC%8B%9C-%ED%95%A8%EC%88%98-%EC%9E%91%EC%84%B1-%EC%A4%91)
- [잔재미코딩](https://www.fun-coding.org/Chapter09-hashtable-live.html)
- [Preamtree의 행복로그](https://preamtree.tistory.com/20)