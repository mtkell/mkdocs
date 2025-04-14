# Section 13: Infrastructure Architecture & System Interconnection

> 📚 This section visually complements [Section 2: Reference Architecture](../02_reference_architecture/index.md), where each component’s function and compliance relevance is explained in detail.

This section provides a comprehensive view of the Zero Trust-aligned FOSS architecture for small-to-medium defense contractors targeting CMMC Level 2 readiness. It includes a layered topology, component roles, and system interactions.

## 🗺️ System Topology Overview

The architecture below highlights how clients, core services, and perimeter components interact within a segmented and policy-enforced environment.


## 🖧 Network-Level System Topology (Mermaid)

## 🖧 OpenCMMC Network Topology

<img src="../img/svg/network-topology.svg" alt="Zero Trust architecture diagram" style="width:100%; max-width:1000px;">


---

## 🧩 Component Interactions

### Identity & Access Control
- All users authenticate via **Keycloak** with **YubiKey** or **WebAuthn**
- Authorization is scoped per application via Keycloak roles and group policies
- MFA is enforced for SOGo, Nextcloud, and Admin interfaces

### Certificate Authority
- **Smallstep CA** issues:
  - S/MIME certificates for secure email
  - Device certificates for Tailscale ACLs and VPN gateway access
  - SSH certificates for privileged access with expiration

### Network Enforcement
- DNS traffic is logged, filtered, and encrypted (DoT via Unbound)
- DHCP assigns IPs with MAC binding and leases tracked
- Tailscale creates an identity-aware overlay network with device segmentation

---

## 🔐 Network Zones

| Zone          | Description |
|---------------|-------------|
| **Perimeter** | Gateway and reverse proxies; interfaces with NGINX Proxy Manager |
| **Secure LAN**| Internal services with TLS + RBAC |
| **Client Zone**| Authenticated workstations and devices with identity-bound certs |

---

## 📡 Example Firewall Rules

| Source        | Destination     | Protocols | Description |
|---------------|------------------|----------|-------------|
| Clients       | DNS Server        | TCP/UDP 53 | Internal DNS |
| Clients       | Mailcow (SMTP/IMAP/HTTPS) | TCP 465, 993, 443 | Secure email access |
| Clients       | Keycloak / SSO    | TCP 443 | SSO & MFA login |
| Clients       | Tailscale Gateway | UDP 41641 | Overlay access |

---

## 🧪 Monitoring and Audit

- **Wazuh** agents monitor system logs, auth attempts, and file integrity
- Alerting integrated with email and secure dashboard

---

## 📝 Summary

This reference architecture provides:
- Strong access control via SSO, MFA, and per-device policies
- End-to-end encryption through S/MIME and TLS-based services
- Identity-bound networking through device-issued certificates
- Full observability with integrated logging and alerting

> This design aligns with core CMMC Level 2 controls including AC.1.001, AC.3.014, IA.3.083, and SC.12.3–12.5.
