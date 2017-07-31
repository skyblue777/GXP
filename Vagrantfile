# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.box = "hashicorp/precise64"
  config.vm.hostname = 'green-x-web.vagrant'
  config.vm.network "private_network", ip: "192.168.50.4"

  # This configuration will install puppet onto the VM and provision it with
  # Puppetmaster. This assumes you have Puppetmaster running on it's own VM.
  # You can see how to do this on the "Testing with Vagrant" article in the
  # Puppet confluence.

  config.vm.provision "shell" do |shell|
    shell.inline = <<-SCRIPT
      sudo apt-get update
      wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
      sudo dpkg -i puppetlabs-release-precise.deb
      sudo apt-get update
      sudo apt-get install -y puppet vim
      sudo puppet resource package hiera ensure=installed
    SCRIPT
  end

  config.vm.provision "puppet_server" do |puppet|
    puppet.puppet_server = "192.168.33.10"
    puppet.puppet_node = config.vm.hostname
    puppet.options = "--debug --verbose --waitforcert 60"
  end

end