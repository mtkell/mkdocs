# Phase 3: Podman Service Deployment

In this phase, we deploy core application services using **Podman** — a rootless, secure container runtime. Podman replaces Docker and integrates cleanly with systemd for persistent service management.

> 📌 **Note:** As of this phase, Nextcloud is deployed via a standalone hardened container using the **Nextcloud All-in-One (AIO)** model. It is **not** managed via `podman-compose`, but follows secure Docker deployment practices described in [Phase 4: File Collaboration Services](./phase04-files.md).

---

## 📦 Phase 3 – Podman Service Deployment

<img src="../../img/svg/phase03-podman.svg" alt="Workflow for deploying Keycloak, Mailcow, Wazuh, and Step-CA as rootless Podman containers" style="width:100%; max-width:800px; margin:1em 0;">

---

## 🧰 Prerequisites

- Host hardened via Ansible (see Phase 2)
- `podman`, `podman-compose`, and `uidmap` installed
- Containers will run as **non-root** service users
- Reverse proxy (e.g., NGINX Proxy Manager) must be deployed to interface with external traffic

---

## 🧱 Recommended Structure

```
services/
├── keycloak/
│   └── podman-compose.yml
├── mailcow/
│   └── podman-compose.yml
├── wazuh/
│   └── podman-compose.yml
├── step-ca/
│   └── podman-compose.yml
└── aio-launcher/
    └── docker-run.sh  # used for Nextcloud AIO
```

Each subdirectory contains:

- A `podman-compose.yml` or `docker-run.sh` launcher script
- A `.env` file (secured)
- Systemd unit files for automatic start

---

## ⚙️ Systemd Unit Template (Podman Service)

Example for Keycloak:

```ini
[Unit]
Description=Podman container for Keycloak
Wants=network.target
After=network.target

[Service]
User=svc_keycloak
ExecStart=/usr/bin/podman-compose -f /opt/services/keycloak/podman-compose.yml up
ExecStop=/usr/bin/podman-compose -f /opt/services/keycloak/podman-compose.yml down
Restart=always
EnvironmentFile=/opt/services/keycloak/.env

[Install]
WantedBy=multi-user.target
```

Install with:

```bash
sudo systemctl daemon-reexec
sudo systemctl enable --now podman-keycloak.service
```

---

## ⚠️ Exception: Nextcloud AIO

**Nextcloud AIO** is deployed using a hardened standalone Docker container to ensure full integration of Redis, PostgreSQL, ClamAV, and OnlyOffice in a single isolated unit.

Use:

```bash
docker run -d \
  --name nextcloud-aio-mastercontainer \
  --restart always \
  -p 8080:8080 \
  -v nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
  -e NEXTCLOUD_DATADIR="/mnt/ncdata" \
  nextcloud/all-in-one:latest
```

This container should be reverse proxied and monitored with health checks via Uptime Kuma.

---

## 🔒 Security Practices

- Use separate non-root service accounts for each containerized app
- Limit all traffic via internal-only Docker or Podman networks
- Use NGINX Proxy Manager to route HTTPS traffic securely
- Never expose Podman services directly to WAN or bypass ACLs

---

## ✅ Output of This Phase

- All core services (except Nextcloud) deployed as **rootless Podman containers**
- Systemd units ensure services survive reboots and restart cleanly
- File collaboration services (Nextcloud AIO) prepared for deployment in Phase 4

→ Proceed to [Phase 4: File Collaboration Services with Nextcloud AIO](./phase04-files.md)
