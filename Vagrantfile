Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 8181, host: 8181
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = 4096
  end

  config.vm.provision "shell", path: "./init.sh", privileged: false
end
