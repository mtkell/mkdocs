# 🚨 Section 18: Incident Response & Forensics Toolkit

## 🎯 Objective

This section documents the basic **incident response (IR)** and **digital forensics** capabilities built into the OpenCMMC Stack. These procedures ensure organizations can detect, respond to, and investigate security incidents while maintaining CMMC Level 2 compliance across the **Incident Response (IR)**, **System Integrity (SI)**, and **Audit (AU)** domains.

---

## 🧭 Incident Response Workflow

| Phase | Activity | Responsible Party |
|-------|----------|-------------------|
| Identification | Wazuh alert, log review, anomaly detection | Security Officer |
| Containment | Revoke access, disable device, isolate container | IT Administrator |
| Eradication | Patch, clean malware, reset credentials | IT Administrator |
| Recovery | Restore from backup, validate system | System Owner |
| Lessons Learned | Document event, root cause analysis | IR Team / Owner |

---

## 🛠️ Built-In IR Toolkit

| Tool | Use Case |
|------|----------|
| Wazuh | SIEM alerting, agent logs, rootkit detection |
| Tailscale ACL | Instantly revoke device access |
| Ansible | Re-image, rotate credentials, config diff |
| Restic | Backup restoration and snapshot rollback |
| Auditd | Local command history and access tracking |

---

## 🧪 IR Playbooks

| Scenario | Playbook Path | Outcome |
|----------|----------------|---------|
| Ransomware Detected | `playbooks/ir/ransomware.yml` | Isolate, backup, restore clean |
| Unauthorized Login | `playbooks/ir/access_violation.yml` | Rotate creds, notify user, log |
| File Integrity Alert | `playbooks/ir/filesystem_anomaly.yml` | Snapshot, analyze, alert |

Each playbook can be invoked via `ansible-playbook` or executed in staging mode for tabletop exercises.

---

## 🕵️ Forensic Data Collection

| Source | Method | Retention |
|--------|--------|-----------|
| Audit logs | `journalctl`, `auditctl`, `Wazuh` | 90 days |
| Container state | `podman diff`, `podman inspect` | Snapshot file |
| Network activity | Tailscale admin logs | 30 days |
| File changes | AIDE database | Rotated weekly |
| User activity | Keycloak login records | 60 days |

---

## 📜 CMMC Practices Addressed

| Practice | Description |
|----------|-------------|
| IR.2.093 | Detect and report events |
| IR.2.094 | Analyze and triage incidents |
| IR.2.095 | Contain, eradicate, and recover |
| IR.2.096 | Track and document response |
| AU.2.042 | Maintain audit records |
| SI.1.210 | Identify unauthorized activity |

---

## ✅ Next Step

Now that incident response is defined, the next section (19) will define how CUI and FCI flow through the environment and how boundaries are enforced.
