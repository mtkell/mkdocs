# 🧭 Section 0: Project Overview & Usage

## 🎯 Purpose

This guide provides a full-stack, open-source infrastructure and documentation model to help **small and medium-sized DoD contractors** meet **CMMC Level 2** requirements. Every section includes actionable implementation steps and clearly maps to the NIST SP 800-171 control families.

---

## 💡 Who Is This For?

This guide is designed for:

- IT Directors, CTOs, and CISOs in the **Defense Industrial Base**
- Small teams managing internal or customer-facing secure infrastructure
- MSPs and consultants preparing clients for **CMMC 2.0 assessments**
- Technical leads seeking a compliant, open-source alternative to GCC High

---

## 🛠️ What’s Included?

This documentation delivers:

- A hardened Linux-based infrastructure using **rootless Podman** and **systemd**
- Fully containerized services for **file sharing**, **email**, **SSO**, and **logging**
- Automated provisioning with **Terraform** and **Ansible**
- Written policy templates and **audit-ready artifacts**
- CMMC control mappings and SSP guidance

---

## 🧰 What’s Required?

| Area              | Requirements |
|-------------------|--------------|
| OS                | Ubuntu 22.04 LTS (hardened) |
| Host Type         | Cloud VM, VPS, or local server |
| Tools Installed   | Podman, Ansible, Terraform |
| Compliance Target | CMMC Level 2, mapped to NIST SP 800-171 Rev. 2 |

---

## 📦 Guide Format

This guide is structured across **12 implementation chapters** and **2 appendices**, each representing a functional block of a secure system:

- Each section includes:
  - Technical setup (infra, config, scripts)
  - CMMC control mapping
  - Operational best practices
  - Audit preparation guidance

---

## 📜 Licensing and Use

This project is provided under the **MIT License**. You are free to copy, adapt, modify, or integrate it into your own workflows. Attribution is appreciated but not required.

**⚠️ Disclaimer:** This guide is not a certification guarantee. It is a blueprint for implementation. You must tailor it to your unique environment and work with a qualified C3PAO for CMMC certification.

---

## ✅ Getting Started

You can begin immediately with [Section 1: Introduction to CMMC v2](../01_cmmc_intro/index.md), or browse the [full guide index](../README.md) for an overview of all components.

---
