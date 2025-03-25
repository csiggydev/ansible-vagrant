Vagrant.configure("2") do |config|
  config.vm.box = "net9/ubuntu-24.04-arm64"
  config.vm.provision "shell", path: "bootstrap"

  # Use insecure keys for testbed
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 512
    v.linked_clone = true
  end

  # Test Server #1
  config.vm.define "app" do |app|
    app.vm.hostname = "app1.test"
    app.vm.network :private_network, ip: "192.168.100.10"
  end

  # Test Server #2
  config.vm.define "app" do |app|
    app.vm.hostname = "app2.test"
    app.vm.network :private_network, ip: "192.168.100.11"
  end
  

  # # Execute basic test playbook
  # config.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "ansible/playbooks/playbook.yml"
  #   end
end