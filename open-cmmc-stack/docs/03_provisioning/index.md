# 📦 Section 3: Provisioning Infrastructure

## 🧭 Objective

This section explains how to **provision a secure virtual server** for the OpenCMMC Stack using **Infrastructure as Code (IaC)**. We use **Terraform** for automated provisioning and **Ansible** for post-deployment configuration.

This environment will host your containerized, CMMC-aligned services and enforce key technical controls such as least privilege, rootless access, encryption, and system auditing from day one.

---

## ☁️ Target Environments

This guide is compatible with:

- **Cloud providers**: DigitalOcean, AWS EC2, Hetzner Cloud, Linode
- **On-premise**: VirtualBox, VMware, or Proxmox (with manual adaptation)
- **Bare metal**: Supported via PXE or image-based deployment

We’ll demonstrate using **DigitalOcean** for simplicity and speed.

---

## 🧰 Required Tools

Before proceeding, install the following on your local workstation:

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [Ansible](https://docs.ansible.com/)
- [Python 3 & pip](https://www.python.org/downloads/)
- SSH keypair for your user (`ssh-keygen`)

---

## 🚀 Step-by-Step Provisioning with Terraform

### 1. Configure Terraform Provider

Create a `main.tf` file:

```hcl
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "secure_host" {
  name   = "cmmc-hardened"
  region = "nyc3"
  size   = "s-2vcpu-4gb"
  image  = "ubuntu-22-04-x64"
  ssh_keys = [var.ssh_fingerprint]

  user_data = file("bootstrap.sh")
}

output "droplet_ip" {
  value = digitalocean_droplet.secure_host.ipv4_address
}
```

Create a `variables.tf`:

```hcl
variable "do_token" {}
variable "ssh_fingerprint" {}
```

---

### 2. Create `bootstrap.sh` Cloud Init Script

```bash
#!/bin/bash
apt update && apt install -y git python3-pip
pip3 install ansible
git clone https://github.com/your-org/open-cmmc-stack.git
cd open-cmmc-stack/ansible
ansible-playbook -i localhost, secure_ubuntu.yml
```

This script installs Ansible and immediately runs your secure hardening role.

---

### 3. Initialize and Apply Terraform

```bash
terraform init
terraform apply
```

Your secure host will be provisioned and bootstrapped.

---

## 🔐 SSH-Only Access (No Password Login)

Ensure your Terraform setup **does not enable password authentication**. You may also verify your Ansible hardening role disables root SSH login and enforces key-based access only.

```yaml
- name: Disable root login
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^PermitRootLogin'
    line: 'PermitRootLogin no'
```

---

## 📋 Post-Provision Checklist

After provisioning, validate:

- SSH access using your private key
- Root login is disabled
- Firewall is active (`ufw status`)
- Ansible has applied initial hardening

---

## 🔁 Alternative: Provision Manually + Ansible Pull

For air-gapped or restricted environments, you may:

1. Provision an Ubuntu server manually
2. Upload your SSH key
3. Log in and run:

```bash
sudo apt update && sudo apt install -y git ansible
git clone https://github.com/your-org/open-cmmc-stack.git
cd open-cmmc-stack/ansible
ansible-playbook -i localhost, secure_ubuntu.yml
```

---

## 📜 Relevant CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| AC.1.001 | Limit system access to authorized users |
| CM.2.062 | Employ security configuration baselines |
| MA.3.115 | Perform automated maintenance updates |
| SC.3.177 | Protect confidentiality with encrypted comms |

---

## ✅ Next Step

Once your infrastructure is provisioned and secured, you’re ready to begin deploying core security and identity services using rootless containers.

We’ll cover that in the next section: **Securing the Host OS**.

---
