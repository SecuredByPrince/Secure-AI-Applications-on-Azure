# Detection Engineering

## Overview

This document defines the detection engineering strategy, monitoring workflows, telemetry visibility, and threat detection capabilities implemented within the Secure AI Applications on Azure project.

The purpose of detection engineering in this project is to:
- improve operational visibility
- detect suspicious AI activity
- identify adversarial behaviour
- monitor AI workloads
- improve incident readiness
- strengthen AI security operations
- support threat hunting
- improve enterprise AI resilience

Modern AI systems introduce dynamic behavioural attack surfaces that require monitoring approaches beyond traditional infrastructure and application logging.

AI systems may be abused through:
- prompt injection
- jailbreak attempts
- prompt leakage
- malicious prompting
- excessive usage patterns
- unsafe output generation
- adversarial prompting
- unauthorized API usage

This project demonstrates how enterprise AI workloads can be integrated into modern security operations workflows using:
- Microsoft Sentinel
- Azure Monitor
- Log Analytics
- Application Insights
- Kusto Query Language (KQL)

The implementation focuses on operational AI visibility and detection engineering rather than only preventive security controls.

---

# Detection Engineering Objectives

The project was designed around several core operational detection objectives.

| Objective | Purpose |
|---|---|
| Improve AI Visibility | Increase telemetry awareness |
| Detect Suspicious AI Activity | Identify malicious behaviour |
| Improve Threat Hunting | Support investigations |
| Improve Operational Readiness | Improve detection workflows |
| Improve AI Abuse Detection | Identify misuse scenarios |
| Improve Monitoring Capability | Strengthen operational awareness |
| Improve Incident Visibility | Improve response readiness |
| Reduce Detection Blind Spots | Improve AI telemetry coverage |

---

# Why Detection Engineering Matters for AI

Traditional monitoring strategies were primarily designed around:
- endpoints
- servers
- applications
- identities
- networks

AI systems behave differently.

Large Language Models generate dynamic responses based on:
- prompts
- contextual instructions
- user interaction patterns
- behavioural inference logic

As a result, attackers may attempt to abuse AI systems through:
- crafted prompts
- adversarial chaining
- contextual manipulation
- prompt injection
- unsafe prompting
- malicious AI usage

Many of these attacks may not trigger traditional infrastructure alerts.

AI systems therefore require:
- behavioural monitoring
- telemetry analysis
- prompt visibility
- anomaly detection
- AI-specific detection logic

---

# Detection Architecture

The project integrates multiple monitoring and detection components.

## Core Detection Components

- Microsoft Sentinel
- Azure Monitor
- Azure Log Analytics
- Application Insights
- Azure OpenAI telemetry
- KQL analytics
- Security alerting

---

# Detection Workflow

The detection workflow follows several operational stages.

## AI Activity Generation

AI interactions generate:
- prompts
- responses
- API calls
- telemetry events
- authentication events

↓

## Telemetry Collection

Logs and telemetry are collected through:
- Azure Monitor
- Application Insights
- Log Analytics

↓

## Analytics & Correlation

Microsoft Sentinel and KQL queries analyze:
- behavioural anomalies
- suspicious prompts
- unusual activity patterns
- operational indicators

↓

## Detection & Alerting

Detection logic generates:
- alerts
- incidents
- operational investigations

↓

## Threat Hunting & Investigation

Security analysts investigate:
- AI abuse indicators
- anomalous interactions
- suspicious activity patterns

---

# Core Detection Areas

The project focuses on several AI-specific detection areas.

---

# Prompt Injection Detection

## Objective

Detect attempts to manipulate AI prompts or override model instructions.

## Indicators Monitored

- suspicious prompt patterns
- instruction override attempts
- contextual manipulation
- unusual prompt sequences

## Potential Risks

- policy bypass
- unsafe outputs
- prompt leakage
- AI manipulation

## Detection Methods

- KQL queries
- telemetry analysis
- AI activity monitoring

---

# Jailbreak Detection

## Objective

Detect attempts to bypass AI safety controls.

## Indicators Monitored

- unsafe prompting behaviour
- policy bypass attempts
- repeated manipulation attempts
- suspicious response generation

## Potential Risks

- harmful output generation
- unsafe AI behaviour
- governance failures

## Detection Methods

- Sentinel analytics
- AI content filtering alerts
- behavioural analysis

---

# Prompt Leakage Detection

## Objective

Detect attempts to retrieve hidden prompts or embedded instructions.

## Indicators Monitored

- prompt extraction attempts
- hidden instruction requests
- suspicious contextual probing

## Potential Risks

- information disclosure
- operational exposure
- AI manipulation

## Detection Methods

- prompt telemetry monitoring
- suspicious activity correlation

---

# Excessive Usage Detection

## Objective

Detect excessive or abnormal AI usage patterns.

