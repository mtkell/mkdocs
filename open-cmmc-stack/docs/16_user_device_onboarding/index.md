# 👤 Section 16: Initial User & Device Onboarding

## 🎯 Objective

This section defines the **secure provisioning process** for new users and their devices into the OpenCMMC Stack environment. It ensures each identity and device is verified, minimally privileged, and monitored in accordance with **Zero Trust Architecture (ZTA)** principles and CMMC Level 2 requirements across **Access Control (AC)** and **Identification and Authentication (IA)** domains.

---

## 🧍 User Identity Onboarding

### 1. Identity Creation (Keycloak)

| Step | Description |
|------|-------------|
| 1.1 | Admin creates user in Keycloak with email, display name, and default group |
| 1.2 | MFA is enforced during initial login using TOTP or YubiKey |
| 1.3 | Assign user to appropriate roles: `Access_CUI`, `Access_Admin`, etc. |
| 1.4 | Email welcome message with usage policies and login instructions |

### 2. Role Mapping

| Role | CUI Access | Admin Rights |
|------|------------|--------------|
| `Access_CUI` | ✅ | ❌ |
| `Access_Admin` | ✅ | ✅ |
| `Access_Viewer` | ❌ | ❌ |

---

## 💻 Device Registration Workflow

### Supported Platforms

- ✅ Windows 10/11
- ✅ macOS 12+
- ✅ Ubuntu 22.04+
- ✅ Android (Tailscale, WebDAV, Secure Mail)
- ✅ iOS (Tailscale, WebDAV, Secure Mail)

### 1. Network Registration via Tailscale

| Step | Description |
|------|-------------|
| 1.1 | Device joins Tailnet using SSO-verified user identity |
| 1.2 | Admin approves the device in Tailscale dashboard |
| 1.3 | Device label is updated with hostname and user ID |
| 1.4 | Key rotation is scheduled every 30 days (or MDM policy) |

### 2. Device Hardening Expectations

- Encrypted disk (BitLocker/FileVault/LUKS)
- Enabled firewall
- Automatic updates enabled
- Anti-malware (Defender, ClamAV, etc.)
- Audit logging forwarded to Wazuh (where possible)

---

## 🔐 SSO Configuration for New Devices

Each supported platform should use the **Keycloak SSO endpoint** (OIDC or SAML) for:

- Nextcloud access (WebDAV and GUI)
- Mailcow webmail and IMAP clients
- Admin tools (Keycloak, Wazuh Web UI)
- Entra ID bridging or FreeIPA federation if applicable

---

## 🧪 Validation Checklist

| Check | How to Verify | Evidence |
|-------|---------------|----------|
| MFA enabled | Keycloak user settings | Screenshot |
| Device appears in Tailnet | Tailscale Admin Panel | Audit log |
| Keycloak login succeeds | Browser test or CLI tool | Screenshot |
| Backup groups assigned | Keycloak group list | Group dump |
| System meets baseline config | MDM/Ansible facts | Output capture |

---

## 📜 CMMC Practices Addressed

| Practice | Description |
|----------|-------------|
| AC.1.001 | Limit access to authorized users |
| AC.2.007 | Employ least privilege |
| IA.2.078 | Enforce MFA |
| SC.1.175 | Protect CUI in transit |
| CM.2.067 | Monitor device configuration |

---

## ✅ Next Step

Once users and devices are securely onboarded, Section 17 outlines patching, vulnerability, and configuration management procedures.
