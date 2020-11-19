---
title: "[python] Python Data Structures (Dictionaries)"
date: 2020-11-19 09:11:92
category: python
thumbnail: { thumbnailSrc }
draft: false
---
> 첫 영어 포스팅🙂 영어 공부도 할 겸 영어 공식 문서를 읽고 정리할 때는 영어로 작성해보려고 한다.

# Dictionaries

1. indexed by keys - keys can be any **immutable** type(can't use lists)
    - e.g. string, number, tuple(only when it contain strings, numbers, or tuples)
2. a set of **key: value** pairs
3. called as "associative memories" or "associative arrays" in other languages.

## How to use 😎

### Creation & Insertion

`{}` : create an empty dictionary

```python
>>> data = {'apple': 1000, 'banana': 2000}
>>> data['strawberry'] = 3000
>>> data
{'apple': 1000, 'banana': 2000, 'strawberry': 3000}
```


### del dictionary_name['key_name']

```python
>>> del data['apple']
>>> data
{'banana': 2000, 'strawberry': 3000}
```


### dict() constructor

- build dictionaries directly from sequences of key-value pairs

```python
>>> dict([('Jane', 25), ('Jisun', 26), ('Tom', 30)])
{'Jane': 25, 'Jisun': 26, 'Tom': 30}

# when the keys are simple strings
>>> dict(Jane=25, Tom=10, Jisun=17)
{'Jane': 25, 'Tom': 10, 'Jisun': 17}
```



### dict comprehension

```python
>>> {x: x**3 for x in (1, 2, 3)}
{1: 1, 2: 8, 3: 27}
```


### list(dictionary_name)

- return **a list of keys** used in the dictionary in **insertion order**

```python
>>> list(data)
['banana', 'strawberry']
```



### sorted(dictionary_name)

- return a list of keys in the dictionary **sorted**

```python
>>> data['apple'] = 5000
>>> list(data)
['banana', 'strawberry', 'apple']
>>> sorted(data)
['apple', 'banana', 'strawberry']
```



### 'key' in dictionary_name

- return boolean value

```python
>>> 'apple' in data
True
>>> 'lemon' in data
False
```

<br/>

### ❗ Caution
- Each key should be unique! if there are two keys with the same value, the new data will overwrite the previous data.
```python
>>> a = {1:'a', 1:'b'}
>>> a
{1: 'b'}
```

#

***Source***

- [docs.python.org]([https://docs.python.org/3/tutorial/datastructures.html?highlight=dictionary](https://docs.python.org/3/tutorial/datastructures.html?highlight=dictionary))
- [Jump to python](https://wikidocs.net/16)