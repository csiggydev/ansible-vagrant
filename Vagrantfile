Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provision "shell", path: "bootstrap"

  # Execute basic test playbook
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbooks/playbook.yml"
    end
  end