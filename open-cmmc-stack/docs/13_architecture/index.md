# Section 13: Infrastructure Architecture & System Interconnection

> 📚 This section visually complements [Section 2: Reference Architecture](../02_reference_architecture/index.md), where each component’s function and compliance relevance is explained in detail.

This section provides a comprehensive view of the Zero Trust-aligned FOSS architecture for small-to-medium defense contractors targeting CMMC Level 2 readiness. It includes a layered topology, component roles, and system interactions.

---

## 🗺️ System Topology Overview

The architecture below highlights how clients, core services, and perimeter components interact within a segmented and policy-enforced environment.

---

## 🖧 Network-Level System Topology (Mermaid)

```mermaid
graph LR
  subgraph Internet
    User[User (Browser, Client)]
  end

  subgraph "DMZ (Zero Trust Proxy Layer)"
    NGINX[NGINX Proxy Manager\n(TLS Termination)]
  end

  subgraph "Internal Secure Docker Network"
    Keycloak[Keycloak\n(SSO, MFA, RBAC)]
    NC[Nextcloud AIO\n(Files, AV, OnlyOffice, Talk)]
    Mailcow[Mailcow\n(SMTP, IMAP, Webmail)]
    DB[Internal Services\n(PostgreSQL, Redis)]
  end

  subgraph Optional["Optional External Identity Provider"]
    Entra[Microsoft Entra ID\n(SAML Federation)]
  end

  User --> NGINX
  NGINX --> Keycloak
  NGINX --> NC
  NGINX --> Mailcow

  Keycloak --> Entra
  NC --> DB
  Mailcow --> DB
```

---

## 🖧 OpenCMMC Network Topology (SVG)

<img src="../img/svg/network-topology.svg" alt="Zero Trust architecture diagram" style="width:100%; max-width:1000px;">

---

## 🧩 Component Interactions

### Identity & Access Control
- All users authenticate via **Keycloak** with **YubiKey**, **WebAuthn**, or **Microsoft Entra SAML Federation**
- Authorization is scoped per application via Keycloak roles and group policies
- MFA is enforced for Mailcow, Nextcloud AIO, and Admin interfaces

### Certificate Authority
- **Smallstep CA** issues:
  - S/MIME certificates for secure email
  - Device certificates for Tailscale ACLs and VPN gateway access
  - SSH certificates for privileged access with expiration

### File Services (Nextcloud AIO)
- AIO consolidates: file sharing, AV scanning, OnlyOffice, Talk, Redis, and PostgreSQL
- Deployed as a single secure container behind NGINX Proxy Manager
- Integrated with Keycloak via SAML for secure group-based access control
- Health-monitored with Uptime Kuma (`/status.php`)

### Network Enforcement
- DNS traffic is logged, filtered, and encrypted (DoT via Unbound)
- DHCP assigns IPs with MAC binding and leases tracked
- Tailscale creates an identity-aware overlay network with device segmentation

---

## 🔐 Network Zones

| Zone           | Description |
|----------------|-------------|
| **Perimeter**  | Gateway and reverse proxies; interfaces with NGINX Proxy Manager |
| **Secure LAN** | Internal services with TLS + RBAC; includes Keycloak, Nextcloud AIO, Mailcow |
| **Client Zone**| Authenticated workstations and devices with identity-bound certs |

---

## 📡 Example Firewall Rules

| Source        | Destination           | Protocols       | Description           |
|---------------|------------------------|------------------|-----------------------|
| Clients       | DNS Server             | TCP/UDP 53       | Internal DNS          |
| Clients       | Mailcow (SMTP/IMAP/HTTPS) | TCP 465, 993, 443 | Secure email access   |
| Clients       | Keycloak / SSO         | TCP 443          | SSO & MFA login       |
| Clients       | Tailscale Gateway      | UDP 41641        | Overlay access        |
| Clients       | Nextcloud AIO          | TCP 443 via Proxy| Secure file services  |

---

## 🧪 Monitoring and Audit

- **Wazuh** agents monitor system logs, auth attempts, and file integrity
- Health checks for AIO and Mailcow integrated with **Uptime Kuma**
- Alerting integrated with email and secure dashboard
- Auditd logs enriched by Filebeat and forwarded to Wazuh indexer

---

## 📝 Summary

This reference architecture provides:

- Strong access control via SSO, MFA, and per-device policies
- End-to-end encryption through S/MIME and TLS-based services
- Identity-bound networking through device-issued certificates
- Full observability with integrated logging and alerting
- Simplified, auditable CUI collaboration using Nextcloud AIO

> This design aligns with core CMMC Level 2 controls including AC.1.001, AC.3.014, IA.3.083, and SC.12.3–12.5.

---
