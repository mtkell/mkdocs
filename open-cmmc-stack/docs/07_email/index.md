# ✉️ Section 7: Secure Email

## 🎯 Objective

This section provides guidance for deploying and securing a self-hosted email stack using **Mailcow**, an open-source mail server suite. The goal is to support CMMC Level 2 controls in the **System and Communications Protection (SC)** and **Access Control (AC)** domains while maintaining full ownership of email communications.

---

## 🧩 Why Mailcow?

**Mailcow** is a full-featured email platform that includes:

- Postfix (SMTP), Dovecot (IMAP/POP3)
- SOGo webmail client
- Rspamd for spam filtering
- DKIM, SPF, DMARC support
- Integrated ACME (Let's Encrypt) TLS
- LDAP and OIDC authentication support

---

## 🚀 Mailcow Deployment (Podman Example)

Mailcow is normally deployed with Docker Compose, but you can adapt it for Podman.

Clone the official Mailcow repo:

```bash
git clone https://github.com/mailcow/mailcow-dockerized
cd mailcow-dockerized
cp mailcow.conf.example mailcow.conf
```

Edit `mailcow.conf` to define hostname, timezone, and SSL settings. Then run:

```bash
podman-compose pull
podman-compose up -d
```

For hardened systems, ensure containers use rootless Podman or are managed via `podman generate systemd`.

---

## 🔒 TLS, DKIM, and SPF Configuration

Ensure the following are configured:

- **TLS**: Certificates automatically issued by Let’s Encrypt
- **SPF**: Add a DNS TXT record pointing to your mail server IP
- **DKIM**: Enabled via Mailcow UI
- **DMARC**: Publish a DNS policy for your domain

Test configuration via:
- https://mail-tester.com
- https://dmarcian.com/

---

## 🔐 Integrating with Keycloak (OIDC)

To enable Single Sign-On:

1. Enable the OpenID plugin in Mailcow  
2. In Keycloak, create a new OIDC client  
3. Configure `client_id`, `client_secret`, redirect URI  
4. Assign mail users to a realm group and map roles  

Users can now authenticate with MFA and centralized SSO.

---

## 🛡️ Security Best Practices

- Block SMTP auth on port 25 (use 587 with STARTTLS)
- Require strong passwords or MFA for all mail users
- Use fail2ban or equivalent to protect login endpoints
- Monitor mail logs with Wazuh or RSyslog for abuse

---

## 📜 CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| AC.1.001 | Restrict mail server access to authorized users |
| AC.2.016 | Control use of external systems |
| SC.1.175 | Protect CUI in transit with TLS |
| SC.3.177 | Protect communication channels from unauthorized access |
| SI.1.210 | Detect and alert on abnormal email activity |

---

## ✅ Next Step

With secure email services in place, the next section focuses on **monitoring and audit logging** across your infrastructure using **Wazuh** and **Auditd**.

---
