# Vagrant  Virtual Box  RHCE EX294

The project uses [Vagrant](https://www.vagrantup.com/) to deploy a infrastructure on [Virtual Box](https://www.virtualbox.org/) with the intuition of being used as lab for the [RHCE EX294](https://www.redhat.com/en/services/training/ex294-red-hat-certified-engineer-rhce-exam-red-hat-enterprise-linux-8) .

---

## Getting Started

That infrastructure have five ```RHEL 8```  virtual machines using [generic](https://app.vagrantup.com/generic)/[rhel8](https://app.vagrantup.com/generic/boxes/rhel8) vagrant box image, all with 1 CPU, the control node with 1024 MB and four managed nodes with 512 MB.

All the virtual machines are registered in the [Red Hat](https://www.redhat.com) account and has the mapping of the hostnames to IP addresses on the ```/etc/hosts```.

The control node have a root [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) key without pass phrase shared on the managed nodes.

The  ```vagrant_destroy.sh``` unregister and destroy the infrastructure.

Tested on [Linux Mint](https://linuxmint.com/).

---

### Prerequisites

Before you begin, ensure you have met the following requirements:

* 15 GB of space
* Minimum 3 GB RAM
* Access to internet
* Virtual Box installed  ( https://www.virtualbox.org/wiki/Downloads )
* Vagrant binary installed  ( https://www.vagrantup.com/docs/installation/ )
* Ansible installed ( https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html )
* ```sshpass``` package on linux machine installed
* An account on Red Hat to register the virtual machines.

---

### Configure

Add your Red Hat account:

* files/script.sh
```
subscription-manager register --username=******** --password='********'
```
Point to your vagrant insecure private key

* vagrant_destroy.sh
```
-o IdentityFile=/home/********/.vagrant.d/insecure_private_key
```

### Deployment

* Build

```
vagrant up
```

* Destroy
```
sh vagrant_destroy.sh
```

### Use
To access the virtual machines use the command ```vagrant ssh-config``` and configure your ```~/.ssh/config``` or do a forwarding on your [PuTTy](https://www.chiark.greenend.org.uk/~sgtatham/putty/)

---

## References

Links:
* https://www.lisenet.com/2019/ansible-sample-exam-for-ex407/
* https://www.redhat.com
* https://www.vagrantup.com/
* https://www.virtualbox.org/
* https://github.com/bcochofel/vagrant-docker-swarm-cluster

----

## Contact

If you want reach me at joaojoiapress@gmail.com.

---

## License

This project uses the following license: [MIT](https://github.com/JoaoMJoia/vagrant-vb-rhce/blob/master/LICENSE).
