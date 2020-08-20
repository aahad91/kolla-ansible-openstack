Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |vb|
      vb.cpus = 6
      vb.memory = 8192
    end
    config.vm.define "openstack" do |openstack|
      #openstack.vm.network "private_network", ip: "192.168.50.10"
      openstack.vm.network "public_network", bridge: 'en0: Wi-Fi (Wireless)'  
      openstack.vm.network "public_network", bridge: 'en4: Thunderbolt 4'
      openstack.vm.hostname = "openstack"
      openstack.vm.provision "ansible" do |ansible|
        ansible.playbook = "openstack-playbook.yml"
        end
    end
  end