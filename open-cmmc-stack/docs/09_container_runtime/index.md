# 📦 Section 9: Application Hosting (Podman + systemd)

## 🎯 Objective

This section describes how to securely host applications using **Podman** and **systemd**, focusing on container isolation, secure runtime options, and auditability — all aligned to CMMC Level 2 controls in **Configuration Management (CM)** and **System & Communications Protection (SC)**.

---

## 🧩 Why Podman?

**Podman** is a daemonless, rootless container engine that provides:

- Compatibility with Docker images and commands  
- Improved security by eliminating `dockerd`  
- Native systemd integration for service orchestration  
- Compliance with Zero Trust and least privilege principles  

---

## 🔐 Podman Rootless Setup (Recap)

To enable rootless containers:

```bash
sudo apt install -y podman uidmap slirp4netns fuse-overlayfs
```

Verify with:

```bash
podman info --debug
```

Create a systemd unit to persist a service:

```bash
podman generate systemd \
  --name myservice \
  --files --restart-policy=always

mkdir -p ~/.config/systemd/user
mv container-myservice.service ~/.config/systemd/user/

systemctl --user daemon-reexec
systemctl --user enable --now container-myservice.service
```

---

## 🛡️ Secure Runtime Flags

Use the following Podman options for container hardening:

```bash
--cap-drop=ALL
--read-only
--security-opt no-new-privileges
--userns=keep-id
--pids-limit=100
--memory=512m
--cpu-shares=256
```

These settings enforce the principle of least privilege, memory limits, and user isolation.

---

## 🗂️ Managing Data Volumes

Create named volumes for each service:

```bash
podman volume create nextcloud_data
podman run -v nextcloud_data:/var/www/html ...
```

For bind mounts, always use:

```bash
-v /srv/data:/app/data:Z
```

This applies the correct SELinux label (`:Z` for shared access).

---

## 🔁 Using `podman-compose` for Multi-Service Deployments

Install using pipx:

```bash
pipx install podman-compose
```

Use standard `docker-compose.yml` files, but ensure:

- All image names are fully qualified (e.g., `docker.io/library/nginx`)  
- External networks exist in advance (`podman network create`)  

---

## 📋 CMMC Practices Addressed

| CMMC Practice | Description |
|---------------|-------------|
| CM.2.062 | Employ secure configurations for IT products |
| SC.1.175 | Protect CUI in transit between services |
| SC.3.178 | Prevent unauthorized communication between containers |
| SI.1.210 | Support log and runtime activity tracking |
| AC.1.001 | Control access to application resources |

---

## ✅ Next Step

Now that your services are hosted securely in Podman, the next section covers backup and recovery strategies to protect CUI and ensure business continuity.

---
