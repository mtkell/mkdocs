# Phase 6: Logging, SIEM, and Alerting

This phase integrates centralized logging and monitoring using **Wazuh**, providing visibility into authentication, file changes, system events, and potential threats.

## 📊 Phase 6 – Logging and Monitoring (Wazuh)

<img src="../../img/svg/phase06-logging.svg" alt="Wazuh integration with log forwarding from all services including auditd, journalctl, and syslog" style="width:100%; max-width:800px; margin:1em 0;">


---

## 🧰 Tools Used

- [Wazuh Server](https://wazuh.com/)
- Wazuh Agent (deployed to all hosts)
- Podman containerized dashboard (Kibana-like)
- Optional forwarding to external SIEM (e.g., Elastic, Splunk)

---

## 📦 Events to Monitor

| Source         | Example Events                     |
|----------------|------------------------------------|
| Keycloak       | Failed logins, MFA bypass attempts |
| Step-CA        | Cert issuance and revocation logs  |
| Mailcow        | SMTP errors, login attempts        |
| OS (auditd)    | User creation, sudo, file changes  |
| Wazuh Agent    | File integrity, process activity   |

---

## 🧪 Sample Ansible Task to Deploy Wazuh Agent

```yaml
- name: Install and enroll Wazuh agent
  hosts: all
  become: yes
  tasks:
    - name: Add Wazuh repo and install agent
      apt:
        name: wazuh-agent
        state: present
    - name: Configure agent to connect to Wazuh server
      lineinfile:
        path: /var/ossec/etc/ossec.conf
        regexp: '<address>'
        line: '  <address>wazuh.kell.local</address>'
```

---

## 📊 Dashboards & Alerts

- Customize alerts by severity, category
- Send critical alerts via email to admin
- Monitor login anomalies across all apps
- Schedule daily integrity scans (AIDE + Wazuh)

---

## 🔒 Secure the Monitoring Plane

- Use TLS between agents and server
- Lock access to Wazuh dashboards via Keycloak SSO
- Store logs long-term in immutable backup or cold storage

---

## ✅ Output of This Phase

- Full observability over system activity
- Live dashboards and audit trails for incident response
- Real-time alerting based on policy or behavioral anomalies

→ Proceed to [Phase 7: Validation and Reporting](08_validation_reporting.md)
