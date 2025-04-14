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
| — | [Appendix A: Acronyms](docs/99_appendix_a_acronyms.md) |
| — | [Appendix B: Resources](docs/99_appendix_b_resources.md) |

## 🔧 Technologies Used

- **Podman** – Secure, rootless container runtime
- **Keycloak** – Identity provider with SSO and MFA
- **Tailscale** – Zero Trust VPN mesh
- **Nextcloud** – Secure document collaboration
- **Mailcow** – Self-hosted email
- **Wazuh** – SIEM and endpoint monitoring
- **Ansible & Terraform** – Infrastructure as Code

## 🧩 CMMC Domains Covered

This guide maps directly to all **14 CMMC Level 2 domains** and their associated 110 practices as defined in **NIST SP 800-171 Rev. 2**.

## 📜 License

This project is released under the MIT License and is free to use, modify, and adapt.

## 🧠 Credits

Developed by cybersecurity professionals and community contributors focused on secure-by-design principles for the Defense Industrial Base.

---

For questions or contributions, please open an [issue](https://github.com/your-org/open-cmmc-stack/issues) or submit a [pull request](https://github.com/your-org/open-cmmc-stack/pulls).
