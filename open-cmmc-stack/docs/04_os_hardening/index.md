# 🛡️ Section 4: Securing the Host OS

## 🎯 Objective

This section walks through hardening the Ubuntu 22.04 LTS host to meet the foundational system-level security expectations of CMMC Level 2. All configurations are managed using **Ansible**, enabling repeatability, version control, and audit readiness.

---

## 🧱 Host Hardening Checklist

- Disable password-based SSH access
- Enforce key-based login with limited user privileges
- Remove unnecessary packages and services
- Configure local firewall rules (UFW)
- Enforce strong password policies
- Enable system auditing (`auditd`)
- Install file integrity monitoring (`AIDE`)
- Apply system banners (AC.3.017)
- Schedule automatic security updates

---

## 🚀 Step-by-Step with Ansible

All tasks are included in the role `roles/harden_ubuntu/`. Here's a breakdown:

### 🔐 1. Disable Root Login and Enforce SSH Keys

```yaml
- name: Disable root login over SSH
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^PermitRootLogin'
    line: 'PermitRootLogin no'

- name: Disable password authentication
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^PasswordAuthentication'
    line: 'PasswordAuthentication no'
```

---

### 🧯 2. Install & Configure UFW Firewall

```yaml
- name: Install UFW
  apt:
    name: ufw
    state: present

- name: Enable UFW with default deny
  ufw:
    state: enabled
    policy: deny
```

Then explicitly allow needed ports:

```yaml
- ufw:
    rule: allow
    port: "22"
    proto: tcp
```

---

### 📋 3. Configure Password Policies

```yaml
- name: Set password complexity
  lineinfile:
    path: /etc/security/pwquality.conf
    regexp: '^minlen'
    line: 'minlen = 14'
```

Add login lockout:

```yaml
- name: Lock out after 5 failed attempts
  lineinfile:
    path: /etc/pam.d/common-auth
    line: 'auth required pam_tally2.so deny=5 onerr=fail unlock_time=900'
    create: yes
```

---

### 📝 4. Configure Login Banners

```yaml
- name: Create login banner
  copy:
    content: |
      WARNING: This system is monitored and access is restricted to authorized users. 
      Unauthorized access may result in disciplinary or legal action.
    dest: /etc/issue.net

- name: Enable banner in sshd
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: '^Banner'
    line: 'Banner /etc/issue.net'
```

---

### 📜 5. Enable Auditd and AIDE

```yaml
- name: Install auditd and AIDE
  apt:
    name:
      - auditd
      - aide
    state: present

- name: Initialize AIDE DB
  command: aideinit
  args:
    creates: /var/lib/aide/aide.db.gz
```

---

### 🔄 6. Enable Automatic Updates

```yaml
- name: Install unattended-upgrades
  apt:
    name: unattended-upgrades
    state: present

- name: Enable periodic security updates
  copy:
    dest: /etc/apt/apt.conf.d/20auto-upgrades
    content: |
      APT::Periodic::Update-Package-Lists "1";
      APT::Periodic::Unattended-Upgrade "1";
```

---

## ✅ CMMC Practices Addressed

| CMMC Practice | Purpose |
|---------------|---------|
| AC.1.001 | Enforces user authentication boundaries |
| AC.3.017 | Displays warning banners |
| CM.2.062 | Applies baseline hardening |
| SI.1.210 | Enables audit and log generation |
| SI.3.219 | Supports detection of unauthorized changes |

---

## 📎 Notes

- All hardening actions should be tested in a staging environment
- Logs from `auditd` and UFW should be forwarded to the SIEM layer (Wazuh or other)
- Password rules may be extended to include history and character diversity requirements

---

## ▶️ Next Step

With the base system secured, you’re ready to deploy **Identity & Access Management** using **Keycloak and Tailscale** in Section 5.

---
