# CIS Control Mapping

## Overview

This document maps the Secure AI Applications on Azure project to selected CIS Critical Security Controls (CIS Controls v8) relevant to enterprise AI security, cloud governance, monitoring, operational resilience, and Responsible AI environments.

The purpose of this mapping is to demonstrate how cloud-native AI security engineering can conceptually align with recognized cybersecurity operational best practices.

This project is not intended to represent formal CIS certification or compliance validation.

Instead, it demonstrates practical security implementation concepts using:
- Azure AI Foundry
- Azure OpenAI Service
- Microsoft Sentinel
- Azure Monitor
- Azure Key Vault
- Prompt Shields
- AI monitoring workflows
- governance controls
- operational security practices

The project prioritizes:
- operational visibility
- governance accountability
- AI workload protection
- behavioural monitoring
- operational resilience
- layered security engineering

---

# Why CIS Controls Matter

The CIS Controls provide prioritized cybersecurity best practices for:
- operational security
- visibility
- monitoring
- incident response
- access control
- governance
- resilience
- risk reduction

Enterprise AI systems introduce additional operational risks involving:
- prompt injection
- behavioural manipulation
- unsafe outputs
- orchestration abuse
- operational misuse
- monitoring blind spots
- governance complexity

The CIS Controls help improve:
- operational visibility
- defensive maturity
- incident readiness
- governance accountability
- security resilience

---

# Governance Alignment Objectives

| Objective | Purpose |
|---|---|
| Improve Operational Visibility | Strengthen monitoring readiness |
| Improve Access Governance | Reduce identity exposure |
| Improve Monitoring Maturity | Improve telemetry analytics |
| Improve Incident Readiness | Support operational investigations |
| Improve AI Resilience | Strengthen layered safeguards |
| Improve Governance Accountability | Improve operational oversight |
| Improve Recovery Readiness | Improve operational continuity |
| Improve Behavioural Visibility | Improve AI anomaly detection |

---

# CIS Control Mapping

---

# CIS Control 1 — Inventory and Control of Enterprise Assets

## CIS Focus

Maintain visibility of organizational assets and operational systems.

---

## Project Alignment

The project improves visibility of:
- AI workloads
- monitoring services
- cloud resources
- operational telemetry

---

## Implementation Areas

- validate-resources.sh
- main.bicep
- monitoring.bicep
- Azure Monitor integration

---

## Operational Benefits

- improved asset visibility
- improved operational awareness
- improved governance oversight

---

# CIS Control 2 — Inventory and Control of Software Assets

## CIS Focus

Manage and monitor software and service usage.

---

## Project Alignment

The project monitors:
- AI services
- OpenAI deployments
- automation scripts
- orchestration workflows

---

## Implementation Areas

- openai.bicep
- Azure-CLI/
- Application-Insights.md
- Defender-for-Cloud.md

---

## Operational Benefits

- improved workload visibility
- improved operational governance
- improved monitoring readiness

---

# CIS Control 3 — Data Protection

## CIS Focus

Protect sensitive information and operational data.

---

## Project Alignment

The project protects:
- AI credentials
- operational secrets
- telemetry integrity
- sensitive AI interactions

---

## Implementation Areas

- Key-Vault-Integration.md
- keyvault.bicep
- Key-Rotation-Procedures.md
- Managed-Identities.md

---

## Operational Benefits

- improved credential security
- improved governance maturity
- improved operational trust

---

# CIS Control 4 — Secure Configuration of Enterprise Assets and Software

## CIS Focus

Maintain secure operational configurations.

---

## Project Alignment

The project implements:
- secure-by-default deployments
- Infrastructure-as-Code
- centralized monitoring
- RBAC governance

---

## Implementation Areas

- Bicep/
- Azure-CLI/
- SECURITY-BASELINE.md
- Identity-and-Access.md

---

## Operational Benefits

- reduced configuration drift
- improved operational resilience
- improved governance visibility

---

# CIS Control 5 — Account Management

## CIS Focus

Manage identities and operational access securely.

---

## Project Alignment

The project demonstrates:
- Managed Identities
- RBAC enforcement
- least privilege access
- credential governance

---

## Implementation Areas

- Managed-Identities.md
- Identity-and-Access.md
- keyvault.bicep

---

## Operational Benefits

- improved access governance
- reduced credential exposure
- improved operational security

---

# CIS Control 6 — Access Control Management

## CIS Focus

Restrict unauthorized access to systems and data.

---

## Project Alignment

The project applies:
- RBAC controls
- secure identity governance
- credential protection
- operational segmentation

