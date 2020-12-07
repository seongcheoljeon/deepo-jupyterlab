# Deepo JupyterLAB

deepo 이미지에 jupyter-lab extension을 설치하는 dockerfile이다.

> ## [Deepo Github](https://github.com/ufoym/deepo)

---

## Pre-Setup

Documents/deepo 디렉토리 경로에 다음과 같은 디렉토리들을 생성한다.  
이 디렉토리들은 deepo container와 공유하는 디렉토리이다.

- $HOME/Documents/deepo/data
- $HOME/Documents/deepo/config

```shell
ex) mkdir -p $HOME/Documents/deepo/data
ex) mkdir -p $HOME/Documents/deepo/config
```

## 컨테이너로 실행

```shell
cd <다운로드 받은 디렉토리>/dockerfiles
docker build -t <your name>/deepo-jupyterlab .
```

```shell
docker container run -itd -p 8889:8888 --name=[컨테이너명] -v <공유데이터 경로>:/root/data -v <공유속성 경로>:/root/.jupyter <이미지명>

// CPU Version
ex) docker container run --ipc=host -itd -p 8889:8888 --name=deepo --restart always -v ~/Documents/deepo/data:/root/data -v ~/Documents/deepo/config:/root/.jupyter deepo-jupyterlab

// GPU Version
ex) docker container run --gpus all --ipc=host -itd -p 8889:8888 --name=deepo --restart always -v ~/Documents/deepo/data:/root/data -v ~/Documents/deepo/config:/root/.jupyter deepo-jupyterlab
```

## Docker Compose로 실행

```shell
docker-compose up -d --build
```

![capture_jupyterlab](capture_jupyterlab.png)

```shell
http://localhost:8889
```

---

### 테마 변경

Settings - JupyterLab Theme - JupyterLab Horizon

## 설치되는 extentions

- git
- github
- google-drive
- shortcut gui
- cell tags
- nbdime
- file tree
- vim
- bytecode
- go to definition
- code dormatter
- output auto scroll
- font
  - anonymouse-pro
  - dejavu-sans-mono
  - fira code
- theme
  - dracula
  - horizon
  - material darker
