# Deepo JupyterLAB

deepo 이미지에 jupyter-lab extension을 설치하는 dockerfile이다.

## 설치 방법

```shell
docker build -t <your name>/deepo_jupyterlab:1.0 .
```

## 컨테이너 실행

```shell
docker container run -itd -p 8888:8888 --name=deepo -v ~/Documents/deepo/data:/data -v ~/Documents/deepo/config:/config --ipc=host jsgcl/deepo_jupyterlab:1.0
```
