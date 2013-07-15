Vagrant::Config.run do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.host_name = 'doe-eye-dev-box'
  
  config.vm.forward_port 3000, 3000
	config.vm.forward_port 27017, 27017

  config.vm.provision :puppet, 
    :manifests_path => 'puppet/manifests',
    :module_path  => 'puppet/modules'
end
