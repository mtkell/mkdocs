# 🧭 Section 19: CUI/FCI Data Flow & Trust Boundary Mapping

## 🎯 Objective

This section defines how **Controlled Unclassified Information (CUI)** and **Federal Contract Information (FCI)** traverse the OpenCMMC Stack, and how trust boundaries are enforced to protect sensitive data in transit, at rest, and in use. This supports scoping and documentation for CMMC Level 2 assessment readiness.

---

## 🧊 Trust Zones Overview

| Zone | Description | Examples |
|------|-------------|----------|
| Trusted User Devices | Authenticated devices with endpoint controls | Company laptops, mobile devices |
| Trusted Infrastructure | Hardened, monitored servers with audit and backup | Ubuntu LTS, Podman-hosted services |
| DMZ/Public Access | Services exposed via reverse proxy with access control | NGINX Proxy Manager |
| Identity & Access Control | SSO, MFA, and user provisioning services | Keycloak, Tailscale |
| Monitoring & Forensics | Central log and response tools | Wazuh, Auditd, Restic |

---

## 🔁 Data Flow Examples

### CUI File Upload via Nextcloud

1. Authenticated user connects via Tailscale
2. Keycloak enforces MFA and SAML SSO
3. User uploads CUI file into Nextcloud AIO
4. File is stored encrypted-at-rest on host volume
5. Access is controlled via group-based permissions
6. Audit events logged to Wazuh

### Secure Email Transmission (Mailcow)

1. Authenticated user logs into Mailcow webmail or IMAP
2. Outbound message is TLS-encrypted and DKIM-signed
3. Headers identify sender, recipient, and sensitivity
4. Delivery logs and access logs stored centrally

---

## 🧱 Boundary Controls

| Control Type | Enforcement Mechanism |
|--------------|------------------------|
| Network Trust | Tailscale identity-based tunnels |
| Identity Assurance | Keycloak + MFA |
| Access Policy | RBAC via Keycloak + App config |
| Audit Logging | Auditd, Wazuh, Journalctl |
| Configuration Drift | Ansible enforcement and scans |

---

## 🖼️ Architecture Diagram

![Zero Trust Data Flow and Trust Boundaries – OpenCMMC Stack](../../img/svg/network-dataflow-boundaries.svg "Zero Trust Data Flow and Trust Boundaries – OpenCMMC Stack")

> This diagram visualizes how Controlled Unclassified Information (CUI) and Federal Contract Information (FCI) flow securely through trust zones in the OpenCMMC Stack. Each containerized service is scoped, monitored, and hardened to enforce CMMC Level 2 compliance.

---

## 📜 CMMC Practices Addressed

| Practice | Description |
|----------|-------------|
| CA.2.157 | Define and enforce system boundaries |
| SC.1.175 | Protect CUI in transit |
| SC.2.178 | Limit information flow |
| AC.2.006 | Control system access to CUI |
| AU.2.042 | Record and review user actions |

---

## ✅ Next Step

With trust boundaries defined, Section 20 will summarize performance, scaling, and cost estimation for different org sizes.
