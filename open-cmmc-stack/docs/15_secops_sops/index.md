# 🛡️ Section 15: Security Operations Procedures (SecOps SOPs)

## 🎯 Objective

This section defines the **routine security tasks** required to maintain, monitor, and verify the operational security of the OpenCMMC Stack. These procedures support ongoing compliance with **System and Information Integrity (SI)**, **Configuration Management (CM)**, **Access Control (AC)**, and **Audit and Accountability (AU)** domains in CMMC Level 2.

---

## 📆 Daily Operations Checklist

| Task | Responsible Role | Tools | Evidence |
|------|------------------|-------|----------|
| Review Wazuh dashboard alerts | Security Officer | Wazuh Web UI | Screenshot or exported alert logs |
| Check Podman service health | System Admin | `podman ps`, `systemctl status` | CLI output |
| Verify overnight backup success | System Admin | `journalctl -u restic-backup.timer` | Timer log |
| Tailscale device review | Network Admin | Tailscale Admin Panel | Screenshot or audit log |

---

## 📅 Weekly Operations Checklist

| Task | Responsible Role | Tools | Evidence |
|------|------------------|-------|----------|
| Apply pending OS updates (non-emergency) | System Admin | `apt`, `ansible-pull` | Ansible log or `apt list --upgradable` |
| Review Keycloak login history and MFA failures | Security Officer | Keycloak Admin Console | Audit log export |
| Rotate logs to archive | System Admin | `logrotate`, `tar` | Archived `.gz` file list |
| Compare current container image versions | DevSecOps | `podman image ls`, `skopeo inspect` | Version report or SBOM diff |

---

## 🗓️ Monthly Operations Checklist

| Task | Responsible Role | Tools | Evidence |
|------|------------------|-------|----------|
| Run backup restore test | Security Officer | `restic`, `diff` | Screenshot or diff report |
| Review all Wazuh rule overrides | Security Officer | Wazuh Rules Config | Rule diff or exported rules |
| Conduct user access review | HR + IT | Keycloak Groups | Access report |
| Test disaster recovery procedure | System Admin | Runbook or manual | Checklist completion or script output |

---

## 🛠️ Tools and Scripts Used

- `restic-backup.sh` — backup and retention
- `podman` — container monitoring and updates
- `ansible` — patch automation, drift detection
- `journalctl` — log source for backup and security events
- `Wazuh` — security alerts and compliance reporting
- `Keycloak` — access logging and user behavior

---

## 🗂️ Audit Artifacts to Maintain

| Artifact | Source | Frequency |
|----------|--------|-----------|
| Wazuh alerts (critical/high) | Wazuh dashboard | Daily |
| Backup logs | systemd journal | Daily |
| Restore test success/fail log | CLI/Restic output | Monthly |
| Patch application log | Ansible/Apt | Weekly |
| Keycloak login audit | Exported .csv | Weekly |

---

## 📌 CMMC Practices Addressed

| Practice | Description |
|----------|-------------|
| SI.2.216 | Monitor system security alerts and logs |
| SI.1.210 | Identify unauthorized use or modification |
| CM.2.067 | Monitor system configuration |
| AC.1.001 | Maintain access restrictions |

---

## ✅ Next Step

In the next section, you’ll document how new users and devices are securely provisioned and scoped using identity-based Zero Trust policies.
