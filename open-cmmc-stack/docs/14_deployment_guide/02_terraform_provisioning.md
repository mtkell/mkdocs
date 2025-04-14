# Phase 1: Terraform Infrastructure Provisioning

This phase provisions the baseline infrastructure using **Terraform**, establishing a consistent and repeatable environment for CMMC-aligned services. It supports both cloud-based and on-premise deployments (e.g., DigitalOcean, Proxmox, VMware).

## 🛠 Phase 1 – Infrastructure Provisioning (Terraform)

<img src="../../img/svg/phase01-terraform.svg" alt="Diagram of Terraform provisioning process for Ubuntu virtual machine and SSH access" style="width:100%; max-width:800px; margin:1em 0;">

---

## 🧰 Tools Required

- [Terraform CLI](https://developer.hashicorp.com/terraform/install)
- Access credentials for your cloud or hypervisor provider
- SSH key pair (`id_rsa`, `id_rsa.pub`) for Ansible provisioning
- Predefined VPC, firewall rules, or isolated network

---

## 🧱 Terraform Structure

Recommended folder layout:

```
terraform/
├── main.tf
├── variables.tf
├── terraform.tfvars
└── outputs.tf
```

---

## 🌐 Sample `main.tf` (DigitalOcean)

```hcl
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "cmmc_host" {
  name   = "cmmc-foss-server"
  region = var.region
  size   = var.size
  image  = "ubuntu-22-04-x64"

  ssh_keys = [var.ssh_key_fingerprint]

  tags = ["cmmc", "infrastructure"]
}
```

---

## 📦 Define Variables (`variables.tf`)

```hcl
variable "do_token" {}
variable "region"   { default = "nyc3" }
variable "size"     { default = "s-2vcpu-4gb" }
variable "ssh_key_fingerprint" {}
```

---

## 🔐 Add Secrets (`terraform.tfvars`)

```
do_token             = "your_do_token_here"
ssh_key_fingerprint  = "your_fingerprint"
```

---

## 🖥️ On-Prem Alternative (Proxmox)

Use `proxmox` provider or provision VMs via Ansible + cloud-init. Details can be added in an advanced appendix.

---

## ✅ Output of This Phase

- One or more hardened Ubuntu 22.04 VMs
- SSH key access for provisioning
- IP addresses or DNS names for Ansible roles

→ Proceed to [Phase 2: OS Hardening with Ansible](03_ansible_hardening.md)
