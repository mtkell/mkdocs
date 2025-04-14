# Phase 2: OS Hardening with Ansible

This phase configures the secure operating system baseline using Ansible. It applies hardened system defaults and prepares the host for rootless container deployment using Podman.

## 🛡 Phase 2 – OS Hardening with Ansible

<img src="../../img/svg/phase02-ansible.svg" alt="Diagram showing OS hardening steps including UFW, auditd, AIDE, and role setup using Ansible" style="width:100%; max-width:800px; margin:1em 0;">

---

## 🧰 Tools Required

- [Ansible](https://docs.ansible.com/)
- SSH key access to provisioned VM(s)
- Hardened role or playbook (custom or from `dev-sec/ansible-collection-hardening`)

---

## 🛡️ Security Controls Implemented

| Control Area | Control |
|--------------|---------|
| Access Control (AC) | SSH lockdown, sudo restrictions |
| System Integrity (SI) | AIDE, auditd, tamper detection |
| Configuration Management (CM) | Idempotent playbooks |
| Security Protection (SC) | ufw, fail2ban, automatic updates |

---

## 📁 Suggested Folder Layout

```
ansible/
├── inventory/
│   └── hosts.ini
├── playbooks/
│   └── hardening.yml
├── roles/
│   └── hardening/
```

---

## 🧪 Sample `playbooks/hardening.yml`

```yaml
- name: Apply hardening to base OS
  hosts: all
  become: yes
  roles:
    - role: hardening
```

---

## ⚙️ What the Role Should Do

- Disable root SSH access
- Enable firewall (ufw)
- Set minimum password complexity
- Install & configure:
  - `auditd`
  - `aide`
  - `fail2ban`
  - `unattended-upgrades`

---

## 📝 Verification Tasks

- Run `aideinit` and confirm baseline creation
- Run `auditctl -l` and `journalctl` to confirm logs
- Test fail2ban trigger via SSH login attempts

---

## ✅ Output of This Phase

- A hardened base system per CIS Level 1 guidance
- Ansible inventory + role ready for future updates
- Rootless `podman` installed and tested

→ Proceed to [Phase 3: Podman Service Deployment](04_podman_services.md)
