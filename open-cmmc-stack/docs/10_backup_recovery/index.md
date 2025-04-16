# 🗄️ Section 10: Backup & Recovery

## 🎯 Objective

This section provides guidance on establishing a secure, verifiable, and CMMC-aligned **backup and recovery strategy** for self-hosted infrastructure. It ensures organizations can recover from data loss, ransomware, or compromise while meeting **System & Information Integrity (SI)** and **Contingency Planning (CP)** control requirements.

---

## 🧩 Why This Matters

CMMC Level 2 requires not only backups but **tested, restorable, secure** backups. Many small businesses lose compliance due to poor validation, insecure storage, or unclear responsibilities.

---

## 🔧 Recommended Tools

| Tool       | Purpose                                |
|------------|----------------------------------------|
| **Restic** | Fast, encrypted backup with deduplication |
| **BorgBackup** | Efficient backups with compression |
| **Rclone** | Sync to cloud or remote endpoints      |

For consistency with automated deployments, this stack uses **Restic** by default.

---

## ⚙️ Automated Backup Deployment with Ansible

The OpenCMMC Stack includes an Ansible role `roles/backup` that:

- Installs Restic via `apt`
- Deploys a backup script from template
- Configures backup environment variables
- Sets up a systemd service and timer to run backups daily

### Files Deployed:

| File | Purpose |
|------|---------|
| `/usr/local/bin/restic-backup.sh` | The backup script |
| `/etc/restic/backup.env` | Environment configuration for Restic |
| `/etc/systemd/system/restic-backup.service` | One-shot backup job |
| `/etc/systemd/system/restic-backup.timer` | Daily execution timer |

This ensures consistent, auditable, and policy-driven backups aligned with CMMC expectations.

---

## 🧪 What the Backup Does

The deployed script performs:

1. Daily backup of key service volumes (e.g., Nextcloud, PostgreSQL)
2. Deduplicated and encrypted backup to local or remote repo
3. Retention enforcement: `--keep-daily 7 --keep-weekly 4`
4. Log generation for review by assessors

---

## 📥 Offsite & Encrypted Backup Strategy

- Push backups offsite using `restic -r s3:s3.amazonaws.com/mybucket`
- Use strong encryption and separate key storage
- Store external backups in multiple regions (optional)
- Rotate and test encryption keys periodically

---

## 🧾 Restore and Audit Strategy

Test restores monthly with:

restic restore latest --target /tmp/restore-test diff -r /tmp/restore-test/nextcloud_data /var/lib/docker/volumes/nextcloud_data


Artifacts to maintain:

- Ansible backup role log or `ansible-playbook` run output
- Timer logs (`journalctl -u restic-backup.timer`)
- Screenshots or logs from restore tests
- An inventory of protected data and volumes

---

## 🛡️ CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| CP.2.120 | Establish backup strategy |
| CP.3.143 | Protect backups from unauthorized modification |
| SI.1.210 | Monitor for data integrity loss |
| SI.2.216 | Ensure data is recoverable following incident |

---

## ✅ Next Step

With resilient backups in place and automation enforced via Ansible and systemd, the next section walks through writing and mapping **policies and procedures** to support your technical controls.
