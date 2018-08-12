# vagrant-minikube


## Minikube 開始方法

仮想マシンにログインして、開始のコマンドを実行します。

~~~
$ vagrant ssh

<中略>

$ sudo minikube start

~~~

k8sが起動するまでに、2〜3分ほどかかります。次のコマンドで、全てのポッドがrunningになれば完了です。

~~~
$ kubectl get pod --all-namespaces
~~~

## ダッシュボード

~~~
$ sudo minikube dashboard
~~~

http://172.16.20.10/ をアクセスするとダッシュボードが表示されます。



## 終了

~~~
$ exit
$ sudo minikube stop
$ vagrant halt
~~~


## 削除

~~~
$ vagrant destroy
~~~