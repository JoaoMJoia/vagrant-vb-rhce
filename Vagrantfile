
nodes = [
  { :hostname => 'ansible-control.hl.local', :ip => '192.168.80.11', :ram => 1024, :cpus => 1 },
  { :hostname => 'ansible2.hl.local', :ip => '192.168.80.12', :ram => 512, :cpus => 1 },
  { :hostname => 'ansible3.hl.local', :ip => '192.168.80.13', :ram => 512, :cpus => 1 },
  { :hostname => 'ansible4.hl.local', :ip => '192.168.80.14', :ram => 512, :cpus => 1 },
  { :hostname => 'ansible5.hl.local', :ip => '192.168.80.15', :ram => 512, :cpus => 1 },
]

Vagrant.configure("2") do |config|
 config.ssh.insert_key = false
 config.vm.box = "generic/rhel8"
 # Forward ssh agent to easily ssh into the different machines
 config.ssh.forward_agent = true

#Disabling the default /vagrant share
 config.vm.synced_folder ".", "/vagrant", disabled: true
  # Provision nodes
  nodes.each do |node|
    config.vm.define node[:hostname] do |config|
      config.vm.hostname = node[:hostname]
      config.vm.network :private_network, ip: node[:ip]

      memory = node[:ram] ? node[:ram] : 2048;
      cpus = node[:cpus] ? node[:cpus] : 1;

      config.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--memory", memory.to_s,
          "--cpus", cpus.to_s
        ]
      end

 config.vm.provision "shell", path: "files/script.sh"

      # Provision both VMs using Ansible after the last VM is booted.
        config.vm.provision "ansible" do |ansible|
          ansible.verbose = "v"
          ansible.compatibility_mode = "2.0"
          ansible.playbook = "ansible/playbook.yml"
          ansible.inventory_path = "ansible/inventory"
        end
    end
  end
end
