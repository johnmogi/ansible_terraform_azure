# ansible_terraform_azure


- name: Run the equivalent of "apt-get update" as a separate step
        apt:
         update_cache: yes
      - name: Ansible shell module multiple commands
        shell: 'curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -'
      - name: Install reqired packages
        apt: name={{ item }} state=present
        with_item
          - nodejs