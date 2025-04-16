# 📁 Section 6: Secure File Sharing and Collaboration

## 🎯 Objective

This section details how to securely deploy **Nextcloud All-in-One (AIO)** — an integrated file sharing and collaboration platform that satisfies CMMC Level 2 requirements for **Media Protection (MP)**, **Access Control (AC)**, and **System Communications Protection (SC)**.

Nextcloud AIO consolidates secure storage, team collaboration, antivirus scanning, and file retention — enabling your organization to manage CUI without reliance on commercial SaaS platforms.

---

## 🧩 Why Nextcloud AIO?

**Nextcloud AIO** offers:

- One hardened container with all critical components:
  - Files, Calendar, Contacts, Mail, Talk, and OnlyOffice
  - PostgreSQL, Redis, and ClamAV preconfigured
- Web-based file access with granular permissioning
- Built-in audit logging and file activity tracking
- SSO support via Keycloak (SAML)
- Server-side and optional client-side encryption
- Secure sharing and team folder access control

---

## 📦 Deployment via Docker

Run this container behind a reverse proxy (e.g., NGINX Proxy Manager):

```bash
docker run -d \\
  --name nextcloud-aio-mastercontainer \\
  --restart always \\
  -p 8080:8080 \\
  -v nextcloud_aio_mastercontainer:/mnt/docker-aio-config \\
  -e NEXTCLOUD_DATADIR="/mnt/ncdata" \\
  nextcloud/all-in-one:latest
```

- Expose to internet **only through reverse proxy with TLS termination**
- All services run inside AIO: no external database or cache required

---

## 🧰 Hardened Stack (Built-In)

| Component        | Purpose                                |
|------------------|----------------------------------------|
| Nextcloud Core   | File & data collaboration              |
| OnlyOffice       | Integrated document editing            |
| ClamAV           | Antivirus scanning for file uploads    |
| PostgreSQL       | Backend database (within container)    |
| Redis            | Performance cache                      |
| Keycloak         | External SSO federation via SAML       |

All services are isolated within the container and monitored via health checks.

---

## 🔒 Access Controls (SSO via Keycloak)

Configure SSO for Nextcloud AIO:

1. In Nextcloud AIO:
   - Install **SSO & SAML authentication** app
   - Set UID attribute: `user.userprincipalname`
   - Set display name, email, group mapping (via SAML)
2. In Keycloak:
   - Create a SAML client
   - Import metadata from:
     `https://nextcloud.yourdomain.com/apps/user_saml/saml/metadata`
   - Map email, displayname, and groups

This enables secure login via Microsoft Entra ID, Keycloak users, or FreeIPA LDAP federation.

---

## 🔐 Folder Permissions & CUI Access Groups

Use **Team Folders** to control CUI access:

- Create groups: `Access_CUI`, `Access_FCI`, `Access_Proprietary`
- Restrict download, upload, and sharing rights per group
- Assign group-based access via Keycloak SAML attribute mapping

Use File Access Control rules to:
- Block sharing of CUI outside organization
- Require group membership for sensitive content

---

## 📜 CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| AC.1.001 | Restrict access to authorized users |
| MP.1.118 | Protect media containing CUI |
| MP.2.119 | Limit access to CUI on external systems |
| SC.1.175 | Use encryption to protect CUI in transit |
| AU.2.042 | Enable audit logs and access records |

---

## 🔁 Monitoring & Backup Strategy

### 🔍 Monitoring with Wazuh

Nextcloud AIO logs key file operations, user activity, and access patterns. These logs can be forwarded to **Wazuh** for centralized collection, alerting, and long-term audit readiness.

Steps:
- Enable syslog forwarding in the host OS
- Configure log collection from:
  - `/mnt/ncdata/nextcloud.log`
  - Container journal logs (`journalctl -u podman`)
- Parse and alert on:
  - File uploads of CUI
  - Failed login attempts
  - External sharing violations

### 🔐 Backup Considerations

While Nextcloud AIO offers internal snapshot features, organizations should schedule full volume-level encrypted backups of:

- `/mnt/ncdata` (user data and app config)
- `aio-mastercontainer` volume (Nextcloud AIO config)

Suggested tools:
- **Restic** or **BorgBackup** for encrypted incremental backups
- Automate off-host storage (e.g., SFTP, S3, USB)
- Monthly restore testing for assurance

Backup plans must align with:

- MP.2.119 — CUI access limitation
- SC.12.3 — Cryptographic protections at rest
- IR.2.093 — Incident response and data recovery


---

## ✅ Next Step

With secure file collaboration via Nextcloud AIO in place, proceed to Section 7 to configure **Mailcow** for secure email services.

---
