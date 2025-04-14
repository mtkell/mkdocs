# Phase 5: Client Device Registration

This phase enables end-user devices—Windows, macOS, Linux, iOS, and Android—to securely connect to your internal services using SSO, certificates, and Zero Trust overlay networking.

## 💻 Phase 5 – Client Registration and Access

<img src="../../img/svg/phase05-clients.svg" alt="Client onboarding flow showing certificate import, Tailscale login, and secure service access" style="width:100%; max-width:800px; margin:1em 0;">


---

## 💻 Supported Platforms

| OS       | Access Method        | Services Used             |
|----------|----------------------|---------------------------|
| Windows  | Tailscale + Browser  | Nextcloud, Webmail, SSO   |
| macOS    | Tailscale + Mail.app | S/MIME, Webmail, Files    |
| Linux    | Tailscale + Thunderbird | SSH, S/MIME, Web        |
| Android  | Tailscale + K9 Mail  | S/MIME + Nextcloud App    |
| iOS      | Tailscale + Safari   | Apple Mail + Web Access   |

---

## 🔐 General Steps

### 1. Import Identity Certificate

- Issue `.p12` or `.pem` via Step-CA or secure portal
- Windows: Import into Personal Certificate Store
- macOS/iOS: Use Apple Configurator profile
- Linux: Import into Thunderbird or GPG-based tool
- Android: Import via settings or K-9 Mail

---

### 2. Join Tailscale

- Install Tailscale client
- Login using SSO from Keycloak (OIDC)
- Verify tailnet ACLs enforce proper segmentation
- Label devices and assign tags in admin panel

---

### 3. Configure Email

- Set up Mailcow with SOGo or external clients
- Use STARTTLS/SMTPS on 465 or 587 with S/MIME signing

---

### 4. Access Nextcloud or Internal Services

- Use browser login (SSO-enabled)
- Or native apps configured with device cert auth

---

## 🔒 Device Policy Best Practices

- Use system disk encryption (BitLocker, FileVault)
- Require password + hardware MFA (YubiKey/WebAuthn)
- Disable root access where not needed
- Automatically expire old device certificates
- Monitor device behavior via Wazuh

---

## ✅ Output of This Phase

- Client devices trusted via cert, auth, and overlay
- Secure mail, file sync, and SSO login validated
- End-to-end encrypted access for remote and on-site users

→ Proceed to [Phase 6: Logging, SIEM, and Alerting](07_logging_monitoring.md)
