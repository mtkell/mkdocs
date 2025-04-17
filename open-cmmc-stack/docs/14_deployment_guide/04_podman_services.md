# 🧩 Phase 3: Podman Services Deployment

## 🎯 Objective

This phase installs and configures the core **Podman-based services** used throughout the OpenCMMC Stack. It leverages an Ansible role to run secure, rootless containers for various components, except for Nextcloud AIO, which remains a hardened Docker container due to its upstream architecture.

---

## 📦 Role: `podman_services`

The `podman_services` Ansible role handles:

- Pulling images via Podman
- Deploying containers as systemd-managed services
- Restart policies and volume bindings
- Managing containers declaratively from a variable file

All Podman-managed containers run rootless under defined service accounts and can be expanded modularly.

---

## 🧾 Example Usage

```yaml
- name: Deploy Podman services
  hosts: localhost
  become: yes
  roles:
    - role: podman_services
```

Edit the `defaults/main.yml` to declare your container list:

```yaml
podman_services:
  - name: keycloak
    image: quay.io/keycloak/keycloak:24.0.2
    ports:
      - "8080:8080"
    volumes:
      - "/opt/keycloak:/data:z"
    env:
      KEYCLOAK_ADMIN: admin
      KEYCLOAK_ADMIN_PASSWORD: changeme
```

---

## 🧱 Optional Service Layout (Manual Pods)

Some organizations may still use a pod structure like below:

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

Each service directory includes:

- `podman-compose.yml` or single-container runner script
- `.env` file (secured)
- Optional systemd unit templates

However, the `podman_services` role supersedes the need for manual pod structures.

---

## ⚙️ Example Systemd Unit (Optional)

```ini
[Unit]
Description=Podman container for Keycloak
Wants=network.target
After=network.target

[Service]
User=svc_keycloak
ExecStart=/usr/bin/podman run --rm quay.io/keycloak/keycloak:24.0.2
Restart=always

[Install]
WantedBy=multi-user.target
```

In most cases, this is replaced with Ansible-deployed `podman_container` modules and pre-written units.

---

## 🔒 Security Considerations

- All Podman containers run **as non-root** service accounts
- Use `:z` SELinux volume labels for confined access
- Isolate each service to private networks where possible
- Do **not expose ports** directly to WAN without reverse proxy
- Enforce container logs forwarding to **Wazuh**

---

## ⚠️ Exception: Nextcloud AIO (Docker)

Nextcloud AIO is a single Docker container that includes:

- Redis
- PostgreSQL
- ClamAV
- OnlyOffice
- Nextcloud core

```bash
docker run -d \
  --name nextcloud-aio-mastercontainer \
  --restart always \
  -p 8080:8080 \
  -v nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
  -e NEXTCLOUD_DATADIR="/mnt/ncdata" \
  nextcloud/all-in-one:latest
```

This container is managed via the `file_storage` role in **Phase 3a** and must be:

- Placed behind NGINX Proxy Manager
- Included in your Tailscale ACLs
- Backed up via volume mount `/mnt/ncdata`

---

## 📜 CMMC Practices Mapped

| CMMC Practice | Description |
|---------------|-------------|
| CM.2.064 | Track and approve software components |
| AC.3.021 | Use role-based service separation |
| SC.3.177 | Encrypt data flows within containers |
| AU.2.042 | Enable logging from Podman containers |
| MA.3.115 | Support automated service restarts |

---

## ✅ Output of This Phase

- Podman-deployed containers configured via Ansible
- Secure container runtime fully integrated
- Nextcloud AIO Docker container ready for launch in **Phase 3a**

→ Continue to [Phase 3a: File Collaboration Services with Nextcloud AIO](./phase04-files.md)

---
