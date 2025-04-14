# 🔐 Section 5: Identity & Access Management

## 🎯 Objective

This section explains how to implement **centralized identity and access management (IAM)** using two open-source tools:

- **Keycloak** for identity provider (IdP), SSO, MFA, and RBAC
- **Tailscale** for Zero Trust, device-aware access to internal services

This aligns with CMMC Level 2 controls for **Access Control (AC)** and **Identification & Authentication (IA)**.

---

## 🧩 Why Keycloak?

**Keycloak** is an enterprise-grade open-source IAM platform. It supports:

- SSO via OIDC and SAML 2.0
- Multi-factor authentication
- Role-based access control
- LDAP and AD federation
- Fine-grained session policies

It integrates with applications like Nextcloud, Mailcow, Gitea, and more.

---

## 🧪 Keycloak Deployment

Use a secure container runtime like Podman:

```bash
podman run -d --name keycloak \
  -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=supersecurepw \
  quay.io/keycloak/keycloak:24.0.2 \
  start-dev
```

> ✅ Change this to systemd-managed service in production.

---

### 🔐 Keycloak Configuration Steps

1. Log in to `http://yourhost:8080`
2. Create a realm (e.g., `OpenCMMC`)
3. Create users and roles
4. Enable MFA under Authentication > Flows
5. Register clients (Nextcloud, Mailcow, etc.)
6. Configure client protocols (OIDC preferred)
7. Use `confidential` access type for server-to-server auth

---

## 🧩 Why Tailscale?

**Tailscale** is a Zero Trust mesh VPN built on WireGuard. It provides:

- Device identity and encryption
- Automatic NAT traversal
- ACL policies enforced by user identity
- Built-in auditing and access logs

---

## ⚙️ Tailscale Deployment (Server)

Install and authenticate:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey tskey-abc123
```

Use ephemeral or tag-based auth keys to automate provisioning in Terraform or Ansible.

---

## 🔒 Best Practice: Protecting Admin Interfaces

Use Tailscale ACLs to expose sensitive ports (e.g., Keycloak admin, Mailcow admin) **only to specific users or device tags**.

Example ACL:

```json
{
  "ACLs": [
    {
      "Action": "accept",
      "Users": ["admin@yourdomain.com"],
      "Ports": ["host1:8080", "host1:443"]
    }
  ]
}
```

---

## 🛡️ CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| AC.1.001 | Control access to systems and data |
| AC.2.007 | Use multifactor authentication for privileged users |
| IA.1.076 | Identify and authenticate organizational users |
| AC.3.021 | Enforce role-based access controls |
| AC.3.022 | Enforce network segregation and Zero Trust boundaries |

---

## ✅ Next Step

With centralized identity in place, the next phase is deploying user-facing collaboration services like **Nextcloud for file storage** and **Mailcow for secure email**.

---
