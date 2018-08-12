# vagrant-minikube


## Minikube 開始方法

仮想マシンを起動、ログインして、Minikube開始のコマンドを実行します。

~~~
$ vagrant up
$ vagrant ssh
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
$ sudo minikube stop
$ exit
$ vagrant halt
~~~


## 削除

~~~
$ vagrant destroy
~~~