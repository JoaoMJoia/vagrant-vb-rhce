# Vagrant  Virtual Box  RHCE EX294

The project uses [Vagrant](https://www.vagrantup.com/) to deploy a infrastructure on [Virtual Box](https://www.virtualbox.org/) with the intuition of being used as lab for the [RHCE EX294](https://www.redhat.com/en/services/training/ex294-red-hat-certified-engineer-rhce-exam-red-hat-enterprise-linux-8) .

---

## Getting Started

That infrastructure have five ```RHEL 8```  virtual machines using [generic](https://app.vagrantup.com/generic)/[rhel8](https://app.vagrantup.com/generic/boxes/rhel8) vagrant box image, all with 1 CPU, the control node with 1024 MB and four managed nodes with 512 MB.

All the virtual machines are registered in the [Red Hat](https://www.redhat.com) account and has the mapping of the hostnames to IP addresses on the ```/etc/hosts```.

The control node have a root [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) key without pass phrase shared on the managed nodes. 
It is possible to use root with password ( default: lovely ) or changing variable `root_password`.

The deployment of the infrastructure it takes more or less twenty minutes.

The  ```vagrant_destroy.sh``` unregister on RedHat and destroy the infrastructure on the VirtualBox.

Tested on [Linux Mint](https://linuxmint.com/) and MacOS.

---

### Prerequisites

Before you begin, ensure you have met the following requirements:

* 15 GB of space
* Minimum 3 GB RAM
* Access to internet
* Virtual Box installed  ( https://www.virtualbox.org/wiki/Downloads )
* Vagrant binary installed  ( https://www.vagrantup.com/docs/installation/ )
* Ansible installed ( https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html )
* ```sshpass``` package on Linux or MacOS machine installed
  * For MacOS ```sshpass``` installation:
    * Download the [Source Code] ( https://sourceforge.net/projects/sshpass/ )
    * Extract it and cd into the directory
    * ./configure
    * sudo make install
* ```passlib``` package on Linux or MacOS machine installed
  * For MacOS ```passlib``` installation:
    * sudo pip install passlib

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

Uncomment and define root password
* ansible/playbook.yml
```
  vars:
    #root_password: <password>
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

If you want, reach me out at joaojoiapress@gmail.com.

---

## License

This project uses the following license: [MIT](https://github.com/JoaoMJoia/vagrant-vb-rhce/blob/master/LICENSE).
