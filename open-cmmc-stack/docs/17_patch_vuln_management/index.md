# 🛠️ Section 17: Patch & Vulnerability Management

## 🎯 Objective

This section outlines the procedures, tooling, and schedules for maintaining **patched and secure software**, container images, and infrastructure configurations in the OpenCMMC Stack. It supports compliance with CMMC Level 2 practices in the **System & Information Integrity (SI)**, **Configuration Management (CM)**, and **Risk Assessment (RA)** domains.

---

## 🔄 Continuous Patching Strategy

### 1. Host-Level Patching

| Component | Method | Schedule |
|-----------|--------|----------|
| Ubuntu OS | `apt update && apt upgrade` via Ansible | Weekly (auto), Monthly (manual) |
| Kernel/critical CVEs | `unattended-upgrades` + CVE tracking | Daily |
| System hardening validation | Ansible diff or compliance check | Monthly |

### 2. Container Image Refresh

| Component | Source | Validation |
|-----------|--------|------------|
| Podman images | `podman pull <image>` | Digest verification |
| Image integrity | `skopeo inspect` + SBOM check | `grype`, `trivy` |
| Drift detection | `ansible-playbook` dry-run | Weekly |

---

## 🔍 Vulnerability Scanning Tools

| Tool | Target | Purpose |
|------|--------|---------|
| `grype` | Local containers, images | SBOM and CVE scans |
| `trivy` | Container registry, file systems | Vulnerability + secret scan |
| `clamav` | File uploads in Nextcloud | Malware detection |
| `ansible-lint` | IaC playbook scan | Misconfig checks |

---

## 🔄 Patch Lifecycle Automation (Ansible)

- Role: `roles/patching`
- Features:
  - OS package updates
  - Container image digests refresh
  - Service restarts for updated dependencies
  - Backup validation prior to changes
  - Summary report email

---

## 🧪 Verification Checklist

| Check | Method | Evidence |
|-------|--------|----------|
| CVE reports resolved | `grype`, `trivy` | JSON scan reports |
| Kernel patches current | `uname -r`, `apt` | CLI output |
| Image digests match SBOM | `skopeo inspect` | Diff report |
| No critical unpatched packages | `apt list --upgradable` | CLI export |
| Patch playbook log exists | `ansible-playbook` log | Log file |

---

## 📅 Recommended Patch Schedule

| Frequency | Tasks |
|-----------|-------|
| Daily | Security CVE polling, unattended upgrades |
| Weekly | OS & container image patch via Ansible |
| Monthly | Restore test, SBOM scan, role diff |
| Quarterly | Full stack rebuild in staging |

---

## 📜 CMMC Practices Addressed

| Practice | Description |
|----------|-------------|
| SI.1.210 | Identify and manage system flaws |
| SI.2.214 | Update and patch system vulnerabilities |
| CM.2.067 | Monitor system configuration for change |
| RA.2.144 | Scan for vulnerabilities |

---

## ✅ Next Step

In Section 18, we’ll define the incident response and forensics capabilities to prepare for breach scenarios and ensure auditability.
