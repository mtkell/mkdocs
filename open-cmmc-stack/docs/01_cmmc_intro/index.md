# 📑 Section 1: Introduction to CMMC v2

## 🔐 What is CMMC v2?

The **Cybersecurity Maturity Model Certification (CMMC)** is a unified cybersecurity framework created by the U.S. Department of Defense (DoD) to safeguard the **Defense Industrial Base (DIB)** from cyber threats. **CMMC Version 2.0** refines the original model to be more streamlined, flexible, and aligned with existing federal standards.

CMMC v2 introduces **three levels of cybersecurity maturity**:

- **Level 1 (Foundational)** – 17 basic safeguarding requirements (aligned with FAR 52.204-21)
- **Level 2 (Advanced)** – 110 security requirements (mirrors NIST SP 800-171)
- **Level 3 (Expert)** – Based on NIST SP 800-172, designed for highly sensitive environments

CMMC is not just a self-check — it's a requirement embedded into DoD contracts. Companies handling **Controlled Unclassified Information (CUI)** are expected to reach **Level 2 or higher**, depending on the nature of the contract.

---

## 📚 How It Maps to NIST SP 800-171

CMMC v2 Level 2 is **intentionally and directly mapped** to **NIST Special Publication 800-171**, which defines the security requirements for protecting CUI in non-federal systems.

| NIST SP 800-171 | CMMC v2 Level 2 |
|-----------------|------------------|
| 110 Requirements | 110 Practices |
| 14 Control Families | 14 Domains |
| Assessment-based | Assessment-based |

Each of the 14 NIST control families (Access Control, Audit and Accountability, Configuration Management, etc.) is reflected in the **CMMC v2 domain structure**.

CMMC goes a step further by requiring **evidence**, **documentation**, and often **third-party assessments** through **Certified Third-Party Assessment Organizations (C3PAOs)** for Level 2.

---

## 🎯 CMMC Level 2 Overview

Level 2 applies to contractors who **store, process, or transmit CUI**. This includes sensitive technical data, engineering drawings, procurement details, and program information — but not classified materials.

### Level 2 Key Elements

- **All 110 controls from NIST 800-171**
- **Formal System Security Plan (SSP)** and **Plan of Action & Milestones (POA&M)**
- **Scope definition** of the systems and assets that handle CUI
- **Third-party certification required** for prioritized acquisitions

Level 2 is the **most common target level** for small and medium DoD contractors.

---

## 🧩 Why FOSS? Pros and Risks

This guide proposes an implementation using **Free and Open Source Software (FOSS)** tools, carefully selected to align with CMMC objectives while reducing cost and increasing transparency.

### ✅ Benefits of FOSS

- **Cost efficiency**: No per-user licensing costs
- **Transparency**: Open codebases support trust and auditability
- **Portability**: No vendor lock-in, can run on any compliant infrastructure
- **Community-driven**: Security issues are often identified and patched faster

### ⚠️ Risks to Mitigate

- **Configuration complexity**: More technical knowledge is required
- **Support**: No guaranteed commercial support unless purchased separately
- **Compliance responsibility**: You own the full implementation and documentation
- **Security validation**: You must harden, monitor, and validate each component

FOSS is ideal for organizations with technical maturity or access to a capable MSP (Managed Service Provider) who can support security and compliance goals.

---

## 📌 What This Guide Does (and Doesn’t) Do

### ✅ This guide **does**

- Provide a full-stack architecture using FOSS tools aligned to CMMC v2 Level 2
- Include infrastructure-as-code examples (Terraform, Ansible)
- Map controls to CMMC/NIST 800-171 domains
- Help you prepare for a **real assessment** with artifacts and references

### ❌ This guide **does not**

- Provide legal or official certification
- Guarantee pass/fail outcomes — that's up to your implementation and the C3PAO
- Cover CMMC Level 3 (based on NIST SP 800-172)
- Offer vendor-based “compliant in a box” shortcuts

Use this guide as a **blueprint** to build your own defensible, compliant, and resilient system.

---
