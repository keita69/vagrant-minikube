# vagrant-minikube

この Vagrant と Ansible のコードは、VirtualBox の仮想サーバー上に、Minikubeを起動するためのものです。
Minikubeは、実行時の最新バージョンが起動されるようになっています。


## Minikube 開始方法

仮想マシンを起動、ログインして、Minikube開始のコマンドを実行します。

~~~
$ vagrant up
$ vagrant ssh
$ sudo minikube start
~~~

k8sが起動するまでに、10分ほどかかります。次のコマンドで、全てのポッドがrunningになれば完了です。

~~~
$ kubectl get pod -n kube-system
~~~

もしも、ポッドのなかで状態が、Terminating になっていたら、一度、Minikubeを停止させて再開してみてください。
筆者の経験では、ほとんどのケースで解決しています。

~~~
vagrant@minikube:~$ sudo minikube stop
Stopping local Kubernetes cluster...
Machine stopped.
vagrant@minikube:~$ sudo minikube start
Starting local Kubernetes v1.13.2 cluster...
Starting VM...
~~~


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



## 参考資料

* https://github.com/kubernetes/minikube
* https://kubernetes.io/docs/tasks/tools/install-minikube/#install-minikube
