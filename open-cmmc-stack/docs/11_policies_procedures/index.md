# 📚 Section 11: Policies & Procedures

## 🎯 Objective

This section outlines the process for aligning your technical implementation with the necessary **written policies and procedures** required under CMMC Level 2. Even the most secure infrastructure must be supported by documented intent, authority, and repeatable action.

---

## 🧩 Why Policies Matter

CMMC assessments evaluate more than technology. They look for:

- **Policies**: The "what" — formal statements of expectation or requirement  
- **Procedures**: The "how" — actionable, repeatable steps supporting the policy  

Policies provide direction. Procedures provide execution. Both are required artifacts.

---

## 🗂️ Core Policies to Implement

| Policy Name                 | Related CMMC Domains         |
|----------------------------|------------------------------|
| Access Control Policy       | AC, IA                       |
| Configuration Management    | CM                           |
| Incident Response Policy    | IR                           |
| Media Protection Policy     | MP                           |
| System & Communications     | SC                           |
| System Integrity & Audit    | AU, SI                       |
| Backup & Contingency Plan   | CP                           |
| Personnel Security Policy   | PS                           |
| Risk Management Policy      | RM                           |

Each policy should include:

- Scope and purpose  
- Roles and responsibilities  
- High-level expectations  
- References to supporting procedures  

---

## 🛠️ Procedure Examples

Procedures should be detailed, auditable, and mapped to specific practices.

### Example: User Onboarding Procedure

- HR submits request to IT  
- IT generates user account in Keycloak  
- Assigns group memberships based on job role  
- Enforces MFA enrollment before first login  
- Logs provisioning in central system  

Mapped to:

- AC.1.001: Limit access to authorized users  
- IA.1.076: Identify/authenticate users  
- AC.3.021: Role-based access  

---

## 📜 Formatting Guidance

Use a consistent template for policies and procedures:

```
# <Policy Name>

## Purpose
...

## Scope
...

## Responsibilities
...

## Policy Statements
...

## References
...

## Review Cycle
Annually or upon significant system change
```

Save each policy as Markdown or PDF in a version-controlled repository.

---

## 🧾 Audit Artifacts to Generate

- Policy documents (signed or approved)  
- Procedures linked to technical systems  
- Revision history or change logs  
- Review schedules  
- Staff training records  

---

## 🛡️ CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| CA.2.157 | Define and enforce security policies |
| CM.2.062 | Document secure configurations |
| AC.2.009 | Limit unsuccessful login attempts |
| IR.2.093 | Establish incident handling process |
| PS.2.129 | Screen personnel before access to systems |

---

## ✅ Next Step

With policies in place, the final step is conducting a pre-assessment gap review and mapping your controls to **System Security Plan (SSP)** artifacts in **Section 12**.

---
