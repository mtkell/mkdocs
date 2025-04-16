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

- A hardened Ubuntu-based infrastructure using **rootless Podman**, **systemd**, and Zero Trust principles
- Fully containerized services for **file sharing**, **email**, **SSO**, **monitoring**, and **backup**
- Automated provisioning using **Terraform**, **Ansible**, and templated CI/CD workflows
- Pre-mapped policy templates, SSP structure, and **audit-ready documentation**
- Compatibility with Windows, Linux, macOS, iOS, and Android clients

---

## 🧰 What’s Required?

| Area              | Requirements |
|-------------------|--------------|
| OS                | Ubuntu 22.04 LTS (hardened) |
| Host Type         | Cloud VM, VPS, bare metal |
| Tools Installed   | Podman, Ansible, Terraform |
| Compliance Target | CMMC Level 2, mapped to NIST SP 800-171 Rev. 2 |

---

## 📦 Guide Format

This guide is structured across **21 technical and strategic sections** with **appendices** and **automation support**, each representing a key stage of deployment, governance, or assessment readiness.

Each section includes:

- Infrastructure-as-code implementation
- CMMC control mappings
- Operational guidance
- Audit artifacts and documentation templates

---

## 📜 Licensing and Use

This project is provided under the **MIT License**. You are free to copy, adapt, modify, or integrate it into your own workflows. Attribution is appreciated but not required.

**⚠️ Disclaimer:** This guide is not a certification guarantee. It is a blueprint for implementation. You must tailor it to your unique environment and work with a qualified C3PAO for CMMC certification.

---

## ✅ Getting Started

You can begin immediately with [Section 1: Introduction to CMMC v2](../01_cmmc_intro/index.md), or browse the [full guide index](../README.md) for an overview of all components.

---
