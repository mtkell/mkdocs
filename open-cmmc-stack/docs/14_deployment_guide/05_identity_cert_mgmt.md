# Phase 4: Identity, Certificates, and Access Control

In this phase, we configure centralized authentication and Zero Trust identity enforcement using **Keycloak** for SSO + MFA and **Smallstep CA** for certificates (TLS, SSH, and S/MIME).

## 🔐 Phase 4 – Identity and Certificate Management

<img src="../../img/svg/phase04-identity.svg" alt="Keycloak and Step-CA setup for MFA, RBAC, and issuing TLS/SSH certificates" style="width:100%; max-width:800px; margin:1em 0;">


---

## 🧩 Components

| Tool        | Role                                |
|-------------|-------------------------------------|
| Keycloak    | Identity Provider (SSO, MFA, RBAC)  |
| Smallstep CA| Internal Certificate Authority      |
| Tailscale   | Device-aware overlay VPN            |

---

## 🔐 Keycloak Setup

1. Create a realm (e.g., `cmmc`)
2. Define groups:
   - `admins`, `users`, `remote-only`, etc.
3. Enable MFA:
   - Under authentication flows, add WebAuthn or OTP
4. Create OIDC clients for:
   - Mailcow, Nextcloud, Wazuh Dashboard, Caddy

---

## 📜 Smallstep CA Setup

1. Initialize CA:

```bash
step ca init
```

2. Issue user certificate for S/MIME:

```bash
step ca certificate "Alice Example" alice@example.com alice.p12
```

3. Issue device certificate:

```bash
step ca certificate device1 device1.kell.local device1.crt device1.key
```

4. Configure Caddy, Mailcow, and SSH to use certs from CA

---

## 🕸 Tailscale Integration

- Devices join tailnet using identity login
- Define ACLs in `tailscale.com/admin/acls`
- Map access by Keycloak groups or device tags

---

## 🔒 Zero Trust Policies to Enforce

- No service trust without cert
- Admin access requires MFA + device cert
- Audit login attempts via Keycloak and Step-CA logs

---

## ✅ Output of This Phase

- Identity provider enforced for all apps
- Certs issued to users, devices, and internal services
- ACLs defined to isolate roles and data types

→ Proceed to [Phase 5: Client Device Registration](06_client_registration.md)
