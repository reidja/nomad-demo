# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"


Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  config.vm.box = "coreos-alpha"
  config.vm.box_url = "https://storage.googleapis.com/alpha.release.core-os.net/amd64-usr/current/coreos_production_vagrant.json"

  config.vm.provider :virtualbox do |v|
    v.gui = false
    v.memory = 512
    v.cpus = 1
    v.check_guest_additions = false
    v.functional_vboxsf = false
  end

  (1..3).each do |i|
    config.vm.define vm_name = "server%02d" % [i] do |config|
      config.vm.hostname = vm_name

      config.vm.network :private_network, ip: "172.17.8.#{i+100}"
      config.vm.synced_folder ".", "/vagrant", id: "server%02d-vagrant" % i, nfs:true, mount_options: ['nolock,vers=3,udp']

      if i == 1
        config.vm.network "forwarded_port", guest: 8500, host:8500
      end

      config_path = File.join(File.dirname(__FILE__), "config/server%02d.yml" % i)
      if File.exist?(config_path)
        config.vm.provision :file, :source => "#{config_path}", :destination => "/tmp/vagrantfile-user-data"
        config.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true
      end
    end
  end

  (1..3).each do |i|
    config.vm.define vm_name = "client%02d" % [i] do |config|
      config.vm.hostname = vm_name

      config.vm.provider :virtualbox do |v|
        v.memory = 1024
      end

      config.vm.network :private_network, ip: "172.17.8.#{i+90}"
      config.vm.synced_folder ".", "/vagrant", id: "client%02d-vagrant" % i, nfs:true, mount_options: ['nolock,vers=3,udp']

      config_path = File.join(File.dirname(__FILE__), "config/client%02d.yml" % i)
      if File.exist?(config_path)
        config.vm.provision :file, :source => "#{config_path}", :destination => "/tmp/vagrantfile-user-data"
        config.vm.provision :shell, :inline => "mv /tmp/vagrantfile-user-data /var/lib/coreos-vagrant/", :privileged => true
      end
    end
  end
end