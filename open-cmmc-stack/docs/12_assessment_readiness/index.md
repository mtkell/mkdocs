# 📄 Section 12: SSP & Artifact Mapping

## 🎯 Objective

This final section guides you in creating your **System Security Plan (SSP)** and mapping real-world technical and administrative controls to the CMMC Level 2 practice requirements. The SSP is the cornerstone artifact for any CMMC assessment.

---

## 📘 What is an SSP?

A **System Security Plan** is a formal document that:

- Describes the system or environment being assessed
- Identifies all components that handle CUI
- Maps controls to implementation details
- Assigns roles and responsibilities
- Documents supporting policies and procedures

---

## 🧰 Required SSP Components

| Section                      | Description                                      |
|-----------------------------|--------------------------------------------------|
| System Identification       | System name, boundaries, and scope              |
| Environment Description     | Diagrams, services, and interconnections        |
| System Components           | OS, containers, apps, and cloud resources       |
| CUI Data Flow               | Inbound/outbound data paths and classification  |
| Control Implementation      | Practice-by-practice response and mapping       |
| Roles and Responsibilities | Who owns what in the security lifecycle         |
| References & Artifacts      | Linked policies, diagrams, configs, logs        |

---

## 📋 SSP Control Mapping Format

For each of the 110 CMMC practices, create a record with:

```
## Practice ID: AC.1.001

**Control Title**: Limit system access to authorized users

**Implementation**:
Access to the Podman-hosted services (Nextcloud, Mailcow) is managed by Keycloak SSO with RBAC. Authentication is federated via Tailscale identity and Keycloak MFA. User accounts are provisioned via documented IT onboarding procedures.

**Responsible Role**: IT Administrator

**Supporting Artifacts**:
- Access Control Policy
- Keycloak Configuration Export
- Tailscale ACL Rules
- User Onboarding SOP
```

Repeat for all 110 practices.

---

## 📎 Artifact Checklist

You should generate and store the following:

- Signed policies and SOPs
- Screenshots and logs of control evidence
- Terraform and Ansible playbooks
- Backup logs and restore tests
- Sample auditd and Wazuh alerts
- System architecture diagrams
- Evidence of MFA, least privilege, and encryption

---

## 🗂️ SSP Template Starter

You can create your SSP in:

- Markdown with Git versioning
- Word/Excel using [ProjectSpectrum.io template](https://www.projectspectrum.io/#/document-library)
- PDF for upload to eMASS or OSC repository

---

## 🛡️ CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| CA.2.157 | Develop and manage an SSP |
| CA.3.161 | Update SSP to reflect changes |
| CA.3.162 | Map CUI flow and security boundaries |
| RA.2.137 | Maintain accurate system inventory |
| AU.2.042 | Provide traceable records and evidence |

---

## ✅ Congratulations!

You’ve now completed the OpenCMMC Stack guide. You are prepared to generate audit-ready documentation, demonstrate technical alignment, and work toward **CMMC Level 2 certification** using only secure, auditable, open-source tools.

---
