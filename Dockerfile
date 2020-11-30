# author: seongcheol jeon
# created date: 2020.11.30

# deepo (GPU) docker image
# FROM ufoym/deepo

# deepo (CPU) docker image
FROM ufoym/deepo:cpu

WORKDIR /root
COPY startJupyterLabServer.sh .
RUN chmod +x startJupyterLabServer.sh

# setup NodeJS 14 LTS
RUN apt-get update && apt-get -y install gpg-agent \
    && curl -sL https://deb.nodesource.com/setup_lts.x | bash \
    && apt-get install -y nodejs \
    && echo "***** Done installed NodeJS *****"

# upgrade pip
RUN pip install --upgrade pip \
    && pip install --upgrade jupyterlab-git --no-build \
    # dbdime (Jupyter Notebook Diff and Merge tools)
    && pip install --no-input nbdime \
    && pip install --no-input jupyterlab_code_formatter \
    && pip install --no-input --upgrade autopep8 \
    && pip install --no-input yapf \
    && echo "***** Done pip installed packages *****"

# [BEGIN] ##### install jupyter lab extension ##### #
# font
RUN jupyter labextension install @deathbeds/jupyterlab-fonts --no-build \
    && jupyter labextension install @deathbeds/jupyterlab-font-anonymous-pro --no-build \
    && jupyter labextension install @deathbeds/jupyterlab-font-dejavu-sans-mono --no-build \
    && jupyter labextension install @deathbeds/jupyterlab-font-fira-code --no-build \
    # cell tags
    && jupyter labextension install @jupyterlab/celltags --no-build \
    # github
    && jupyter labextension install @jupyterlab/github --no-build \
    # google drive
    && jupyter labextension install @jupyterlab/google-drive --no-build \
    # shortcut ui
    && jupyter labextension install @jupyterlab/shortcutui --no-build \
    # python byte code
    && jupyter labextension install jupyterlab-python-bytecode --no-build \
    # file tree
    && jupyter labextension install jupyterlab_filetree --no-build \
    # vim
    && jupyter labextension install @axlair/jupyterlab_vim --no-build \
    # go to definition
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build \
    # horizon theme
    && jupyter labextension install @mohirio/jupyterlab-horizon-theme --no-build \
    # material darker theme
    && jupyter labextension install @oriolmirosa/jupyterlab_materialdarker --no-build \
    # darcula theme
    && jupyter labextension install @telamonian/theme-darcula --no-build \
    # code formatter
    && jupyter labextension install @ryantam626/jupyterlab_code_formatter --no-build \
    && jupyter serverextension enable --py jupyterlab_code_formatter \
    # output auto scroll
    && jupyter labextension install @wallneradam/output_auto_scroll --no-build \
    # git
    # jupyterlab extensions 빌드
    && jupyter lab build --dev-build=False --minimize=False \
    echo "***** Done installed jupyter-lab extensions *****"
# [END] ##### install jupyter lab extension ##### #

RUN mkdir /data /config

# port 
EXPOSE 8889

# 컨테이너 실행시 jupyter-lab 서버 시작
ENTRYPOINT [ "/root/startJupyterLabServer.sh" ]
