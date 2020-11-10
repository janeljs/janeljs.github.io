---
title: "[Django] 장고 다운로드 및 프로젝트 초기 설정 방법"
date: 2020-11-11 06:11:53
category: django
thumbnail: { thumbnailSrc }
draft: false
---
## Python 설치 확인
- 아래 명령어를 입력해서 버전 확인 
```bash
$ python --version
```
- 우분투 20.04 환경에서 진행할 경우 python3가 기본적으로 설치되어 있으며, `python3`를 통해 잘 설치되어있는지 확인할 수 있다. 
```bash
$ python3
```

## Pipenv 설치
- pipenv 없이 아래와 같은 명령어를 입력할 경우 Django가 global하게 설치된다.
```bash
$ pip install Django==3.1.3
```
- 그러므로 pipenv 설치를 통해 bubble을 먼저 만들어 주어야 한다. 
- 설치 방법
	- macOS 또는 Ubuntu일 경우 brew 명령어를 통해 간단하게 설치할 수 있다. 
	```bash
	$ brew install pipenv
	```
	- 윈도우를 사용하는 경우 아래 명령어를 사용하면 된다고 한다. (확인x)
	```bash
	$ pip install --user pipenv
	```


## Django 설치
- pipenv가 성공적으로 설치되었다면 `pipenv shell`명령어를 통해 버블 안으로 들어가자.
	- 작업 시작 전에 해당 명령어를 사용하여 버블 안으로 들어가줘야 한다. 
- 그 후 아래 명령어를 통해 Django를 설치할 수 있다.
```bash
$ pip install Django==3.1.3
```
- 설치가 끝났으면 컴퓨터 전체가 아니라 버블 안에서만 `django-admin`이 작동하는지 확인하자. 
	- pipenv shell을 열고 `django-admin`을 실행했을 때 여러 명령어 목록이 나오면 성공이다.
	- pipenv 버블 밖에서는 `django-admin`이 실행되지 않아야 한다.


## Git repository 만들기 
- 폴더 생성
```bash
$ mkdir [폴더명]
```
- 초기화
```bash
$ git init
```
- 본인의 github에서 새 repository 생성
- 원격 저장소 추가 
```bash
$ git remote add origin [생성한 레파지토리 URL]
```

## .gitignore 파일 만들기 
- gitignore의 목적
	- 보안관련 내용 등 업로드하면 안되는 정보 저장 
	    - e.g. 파일 백업 정보, 제품 빌드 정보
		- 업로드를 원하지 않는 파일이 업로드되는 것을 방지
	- 발생할 수 있는 충돌 등으로 인한 데이터 손실 방지

- 생성 방법
	- `touch` 명령어로 파일 생성 
```bash
$ touch .gitignore
```
- 아래 링크에 있는 코드 복사해서 `.gitingore` 파일에 넣기 
	- [gitignore](https://github.com/github/gitignore/blob/master/Python.gitignore)


## 프로젝트 시작
- (vscode 기준) pipenv가 붙은 파이썬 버전을 선택한 뒤, 
- 아래 코드를 입력해준다.
```bash
$ django-admin startproject config
```

#
***Source***  
- [Django download](https://www.djangoproject.com/download)
- [pip installation](https://docs.pipenv.org/install/#installing-pipenv)