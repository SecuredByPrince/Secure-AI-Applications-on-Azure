# Shared Responsibility Model

## Overview

This document defines the shared responsibility model for the Secure AI Applications on Azure project.

The purpose of this document is to explain how security, governance, monitoring, operational management, and AI protection responsibilities are divided between:
- Microsoft Azure
- the customer organization
- security operations teams
- AI governance stakeholders

Understanding the shared responsibility model is critical for enterprise AI security because cloud providers secure the underlying cloud infrastructure, while customers remain responsible for securing:
- AI workloads
- identities
- configurations
- governance controls
- monitoring
- operational processes
- AI usage behaviour

Modern AI systems introduce additional operational and governance responsibilities beyond traditional cloud workloads due to:
- prompt-driven behaviour
- adversarial AI threats
- unsafe output generation
- AI misuse scenarios
- governance risks
- behavioural monitoring requirements

This project demonstrates how enterprise AI security responsibilities are shared operationally across cloud infrastructure, AI services, governance, and security operations.

---

# Purpose of the Shared Responsibility Model

The shared responsibility model helps organisations:
- understand operational ownership
- clarify security accountability
- reduce configuration risk
- improve governance maturity
- improve operational readiness
- improve AI security awareness

The model establishes which responsibilities belong to:
- Microsoft
- the customer organization
- security teams
- governance stakeholders

---

# Why Shared Responsibility Matters for AI

Traditional cloud workloads already require shared operational responsibility.

AI systems increase complexity because organisations must also manage:
- prompt security
- AI governance
- monitoring visibility
- Responsible AI controls
- adversarial AI resilience
- AI abuse prevention
- behavioural monitoring

Even if the cloud platform itself is secure, poorly governed AI systems may still:
- leak sensitive data
- generate unsafe outputs
- be manipulated adversarially
- operate without sufficient oversight
- introduce governance failures

Understanding operational ownership is therefore critical for enterprise AI resilience.

---

# Shared Responsibility Principles

The project follows several core shared responsibility principles.

| Principle | Purpose |
|---|---|
| Cloud Provider Secures the Cloud | Infrastructure protection |
| Customer Secures What They Deploy | Workload responsibility |
| Governance Requires Shared Oversight | Operational accountability |
| Monitoring Is Customer Responsibility | Operational visibility |
| AI Safety Requires Layered Controls | Shared operational resilience |
| Identity Security Remains Critical | Secure access management |

---

# Microsoft Responsibilities

Microsoft is responsible for securing the underlying Azure cloud infrastructure.

---

# Physical Infrastructure Security

## Microsoft Responsibilities

Microsoft secures:
- physical datacenters
- hardware infrastructure
- networking infrastructure
- physical access controls
- environmental protections

## Security Benefits

- secure cloud foundation
- infrastructure resilience
- physical operational security

---

# Azure Platform Security

## Microsoft Responsibilities

Microsoft secures:
- Azure platform infrastructure
- hypervisors
- core platform services
- platform networking layers
- foundational cloud services

## Security Benefits

- secure cloud operations
- resilient service availability
- platform integrity

---

# Azure AI Service Availability

## Microsoft Responsibilities

Microsoft maintains:
- Azure AI platform availability
- foundational AI service infrastructure
- platform uptime
- backend AI service reliability

## Security Benefits

- stable AI platform operations
- resilient cloud service delivery

---

# Native Security Capabilities

## Microsoft Responsibilities

Microsoft provides:
- security tooling
- monitoring capabilities
- AI safety features
- governance capabilities
- cloud-native protections

Examples include:
- Microsoft Sentinel
- Defender for Cloud
- Azure Monitor
- Prompt Shields
- Azure AI Content Safety

## Security Benefits

- integrated security tooling
- operational monitoring capabilities
- cloud-native defensive services

---

# Customer Responsibilities

The customer organization remains responsible for securing what is deployed and operated within Azure.

This includes the majority of operational AI security responsibilities.

---

# Identity & Access Security

## Customer Responsibilities

Customers must manage:
- user identities
- RBAC assignments
- least privilege access
- privileged accounts
- identity governance
- Managed Identities usage

## Risks If Ignored

- privilege abuse
- unauthorized access
- operational compromise

## Security Controls

- Microsoft Entra ID
- RBAC
- access reviews
- Managed Identities

---

# AI Configuration Security

## Customer Responsibilities

Customers must securely configure:
- Azure AI deployments
- model access
- prompt workflows
- AI integrations
- filtering configurations

## Risks If Ignored

- misconfigurations
- excessive exposure
- operational weaknesses

## Security Controls

- secure configuration baselines
- restrictive access controls
- Prompt Shields
- AI filtering policies

---

# Prompt Security

## Customer Responsibilities

Customers are responsible for:
- prompt handling
- prompt restrictions
- prompt governance
- adversarial prompt protection

## Risks If Ignored

- prompt injection
- jailbreak attacks
- prompt leakage

## Security Controls

- Prompt Shields
- monitoring
- prompt validation
- AI red teaming

---

# Monitoring & Logging

## Customer Responsibilities

Customers must enable and manage:
- telemetry collection
- monitoring visibility
- logging retention
- Sentinel integration
- operational alerting

