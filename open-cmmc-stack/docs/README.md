# 🛡️ OpenCMMC Stack

**A Free and Open-Source Infrastructure Guide for CMMC Level 2 Compliance**

This project provides a complete, secure, and modular self-hosted architecture to help small and medium-sized DoD contractors meet the requirements of **CMMC Level 2** using open-source tools.

## 📚 Guide Overview

| Section | Title |
|---------|-------|
| 00 | [Preface](docs/00_preface/index.md) |
| 01 | [Introduction to CMMC v2](docs/01_cmmc_intro/index.md) |
| 02 | [Reference Architecture](docs/02_reference_architecture/index.md) |
| 03 | [Provisioning Infrastructure](docs/03_provisioning/index.md) |
| 04 | [Securing the Host OS](docs/04_os_hardening/index.md) |
| 05 | [Identity & Access Management](docs/05_identity_access/index.md) |
| 06 | [Secure File Sharing (Nextcloud)](docs/06_file_storage/index.md) |
| 07 | [Secure Email (Mailcow)](docs/07_email/index.md) |
| 08 | [Monitoring & Logging](docs/08_logging_monitoring/index.md) |
| 09 | [Application Hosting (Podman)](docs/09_container_runtime/index.md) |
| 10 | [Backup & Recovery](docs/10_backup_recovery/index.md) |
| 11 | [Policies & Procedures](docs/11_policies_procedures/index.md) |
| 12 | [Assessment & Readiness](docs/12_assessment_readiness/index.md) |
| 13 | [Architecture Summary & Trust Boundaries](docs/13_architecture/index.md) |
| 14 | [Deployment Guide](docs/14_deployment_guide/index.md) |
|    | [Phase 0: Planning](docs/14_deployment_guide/01_planning.md) |
|    | [Phase 1: Terraform Provisioning](docs/14_deployment_guide/02_terraform_provisioning.md) |
|    | [Phase 2: Ansible Hardening](docs/14_deployment_guide/03_ansible_hardening.md) |
|    | [Phase 3: Podman Services](docs/14_deployment_guide/04_podman_services.md) |
|    | [Phase 3A: Nextcloud All-In-One](docs/14_deployment_guide/phase04-files.md) |
|    | [Phase 4: Identity & Certificate Management](docs/14_deployment_guide/05_identity_cert_mgmt.md) |
|    | [Phase 5: Client Registration](docs/14_deployment_guide/06_client_registration.md) |
|    | [Phase 6: Logging & Monitoring](docs/14_deployment_guide/07_logging_monitoring.md) |
|    | [Phase 7: Validation & Reporting](docs/14_deployment_guide/08_validation_reporting.md) |
| 15 | [Security Operations Procedures (SecOps)](docs/15_secops_sops/index.md) |
| 16 | [Automation & CI/CD](docs/16_automation_cicd/index.md) |
| 17 | [Compliance Artifacts & Documentation](docs/17_compliance_artifacts/index.md) |
| 18 | [SSP Templates](docs/18_ssp_templates/index.md) |
| 19 | [Data Flow & Trust Boundaries](docs/19_data_flow_mapping/index.md) |
| 20 | [Performance, Scaling & Cost Estimation](docs/20_scaling_cost/index.md) |
| —  | [Appendix A: Acronyms](docs/99_appendix_a_acronyms.md) |
| —  | [Appendix B: Resources](docs/99_appendix_b_resources.md) |

## 🔧 Technologies Used

- **Podman** – Secure, rootless container runtime
- **Keycloak** – Identity provider with SSO and MFA
- **Tailscale** – Zero Trust VPN mesh
- **Nextcloud-All-In-One** – Secure document collaboration
- **Mailcow** – Self-hosted email
- **Wazuh** – SIEM and endpoint monitoring
- **Ansible & Terraform** – Infrastructure as Code
- **Restic & BorgBackup** – Secure backup solutions
- **MkDocs + Mermaid** – Documentation & diagrams

## 🧩 CMMC Domains Covered

This guide maps directly to all **14 CMMC Level 2 domains** and their associated 110 practices as defined in **NIST SP 800-171 Rev. 2**.

## 📜 License

This project is released under the MIT License and is free to use, modify, and adapt.

## 🧠 Credits

Developed by cybersecurity professionals and community contributors focused on secure-by-design principles for the Defense Industrial Base.

---

For questions or contributions, please open an [issue](https://github.com/mtkell/mkdocs/issues) or submit a [pull request](https://github.com/mtkell/mkdocs/pulls).
