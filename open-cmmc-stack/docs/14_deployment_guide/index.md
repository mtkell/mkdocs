# 🚀 Section 14: Deployment Guide

## 🎯 Objective

This section outlines a step-by-step deployment path to implement the OpenCMMC Stack using fully automated, reproducible infrastructure-as-code workflows. Each phase corresponds to a tightly scoped operational unit aligned with CMMC Level 2 practices.

---

## 📌 Overview of Phases

| Phase | Title                               | Tools Used              | Evidence Folder              |
|-------|-------------------------------------|--------------------------|------------------------------|
| 0     | Planning & Scope Definition         | Markdown, Diagrams       | `evidence/00_scoping/`       |
| 1     | Terraform VM Provisioning           | Terraform                | `evidence/01_identity_access/` |
| 2     | Host Hardening with Ansible         | Ansible, UFW, AIDE       | `evidence/02_system_hardening/` |
| 3     | Podman-Based Service Container Setup| Podman, Systemd          | `evidence/03_file_sharing/`  |
| 3A    | Secure File Sharing with Nextcloud  | Nextcloud AIO            | `evidence/03_file_sharing/`  |
| 4     | Identity, MFA, and Cert Management  | Keycloak, ACME, SCEP     | `evidence/01_identity_access/` |
| 5     | Client Device Registration & Policy | Platform-specific MDM    | `evidence/01_identity_access/` |
| 6     | Logging, SIEM, and Alerting         | Wazuh, Auditd            | `evidence/05_monitoring/`    |
| 7     | Validation, Screenshots & Export    | Manual + CI              | `evidence/06_backups/`       |

---

## ⚙️ How to Use This Section

Each step in the deployment includes:

- ✅ Playbook file and role used
- 📁 Where to store your evidence
- 🔗 Related diagrams
- 📝 References to corresponding SSP sections

---

## 📐 Phase 0 – Planning & Scope

Ensure all project stakeholders agree on:

- What systems process CUI or FCI
- Deployment boundaries (cloud/on-prem)
- Target number of users/devices
- DNS zones, certificate providers, and external access needs

_Artifacts to collect:_
- `network-topology.mmd` → `img/svg/`
- `evidence_index.md`
- Domain diagrams and port maps

---

## 🧱 Phase 1 – Provision Infrastructure (Terraform)

```bash
terraform init
terraform apply
```

Evidence to collect:
- Terraform plan/apply logs
- Output IPs
- SSH key fingerprints

_Artifacts:_
- `main.tf`
- `bootstrap.sh`
- `terraform.tfvars.example`

---

## 🛡️ Phase 2 – Harden Host (Ansible)

```bash
ansible-playbook -i inventory localhost playbooks/phase02_ansible_hardening.yml
```

Includes:
- SSH lock-down
- Password policy
- Login banner
- UFW and Auditd

_Artifacts:_
- `audit.log`
- `sshd_config`
- `aide.db.gz`

---

## 🔧 Phase 3 – Podman Services

```bash
ansible-playbook -i inventory localhost playbooks/phase03_podman_services.yml
```

Installs Podman and sets up:

- Rootless container runtime
- Systemd service wrappers
- Logging socket passthrough

_Artifacts:_
- Podman install logs
- Systemd service manifests
- Runtime socket test output

---

## 📂 Phase 3A – Deploy Secure File Sharing (Nextcloud AIO)

This step deploys the secure file collaboration environment using the `file_storage` Ansible role. It pulls the hardened Nextcloud All-in-One container and mounts persistent storage volumes to host CUI/FCI data.

```bash
ansible-playbook -i inventory localhost playbooks/phase03a_file_storage.yml
```

Artifacts from this step should be archived under `evidence/03_file_sharing/` including container logs, volume listings, and security posture verification.

---

## 🔐 Phase 4 – Identity & Certificate Management

```bash
ansible-playbook playbooks/phase04_identity_cert.yml
```

Includes:
- Keycloak realm and MFA
- External IdP setup (optional)
- ACME DNS/HTTP validation
- TLS termination config

Artifacts:
- Realm export JSON
- Group mappings
- Certbot or Step-CA logs

---

## 📱 Phase 5 – Client Registration

Includes:
- Android/iOS/Windows/Mac device onboarding
- Identity binding via Tailscale or LDAP
- MDM enrollment or profile loading

Artifacts:
- MDM profile screenshots
- Device join logs
- VPN identity fingerprint

---

## 📊 Phase 6 – Logging, SIEM & Alerting

```bash
ansible-playbook playbooks/phase06_logging_monitoring.yml
```

- Wazuh deployment
- Central log forwarding (journald, auditd)
- Anomaly detection rules

Artifacts:
- Wazuh install logs
- Sample alerts
- Evidence forwarding screenshot

---

## ✅ Phase 7 – Validation & Export

Compile final evidence set:

- Screenshot walkthrough
- Playbook run logs
- Log integrity export
- SSP references and traceability

Export Markdown to PDF:

```bash
mkdocs build
```

---

## ⬅️ Return to [README.md](../README.md) or proceed to [Section 15: SecOps SOPs](../15_secops_sops/index.md)

---
