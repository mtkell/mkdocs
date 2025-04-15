# Phase 3A: File Collaboration Services – Nextcloud AIO Deployment

In this phase, we deploy **Nextcloud All-in-One (AIO)** to enable secure file sharing, document collaboration, calendar access, and group-based data controls.

Nextcloud AIO consolidates all supporting services (PostgreSQL, Redis, ClamAV, OnlyOffice, Talk) into a single hardened container, reducing complexity and improving security posture.

---

## 📦 AIO Deployment Overview

Nextcloud AIO is deployed via Docker and should only be accessible behind a secure reverse proxy like **NGINX Proxy Manager** or **Traefik**.

### ✅ Key Features Included:

- Full-text search and OnlyOffice document editing
- File-level audit logging
- SAML SSO integration via Keycloak
- Team Folder access control
- Built-in virus scanning with ClamAV
- Scheduled backup tools
- Status endpoint for uptime monitoring

---

## 🛠 Prerequisites

- Reverse proxy is operational (NGINX Proxy Manager recommended)
- External domain with SSL termination set up
- Docker is installed on the host
- Backup volume storage mounted at `/mnt/ncdata`

---

## 🧱 Deployment Steps

1. Create Docker volumes (if not using named mounts):

```bash
docker volume create nextcloud_aio_mastercontainer
docker volume create ncdata
```

2. Launch the AIO master container:

```bash
docker run -d \
  --name nextcloud-aio-mastercontainer \
  --restart always \
  -p 8080:8080 \
  -v nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
  -e NEXTCLOUD_DATADIR="/mnt/ncdata" \
  nextcloud/all-in-one:latest
```

3. Access the admin portal at:  
   `http://yourhost:8080` and follow the web-based installer

4. Configure NGINX Proxy Manager:
   - Forward `nextcloud.yourdomain.com` → `localhost:8080`
   - Enable HTTPS with Let's Encrypt
   - Enforce HTTP/2, HSTS, and force SSL

---

## 🔐 Keycloak SAML Integration

Once AIO is running:

1. Enable **SSO & SAML authentication** app in Nextcloud
2. Configure:
   - UID mapping: `user.userprincipalname`
   - Display name: `user.displayname`
   - Email: `user.mail`
   - Groups: `groups`
3. In Keycloak:
   - Register a SAML client with metadata from:
     `https://nextcloud.yourdomain.com/apps/user_saml/saml/metadata`
   - Map required attributes

This setup ensures login is identity-bound and supports group-based file access.

---

## 🔒 Team Folder Setup for CUI/FCI

1. In Nextcloud Admin Panel:
   - Enable **Team folders** (formerly Group folders)
2. Create folders:
   - `/Access_CUI`
   - `/Access_FCI`
   - `/Access_Proprietary`
3. Assign groups from SAML mapping (e.g., Keycloak groups)

You can enforce restrictions via the **File Access Control app**.

---

## 🔁 Health Monitoring

Expose a status endpoint for Uptime Kuma or Prometheus-style checks:

- URL: `https://nextcloud.yourdomain.com/status.php`
- Expected result: HTTP 200

Configure alerting if the instance is unreachable for >5 minutes.

---

## 🔐 Backup Recommendations

Recommended: `restic`, `borgbackup`, or built-in Nextcloud backup app.

Backup:
- `/mnt/ncdata`
- `nextcloud_aio_mastercontainer` config volume

Store offsite or on offline media. Validate monthly.

---

## ✅ Output of This Phase

- Fully operational Nextcloud AIO instance
- TLS-secured access with SAML authentication
- Logical group-based access to sensitive data
- ClamAV, audit logging, and backup services integrated

→ Proceed to [Phase 4: Identity & Certificate Management](./05_identity_cert_mgmt.md)
