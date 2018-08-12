# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "minikube"
  private_ip = "172.16.20.10"
  config.vm.network "private_network", ip: private_ip
  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "2048"
     vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-EOF
echo net.bridge.bridge-nf-call-iptables = 1 >> /etc/sysctl.conf
sysctl -p

#
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

#
# Add repo Docker-CE
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

#
# Install Docker-CE
apt-get update
apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep 17.12 | head -1 | awk '{print $3}')
usermod -aG docker vagrant

#
# Add repo Kubernetes
cat <<EOF2 >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF2

#
# Install Kubernetes
apt-get update
#apt-get install -y kubelet=1.9.6-00 kubeadm=1.9.6-00 kubectl=1.9.6-00
#apt-get install -y kubelet=1.10.3-00 kubeadm=1.10.3-00 kubectl=1.10.3-00
#apt-get install -y kubelet kubeadm kubectl
apt-get install -y kubectl=1.10.3-00

#
# Install Minikube
curl -sLo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube

#
# Install nfs-client
apt-get update
apt-get install -y nfs-common


# Setup Minikube
#
/usr/local/bin/minikube start --vm-driver none
sleep 30
/usr/local/bin/minikube stop

mv /root/.kube /home/vagrant/.kube
chown -R vagrant /home/vagrant/.kube
chgrp -R vagrant /home/vagrant/.kube

mv /root/.minikube /home/vagrant/.minikube
chown -R vagrant /home/vagrant/.minikube
chgrp -R vagrant /home/vagrant/.minikube

#
sed -i -e 's|root|home\/vagrant|g' /home/vagrant/.kube/config

EOF

end
