Vagrant.configure("2") do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.hostname = 'doe-eye-dev-box'

  config.vm.network :forwarded_port, host: 3000, guest: 3000
  config.vm.network :forwarded_port, host: 27017, guest: 27017

  config.vm.provision :puppet,
    :manifests_path => 'puppet/manifests',
    :module_path  => 'puppet/modules'
end
