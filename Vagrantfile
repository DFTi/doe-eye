Vagrant.configure("2") do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.host_name = 'doe-eye-dev-box'

  config.vm.provision :puppet do |puppet|
    :manifests_path => 'puppet/manifests',
    :module_path    => 'puppet/modules'
  end
end
