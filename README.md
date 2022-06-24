# ansible_terraform_azure

Sela week 6 terraform ansible

Staging public ip: 20.124.5.101
http://20.124.5.101:8080/
frontend subnets : 10.0.20.4 | 10.0.20.5

prod public ip: 20.124.177.159
frontend subnets : 10.0.20.4 | 10.0.20.5 | 10.0.20.6




- name: Run the equivalent of "apt-get update" as a separate step
        apt:
         update_cache: yes
      - name: Ansible shell module multiple commands
        shell: 'curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -'
      - name: Install reqired packages
        apt: name={{ item }} state=present
        with_item
          - nodejs