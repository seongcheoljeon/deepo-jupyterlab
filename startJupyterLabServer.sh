#!/bin/bash

# author: seongcheol jeon
# created date: 2020.11.30


# bash 쉘에서 실행할 때는 아래의 명령을 사용하면 된다.
# /usr/bin/nohup /usr/local/bin/jupyter lab --ip 0.0.0.0 --port 8889 --allow-root --no-browser --notebook-dir=/data --NotebookApp.token='' --NotebookApp.password='' &

# dockerfile에서 실행할 때는 아래의 명령을 사용하면 된다.
/usr/local/bin/jupyter lab --ip 0.0.0.0 --port 8889 --allow-root --no-browser --notebook-dir=/data --NotebookApp.token='' --NotebookApp.password=''
