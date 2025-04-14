# 📁 Section 6: Secure File Sharing and Collaboration

## 🎯 Objective

This section details how to securely deploy **Nextcloud**, an open-source file sharing and collaboration platform that satisfies CMMC Level 2 requirements for **Media Protection (MP)**, **Access Control (AC)**, and **System Communications Protection (SC)**.

It enables your organization to securely store, access, and collaborate on Controlled Unclassified Information (CUI) without relying on commercial SaaS platforms.

---

## 🧩 Why Nextcloud?

**Nextcloud** offers:

- Web-based file access and sharing with granular permissions
- Full audit logs and file activity tracking
- Integration with SSO (via Keycloak)
- End-to-end encryption (E2EE) and client-side encryption
- Collaboration apps (Office, calendar, contacts)

---

## 📦 Deployment with Podman

Basic command (non-production setup):

```bash
podman run -d --name nextcloud \
  -p 8081:80 \
  -v nextcloud_data:/var/www/html \
  docker.io/library/nextcloud:28-apache
```

In production, Nextcloud should use a reverse proxy (NGINX, Traefik), persistent PostgreSQL backend, Redis cache, and TLS.

---

## 🧰 Recommended Stack

| Component   | Purpose                    |
|------------|----------------------------|
| Nextcloud  | File & data collaboration  |
| PostgreSQL | Reliable backend DB        |
| Redis      | Improves performance       |
| NGINX      | TLS termination, reverse proxy |
| Keycloak   | Federated SSO via OIDC     |

All components should be deployed as rootless Podman containers and protected behind a firewall or private network overlay.

---

## 🔒 Access Controls

Configure Nextcloud to use Keycloak for authentication:

1. Install [OIDC Login app](https://apps.nextcloud.com/apps/oidc_login)
2. In Keycloak:
   - Add a client with `openid-connect` protocol
   - Set redirect URI: `https://nextcloud.yourdomain.com/index.php/apps/oidc_login/oidc`
3. In Nextcloud:
   - Enter Keycloak endpoints and client credentials
   - Enable auto-provisioning
4. Test login and group-based file access

---

## 🔐 Folder Permissions & CUI Tagging

Use **Nextcloud Groups** to control CUI access:

- Create groups: `fcigroup`, `cuigroup`, `executiveonly`
- Assign folder-level sharing permissions
- Restrict file/folder downloads and sharing

Enable logging and configure **file retention** for change auditing.

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

## 📝 Backup Considerations

Use tools like **Restic** or **BorgBackup** to:

- Schedule encrypted backups of Nextcloud volumes
- Store offsite or on offline storage
- Validate backups monthly for integrity

---

## ✅ Next Step

With secure file collaboration enabled, we now turn to deploying **secure email services with Mailcow** in Section 7.

---
