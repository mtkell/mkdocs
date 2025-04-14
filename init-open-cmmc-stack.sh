#!/bin/bash

set -e

echo "📁 Creating OpenCMMC Stack directory structure..."

# List of directories
dirs=(
  "open-cmmc-stack/terraform"
  "open-cmmc-stack/ansible/playbooks"
  "open-cmmc-stack/ansible/inventory"
  "open-cmmc-stack/ansible/roles/common/tasks"
  "open-cmmc-stack/ansible/roles/common/templates"
  "open-cmmc-stack/ansible/roles/common/files"
  "open-cmmc-stack/ansible/roles/hardening/tasks"
  "open-cmmc-stack/ansible/roles/podman/tasks"
  "open-cmmc-stack/ansible/roles/keycloak/tasks"
  "open-cmmc-stack/ansible/roles/mailcow/tasks"
  "open-cmmc-stack/ansible/roles/nextcloud/tasks"
  "open-cmmc-stack/ansible/roles/stepca/tasks"
  "open-cmmc-stack/ansible/roles/tailscale/tasks"
  "open-cmmc-stack/ansible/roles/wazuh/tasks"
  "open-cmmc-stack/compose"
  "open-cmmc-stack/env"
  "open-cmmc-stack/systemd"
  "open-cmmc-stack/certs"
  "open-cmmc-stack/step-ca/config"
  "open-cmmc-stack/step-ca/secrets"
  "open-cmmc-stack/.github/workflows"
)

# List of files to touch
files=(
  "open-cmmc-stack/README.md"
  "open-cmmc-stack/mkdocs.yml"
  "open-cmmc-stack/terraform/main.tf"
  "open-cmmc-stack/ansible/playbooks/site.yml"
  "open-cmmc-stack/compose/open-cmmc-stack.yml"
  "open-cmmc-stack/.github/workflows/deploy.yml"
)

# Create directories
for d in "${dirs[@]}"; do
  mkdir -p "$d"
done

# Create files
for f in "${files[@]}"; do
  touch "$f"
done

echo "✅ Folder and file scaffolding for OpenCMMC Stack created successfully."
