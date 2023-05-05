# 数理最適化用のDocker環境 for Apple Silicon Macbook

## セットアップ

1. Dockerをインストール
https://matsuand.github.io/docs.docker.jp.onthefly/desktop/mac/install/

2. コンテナをbuild (約15分)
    ```
    $ git clone git@github.com:RNakao/math_optimization_environment.git
    $ cd math_optimization_environment
    $ chmod 755 install_cvxopt.sh
    $ docker-compose up -d --build
    ```

3. ブラウザからJupyter Notebookにアクセス
    ```
    http://localhost:8888/
    ```

## その他

- Intelチップの場合、Dockerfileを以下のように変更してください
    ```Dockerfile
    # Before
    FROM --platform=linux/amd64 python:3.7

    # After
    FROM python:3.7
    ```
- Dockerfileの設定を変更した場合はbuildしなおしてください
    ```
    $ docker-compose up -d --build
    ```
- buildし直した場合、不要なdockerイメージが蓄積していくので削除してください
    ```
    $ docker rmi $(docker images -f "dangling=true" -q)
    ```
