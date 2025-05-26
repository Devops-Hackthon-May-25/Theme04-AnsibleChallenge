# Hackathon Challenge: AWS Infra + Ansible

## 🎯 Objectives

Provision infrastructure with Terraform and configure it with Ansible. Your tasks:

1. Use given terraform module to setup ec2 and vpc components.
2. Setup Passwordless ssh connection for web servers
3. Build a **dynamic inventory script**
4. Write an **Ansible playbook** to:
   - Install and enable NGINX
   - Backup the default index.html
   - Deploy a new index.html
   


---

## ✅ Provided

- Full AWS infrastructure (VPC, Subnet, EC2, IAM Role, SSH Key)
- Terraform-generated key pair (`id_rsa`)
- Ansible config (`ansible.cfg`)
- index.html

---

## 🚀 Instructions

### 1. Provision AWS Infra

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

---

### 2. Setup Passwordless SSH

- **Hint:** You have two options:

✅ Option A: Modify the Terraform user_data for the web servers to add the controller’s public key to ~/.ssh/authorized_keys

🔧 Option B: Manually run the ssh  commands from the controller.

- Update your `ansible.cfg` to use this key:
  ```ini
  [defaults]
  private_key_file = ~/.ssh/id_rsa
  ```

---

### 3. Use Dynamic Inventory

- **Hint:** Please complete the function part in the dynamic inventory script (`ansible/ec2_dynamic_inventory.py`) to fetch EC2 instance IPs from AWS.
- Make it executable:
  ```bash
  chmod +x ansible/ec2_dynamic_inventory.py
  ```
- Test it:
  ```bash
  ./ansible/ec2_dynamic_inventory.py --list
  ```

---

### 4. Run the Ansible Playbook

- Use  dynamic inventory script and the provided `index.html`:
  ```bash
  ansible-playbook -i ansible/ec2_dynamic_inventory.py playbook.yml --extra-vars "index_html=./index.html"
  ```
- Your playbook should:
  - Install and enable NGINX (`ansible.builtin.yum` or `ansible.builtin.apt`)
  - Backup `/usr/share/nginx/html/index.html`
  - Deploy the new `index.html` to `/usr/share/nginx/html/`

**Reference:**  
- [Ansible Dynamic Inventory](https://docs.ansible.com/ansible/latest/inventory_guide/intro_dynamic.html)  
- [Ansible Playbooks](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html)  
- [Copy Module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html)

