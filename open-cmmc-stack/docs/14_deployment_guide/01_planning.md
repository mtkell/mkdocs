# Phase 0: Planning & Scoping

Before deploying any infrastructure, it is essential to define the mission, scope, and compliance goals that your system must meet. This includes identifying data types (FCI, CUI), user roles, system boundaries, and operational constraints.

---

## 🎯 Objectives

- Define compliance scope (FCI/CUI, enclave size)
- Create logical zones and data flows
- Identify required services and endpoints
- Begin drafting System Security Plan (SSP)

---

## 🔍 Identify Scope of CMMC Applicability

Ask:

- What systems or processes handle CUI or FCI?
- Which users require remote access?
- Are mobile or BYOD devices allowed?

Use this input to build your system boundary.

---

## 🧩 Map Trust Zones and Interfaces

Define basic segmentation such as:

- `DMZ`: External access points (e.g., reverse proxy)
- `LAN`: Internal services (Keycloak, Mailcow, CA)
- `Mgmt`: Administrative interfaces (Wazuh, Step-CA)
- `VPN/Overlay`: Tailscale Zero Trust mesh
- `Clients`: End-user systems

---

## 📥 Define Required Services

| Service | Function |
|--------|----------|
| Keycloak | SSO, MFA, access control |
| Mailcow | Email w/ S/MIME |
| Step-CA | Internal certificate issuance |
| Tailscale | Device-aware VPN/overlay |
| Nextcloud | Secure file sharing |
| Wazuh | Centralized monitoring & alerting |

---

## 📋 SSP Preparation Tasks

Start drafting:

- System description and trust zones
- Roles and responsibilities
- Component inventory
- Control implementation intentions (CUI isolation, audit trails)

---

## ✅ Output of This Phase

- Scoping document
- Preliminary SSP outline
- Diagram of zones and required services
- Decision log for internal vs. cloud hosting

→ Proceed to [Phase 1: Terraform Provisioning](02_terraform_provisioning.md)