---

## Implementation Areas

- Identity-and-Access.md
- Managed-Identities.md
- Key-Vault-Integration.md

---

## Operational Benefits

- improved operational trust
- improved governance maturity
- improved access security

---

# CIS Control 8 — Audit Log Management

## CIS Focus

Collect and manage security telemetry and audit logs.

---

## Project Alignment

The project centralizes telemetry using:
- Log Analytics
- Application Insights
- Microsoft Sentinel
- Azure Monitor

---

## Implementation Areas

- Log-Analytics.md
- Application-Insights.md
- Sentinel-Integration.md
- monitoring.bicep

---

## Operational Benefits

- improved telemetry visibility
- improved behavioural analytics
- improved investigation readiness

---

# CIS Control 13 — Network Monitoring and Defense

## CIS Focus

Improve operational monitoring and threat visibility.

---

## Project Alignment

The project improves monitoring through:
- AI telemetry analytics
- behavioural monitoring
- operational investigations
- threat hunting

---

## Implementation Areas

- AI-Monitoring.md
- Threat-Hunting.md
- Detection-Engineering.md
- KQL-Queries.md

---

## Operational Benefits

- improved anomaly detection
- improved operational awareness
- improved behavioural visibility

---

# CIS Control 17 — Incident Response Management

## CIS Focus

Improve incident handling and operational recovery.

---

## Project Alignment

The project demonstrates:
- AI incident response
- behavioural containment
- operational recovery
- credential rotation

---

## Implementation Areas

- AI-Incident-Runbook.md
- Containment-Strategies.md
- Recovery-Procedures.md
- Key-Rotation-Procedures.md

---

## Operational Benefits

- improved incident readiness
- improved operational resilience
- improved governance maturity

---

# CIS Control 18 — Penetration Testing

## CIS Focus

Validate security posture through adversarial testing.

---

## Project Alignment

The project demonstrates:
- AI red teaming
- prompt injection testing
- jailbreak testing
- abuse simulation

---

## Implementation Areas

- Prompt-Injection-Tests.md
- Jailbreak-Testing.md
- AI-Abuse-Scenarios.md
- Prompt-Leakage-Scenarios.md

---

## Operational Benefits

- improved adversarial readiness
- improved AI resilience
- improved operational visibility

---

# AI Security & Governance Alignment

The environment aligns operational security with:
- Responsible AI principles
- Zero Trust architecture
- behavioural monitoring
- governance accountability
- operational visibility
- AI resilience

---

# Monitoring & Operational Visibility

The project improves operational visibility using:
- Microsoft Sentinel
- Azure Monitor
- Log Analytics
- Application Insights
- telemetry analytics
- behavioural monitoring

This improves:
- anomaly detection
- incident investigations
- governance awareness
- operational analytics

---

# Governance & Responsible AI Integration

The environment integrates:
- behavioural oversight
- governance accountability
- operational transparency
- Responsible AI workflows
- AI safety monitoring
- incident readiness

This improves:
- governance maturity
- operational trust
- behavioural integrity
- AI resilience

---

# Security & Governance Outcomes

The CIS alignment improves:

## Governance Visibility

- improved operational transparency
- improved accountability visibility

---

## Operational Resilience

- improved recovery readiness
- improved incident response capability

---

## Monitoring Readiness

- improved telemetry visibility
- improved behavioural analytics

---

## Responsible AI Maturity

- improved governance accountability
- improved behavioural oversight
- improved operational trust

---

# Strategic Importance

Enterprise AI systems increasingly require:
- operational monitoring
- governance oversight
- identity governance
- incident readiness
- AI threat detection
- behavioural visibility
- operational resilience

The CIS Controls provide practical operational guidance for improving:
- visibility
- monitoring
- defensive maturity
- operational trust
- governance accountability

This project demonstrates how enterprise AI security engineering can conceptually align with CIS Controls using cloud-native monitoring, AI safety controls, behavioural analytics, operational telemetry, governance workflows, and layered security engineering practices.

---

# Final Perspective

Enterprise AI systems require operational security controls beyond traditional application protection models.

Effective AI operational security requires:
- monitoring visibility
- governance accountability
- behavioural analytics
- threat detection
- identity governance
- operational resilience
- incident readiness
- layered cloud-native security controls

This project demonstrates how enterprise AI security engineering can conceptually align with CIS Controls through monitoring integration, behavioural visibility, AI threat detection, governance workflows, incident response readiness, operational telemetry, and layered Responsible AI security practices.