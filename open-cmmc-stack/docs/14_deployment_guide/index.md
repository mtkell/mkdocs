# Section 14: Deployment Guide – OpenCMMC FOSS Infrastructure

This deployment guide provides a step-by-step, modular walkthrough for provisioning and configuring a fully CMMC Level 2–aligned FOSS infrastructure stack for small to medium defense contractors.

**Technologies Used:**

- 🔧 Terraform for infrastructure provisioning
- 🛡️ Ansible for operating system hardening and service configuration
- 📦 Podman for secure, rootless container deployment
- 🔐 Keycloak, Smallstep CA, Tailscale, Mailcow, Nextcloud, Wazuh

The end result is a fully operational, Zero Trust–compliant environment accessible securely by:

- ✅ Windows, macOS, Linux endpoints
- ✅ Android and iOS mobile devices
- ✅ Remote and on-prem users

---

## 📘 Deployment Phases

Each phase maps directly to key CMMC practices across Access Control (AC), Configuration Management (CM), System Integrity (SI), and Audit & Accountability (AU).

| Phase | Focus |
|-------|-------|
| [Phase 0](01_planning.md) | Planning and scoping CMMC-aligned infrastructure |
| [Phase 1](02_terraform_provisioning.md) | Provisioning secure hosts using Terraform |
| [Phase 2](03_ansible_hardening.md) | Operating system hardening using Ansible |
| [Phase 3](04_podman_services.md) | Secure application services deployed with Podman |
| [Phase 4](05_identity_cert_mgmt.md) | Identity, certificate issuance, and access control |
| [Phase 5](06_client_registration.md) | Secure client onboarding (Windows, macOS, iOS, Android) |
| [Phase 6](07_logging_monitoring.md) | Logging, alerting, and security monitoring |
| [Phase 7](08_validation_reporting.md) | Compliance testing, reporting, and evidence capture |

---

Let’s begin with Phase 0.
