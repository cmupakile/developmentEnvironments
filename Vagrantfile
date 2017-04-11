# -*- mode: ruby -*-
# vi: set ft=ruby :
required_plugins = ["vagrant-hostsupdater" , "vagrant-berkshelf"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end


Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.10.100"
  config.hostsupdater.aliases = ["development.local"]
  # config.vm.provision :shell, path: "install_script.sh"
  config.vm.synced_folder "../app" , "/home/ubuntu/app"

  config.vm.provision "chef_solo" do |chef|
  	chef.cookbooks_path = ['cookbooks']
  	chef.run_list = ['recipe[node-server::default]']
	end
end
