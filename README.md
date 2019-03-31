# jenkins-slave
docker jenkins slave

## build

```docker build -t jenkins-slave .```

## run

```docker run --name=jenkins-slave -t -d -p 10022:22 akikinyan/jenkins-slave```

## ノードを追加する時

リモートFSルート (/home/jenkins)  
起動方法 (「SSH 経由でUnixマシンのスレーブエージェント」を指定)  
ホスト (コンテナのIPアドレスを指定)  
認証情報 (Dockerfile内で指定。jenkins/password)  
Host Key Verification Strategy (Non Verifying Verification Strategy を指定)  
