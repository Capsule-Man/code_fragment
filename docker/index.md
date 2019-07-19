# Docker

- デメリット
    - 手間がかかる 
        - Dockerのコマンドにある程度慣れる必要がある
        - Windows7にDockerを[導入](http://docs.docker.jp/windows/step_one.html)するのが手間かかる？
        - condaとかの仮想環境の設定ファイル(condaならyaml)をやり取りする方がラク？
    - イメージが割とディスクを食う
        - Jupyterのイメージだと5GBくらい
        - GitLabで運用するなら、サーバーのディスク容量をきちんと確保しないといけない（？）
        - サーバーからイメージをpush/pullするときに、ネットワークに負荷がかかるかもしれない（？）
            - jupyterのイメージをGitlab.comにpushするとき、一時的にブラウザでネットサーフィンできなくなりました

- メリット
    - 運良くGitLabの[Conteinar Registry](https://qiita.com/thaim/items/4e7e74e3a1be95fef821)が使える
        - Dockerイメージをバージョン管理できる機能
        - GitLabに組み込む形で、分析環境を共有する仕組みを作りやすいのでは
        - 管理者権限でContainer Registryを使用できるように設定変更する必要あり
    - すぐに手元に同じ環境を構築できる
        - ```docker pull```だけでGitLabのサーバーから手元のPCにイメージを引っ張ってこれる
        - ```docker run```でイメージからコンテナを立ち上げ、すぐに人が構築した分析環境を再現できる
        - 一度コンテナを立ち上げてしまえば、普通にダウンロードしてJupyterを使うのと使い勝手は変わらないはず（？）
            - コンテナ立ち上げて、ブラウザから```localhost:????```にアクセスすると使えるはず
        - [ざっくりとした操作方法](https://docs.gitlab.com/ee/user/project/container_registry.html)
    - イメージに触れる人を制限することができる
        - GitLabのDeploy Token機能を使えば、限られた人だけがpush / pullできるようになる
        - そもそもプロジェクト自体にもアクセス権限を設定できる
