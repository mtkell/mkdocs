# Phase 7: Validation and Reporting

This final phase focuses on verifying the operational security of the deployed stack and generating the documentation, artifacts, and audit trails necessary to support a CMMC Level 2 readiness posture.

## 📋 Phase 7 – Validation and Reporting

<img src="../../img/svg/phase07-validation.svg" alt="Diagram summarizing final validation tasks: artifact collection, SSP updates, and reporting" style="width:100%; max-width:800px; margin:1em 0;">


---

## ✅ What to Validate

| Area                | What to Check                          | Tools Used             |
|---------------------|----------------------------------------|------------------------|
| Authentication      | MFA enforced, no password-only access  | Keycloak logs          |
| Certificate Issuance| User/device certs issued and valid     | Step-CA logs, openssl  |
| Network Controls     | Tailscale overlay ACLs applied         | Tailscale Admin Panel  |
| Email Security      | S/MIME signed + DKIM/SPF passed        | Mailcow, external tools|
| File Integrity      | AIDE/Wazuh scans show no tampering     | Wazuh Dashboard        |
| System Logging      | All services forward logs              | Wazuh, auditd          |
| Firewall Rules      | Ingress/egress locked appropriately    | UFW, Podman ports      |

---

## 📂 Collectable Evidence

You’ll want to store and organize:

- Terraform state files (`terraform.tfstate`)
- Ansible logs or version-controlled playbooks
- Screenshots of admin panels showing:
  - MFA
  - Certs
  - ACLs
- Sample audit log exports (Keycloak, Mailcow, Wazuh)
- Evidence of patching (apt history, unattended-upgrades)
- Step-CA issuance records and cert chains

---

## 🧪 SSP Traceability

Update your **System Security Plan (SSP)** with:

| Section                | Source Artifacts                    |
|------------------------|-------------------------------------|
| System Description     | Terraform plan, network diagram     |
| Access Controls        | Keycloak config, user group mappings|
| Identification & Authn| Step-CA cert configs, login policies|
| System Integrity       | AIDE config, Wazuh scans            |
| Media Protection       | Nextcloud policy + file share setup|
| Configuration Mgmt     | Ansible repo                        |
| Audit & Accountability | Wazuh reports, auditd logs          |

---

## 📤 Optional Reporting Deliverables

- Daily/weekly PDF audit reports (via Wazuh)
- Manual control assessment checklist (110 controls)
- Executive summary for non-technical stakeholders

---

## 🧾 Final Checklist

- [x] System deployed using Terraform/Ansible/Podman
- [x] All users access services via MFA/SSO
- [x] Logs monitored and reviewed in Wazuh
- [x] Certs issued from internal CA for users and devices
- [x] Client access from Windows/macOS/Linux/iOS/Android verified
- [x] SSP updated with deployed configuration

---

## 🎉 Congratulations

You now have a fully operational, CMMC-aligned FOSS infrastructure stack suitable for small to medium DoD contractors. This system emphasizes Zero Trust, certificate-based identity, and full observability across all endpoints and services.

---
