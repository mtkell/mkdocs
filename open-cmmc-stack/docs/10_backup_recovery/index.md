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
| **Duplicity** | GPG-encrypted full/diff backups     |

For simplicity and reliability, we’ll use **Restic**.

---

## 🚀 Setting Up Restic

Install Restic:

```bash
sudo apt install restic
```

Initialize repository (local or remote):

```bash
export RESTIC_REPOSITORY=/srv/backups
export RESTIC_PASSWORD=mysecretpassword
restic init
```

Create a backup script (e.g., `backup.sh`):

```bash
#!/bin/bash
export RESTIC_REPOSITORY=/srv/backups
export RESTIC_PASSWORD=mysecretpassword

restic backup /var/lib/docker/volumes/nextcloud_data \
              /var/lib/docker/volumes/postgres_data

restic forget --keep-daily 7 --keep-weekly 4 --prune
```

Schedule with `cron` or `systemd`.

---

## 📥 Offsite & Encrypted Backup Strategy

- Push to cloud (S3, Backblaze, Wasabi) via `restic -r s3:s3.amazonaws.com/mybucket`
- Use **GPG encryption** for sensitive exports
- Store keys separately from backup media
- Rotate and test encryption passwords

---

## 🔁 Restore Testing

Perform regular restore drills:

```bash
restic restore latest --target /tmp/restore-test
diff -r /tmp/restore-test/nextcloud_data /var/lib/docker/volumes/nextcloud_data
```

Keep logs for assessor review.

---

## 🛡️ CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| CP.2.120 | Establish backup strategy |
| CP.3.143 | Protect backups from unauthorized modification |
| SI.1.210 | Monitor for data integrity loss |
| SI.2.216 | Ensure data is recoverable following incident |

---

## 🧾 Audit Artifacts to Generate

- Backup policy and schedule
- Backup and restore logs
- Screenshots or evidence of test restores
- Inventory of protected volumes and scope

---

## ✅ Next Step

With resilient backups in place, the next section walks through writing and mapping **policies and procedures** to support your technical controls.

---