## Risks If Ignored

- operational blind spots
- delayed investigations
- undetected AI abuse

## Security Controls

- Azure Monitor
- Log Analytics
- Application Insights
- Sentinel analytics

---

# Detection Engineering

## Customer Responsibilities

Customers are responsible for:
- detection logic
- threat hunting
- operational alerting
- KQL analytics
- anomaly monitoring

## Risks If Ignored

- detection blind spots
- delayed incident response
- reduced operational visibility

## Security Controls

- Sentinel analytics
- KQL detection rules
- telemetry analysis

---

# Responsible AI Governance

## Customer Responsibilities

Customers must define:
- governance workflows
- accountability structures
- operational oversight
- human review processes
- Responsible AI procedures

## Risks If Ignored

- governance failures
- unsafe AI behaviour
- accountability gaps

## Security Controls

- governance policies
- operational oversight
- monitoring workflows
- auditability

---

# Incident Response

## Customer Responsibilities

Customers are responsible for:
- incident investigations
- operational response
- threat hunting
- alert triage
- remediation workflows

## Risks If Ignored

- operational disruption
- delayed response
- increased attacker dwell time

## Security Controls

- Sentinel incidents
- operational runbooks
- investigation workflows

---

# Data Protection Responsibilities

## Customer Responsibilities

Customers remain responsible for:
- protecting sensitive data
- controlling data access
- managing secrets
- securing enterprise information

## Risks If Ignored

- data leakage
- compliance exposure
- operational compromise

## Security Controls

- Azure Key Vault
- RBAC
- least privilege
- secure data handling

---

# AI Safety Responsibilities

## Customer Responsibilities

Customers must implement:
- AI safety workflows
- harmful content controls
- governance oversight
- output validation processes

## Risks If Ignored

- unsafe outputs
- reputational damage
- governance failures

## Security Controls

- AI Content Safety
- filtering policies
- operational review workflows

---

# Shared Responsibilities

Some operational areas are jointly shared between Microsoft and the customer.

---

# AI Safety

## Shared Responsibility

Microsoft provides:
- AI safety tooling
- filtering capabilities
- Prompt Shields

Customers must:
- configure policies
- validate controls
- monitor behaviour
- implement governance workflows

---

# Monitoring Visibility

## Shared Responsibility

Microsoft provides:
- monitoring platforms
- telemetry infrastructure

Customers must:
- enable monitoring
- configure alerts
- analyze telemetry
- investigate incidents

---

# Governance & Compliance

## Shared Responsibility

Microsoft provides:
- governance tooling
- compliance capabilities
- security benchmarks

Customers must:
- implement governance workflows
- map controls
- manage accountability
- perform operational oversight

---

# AI Abuse Prevention

## Shared Responsibility

Microsoft provides:
- filtering controls
- AI safety services

Customers must:
- monitor abuse activity
- implement restrictions
- investigate suspicious behaviour

---

# Operational Security Responsibilities

The project emphasizes operational security ownership.

The customer remains operationally responsible for:
- threat hunting
- telemetry visibility
- incident investigations
- governance maturity
- adversarial testing
- AI monitoring

This reflects how AI security extends beyond infrastructure security alone.

---

# Governance & Compliance Alignment

The shared responsibility approach aligns with:
- ISO/IEC 42001
- NIST AI RMF
- MITRE ATLAS
- CIS Controls
- Microsoft Security Benchmark

The objective is to demonstrate how operational accountability supports enterprise AI governance maturity.

---

# Common Misconceptions

---

# Misconception 1 — “The Cloud Provider Secures Everything”

## Reality

Customers remain responsible for:
- AI configuration
- governance
- monitoring
- identity security
- operational oversight

---

# Misconception 2 — “AI Services Are Automatically Safe”

## Reality

AI systems still require:
- governance
- monitoring
- adversarial testing
- operational controls
- human oversight

---

# Misconception 3 — “Monitoring Is Optional”

## Reality

Operational visibility is critical for:
- incident response
- governance
- adversarial detection
- AI abuse monitoring

---

# Operational Outcomes

Understanding the shared responsibility model improves:

## Governance Awareness

- improved accountability
- clearer operational ownership

---

## Security Visibility

- improved operational readiness
- improved monitoring awareness

---

## Risk Management

- improved understanding of AI security exposure
- improved governance maturity

---

## Enterprise AI Resilience

- improved layered defense
- improved operational resilience

---

# Strategic Importance

Enterprise AI systems require shared operational accountability across:
- cloud infrastructure
- governance
- monitoring
- identity security
- AI safety
- operational response

The shared responsibility model helps organisations:
- reduce operational confusion
- improve accountability
- improve governance maturity
- improve AI security readiness

---

# Final Perspective

Cloud providers secure the underlying cloud infrastructure.

Customers remain responsible for securing:
- AI workloads
- AI behaviour
- prompts
- governance workflows
- monitoring visibility
- operational security
- Responsible AI implementation

Enterprise AI resilience requires collaboration between:
- cloud-native security capabilities
- operational security teams
- governance stakeholders
- monitoring workflows
- AI safety controls

This project demonstrates how shared operational responsibility supports enterprise AI security engineering through layered governance, monitoring, operational visibility, and cloud-native security practices.