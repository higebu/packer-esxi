REQUIRED_PLUGINS = %w(vagrant-esxi)
exit unless REQUIRED_PLUGINS.all? do |plugin|
  Vagrant.has_plugin?(plugin) || (
    puts "The #{plugin} plugin is required. Please install it with:"
    puts "$ vagrant plugin install #{plugin}"
    false
  )
end

File.open("version.txt", 'w') do |f|
  f.write(Vagrant::VERSION)
end

Vagrant.configure("2") do |config|
  config.ssh.default.username = "root"
  config.ssh.shell = "sh"
  config.ssh.insert_key = false

  config.vm.hostname = "vagrantbox"
  config.vm.box = "esxi"
  config.vm.synced_folder ".", "/vagrant", nfs: true

  [:vmware_fusion, :vmware_workstation].each do |name|
    config.vm.provider name do |v,override|
      v.vmx["memsize"] = "4096"
    end
  end

  config.vm.provision "shell", privileged: false, path: "provision.sh"
end