## Indicators Monitored

- excessive API requests
- abnormal token usage
- repetitive prompt behaviour
- denial-of-wallet indicators

## Potential Risks

- increased operational costs
- service degradation
- abuse scenarios

## Detection Methods

- usage analytics
- anomaly monitoring
- telemetry analysis

---

# Unauthorized Access Detection

## Objective

Detect unauthorized or suspicious access to AI services.

## Indicators Monitored

- abnormal authentication activity
- suspicious API access
- privilege misuse
- failed authentication patterns

## Potential Risks

- unauthorized AI usage
- privilege abuse
- operational compromise

## Detection Methods

- authentication monitoring
- Sentinel analytics
- RBAC visibility

---

# Unsafe Output Detection

## Objective

Identify potentially unsafe AI-generated responses.

## Indicators Monitored

- harmful outputs
- policy-violating responses
- unsafe recommendations
- suspicious content generation

## Potential Risks

- reputational damage
- governance failures
- operational misuse

## Detection Methods

- AI content filtering
- telemetry analysis
- operational review workflows

---

# Monitoring & Telemetry Visibility

The project emphasizes operational telemetry visibility.

## Telemetry Sources

| Source | Purpose |
|---|---|
| Azure Monitor | Central monitoring |
| Application Insights | AI telemetry visibility |
| Log Analytics | Log collection and analytics |
| Sentinel | Correlation and alerting |
| AI Content Safety | Unsafe output visibility |

---

# KQL Detection Engineering

Kusto Query Language (KQL) is used extensively for:
- threat hunting
- anomaly detection
- operational analysis
- AI telemetry investigation
- behavioural analytics

---

# Example Detection Areas

The project includes KQL-focused detection workflows for:
- suspicious prompt behaviour
- excessive usage patterns
- AI abuse indicators
- anomalous API activity
- suspicious authentication events
- telemetry anomalies

---

# Threat Hunting

The project integrates threat hunting workflows into AI monitoring operations.

## Threat Hunting Objectives

- identify suspicious AI activity
- investigate anomalies
- improve visibility
- validate alerts
- identify operational weaknesses

## Hunting Areas

- prompt manipulation
- usage anomalies
- suspicious authentication
- telemetry irregularities
- AI abuse indicators

---

# Microsoft Sentinel Integration

Microsoft Sentinel is used to:
- centralize monitoring
- correlate telemetry
- generate incidents
- support investigations
- improve operational visibility

---

# Sentinel Functions Used

- analytics rules
- alert generation
- incident management
- KQL hunting queries
- investigation workflows

---

# Detection Engineering Challenges

AI systems create unique detection challenges because:
- behaviour is dynamic
- prompts vary continuously
- adversarial techniques evolve rapidly
- model responses are probabilistic

As a result:
- static signatures may be insufficient
- behavioural analysis becomes important
- telemetry visibility becomes critical

---

# Red Teaming Integration

AI red teaming activities directly support detection engineering.

Adversarial testing validates:
- telemetry visibility
- alert generation
- monitoring quality
- investigation workflows

This helps improve:
- operational readiness
- alert tuning
- detection visibility

---

# Governance Integration

Detection engineering supports Responsible AI governance by improving:
- accountability
- operational visibility
- auditability
- oversight capability

Monitoring and telemetry help organisations:
- investigate incidents
- identify unsafe behaviour
- improve governance maturity

---

# Operational Security Outcomes

The detection engineering implementation improves:

## Operational Visibility

- improved AI telemetry awareness
- improved monitoring capability

---

## Threat Visibility

- improved adversarial detection
- improved anomaly analysis

---

## Investigation Capability

- improved threat hunting
- improved incident analysis

---

## Governance Maturity

- improved audit visibility
- improved accountability
- improved operational oversight

---

# Governance & Compliance Alignment

The detection engineering approach aligns with:
- ISO/IEC 42001
- NIST AI RMF
- MITRE ATLAS
- CIS Controls
- Microsoft Security Benchmark

The objective is to demonstrate how operational AI visibility supports enterprise governance and security maturity.

---

# Strategic Importance

Detection engineering is becoming critical for enterprise AI security because prevention alone is insufficient.

Modern AI systems require:
- continuous monitoring
- telemetry visibility
- behavioural analysis
- adversarial awareness
- operational investigations

Detection engineering helps organisations:
- identify threats earlier
- improve operational readiness
- strengthen governance
- improve AI resilience

---

# Final Perspective

Enterprise AI systems require operational visibility beyond traditional infrastructure monitoring.

AI security requires:
- telemetry collection
- monitoring
- detection engineering
- threat hunting
- incident response
- adversarial testing
- governance integration

This project demonstrates how enterprise AI detection engineering can improve operational resilience through layered monitoring, telemetry visibility, and cloud-native security operations practices.