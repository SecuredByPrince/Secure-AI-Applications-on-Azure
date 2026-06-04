# KQL Queries

## Overview

This document defines the Kusto Query Language (KQL) analytics queries, AI-focused detection engineering workflows, behavioural monitoring logic, and threat hunting techniques implemented within the Secure AI Applications on Azure project.

Enterprise AI systems generate telemetry across:
- AI interactions
- prompt workflows
- orchestration services
- authentication systems
- monitoring platforms
- AI safety controls
- cloud-native integrations

Without telemetry analytics and behavioural detection logic, organizations may fail to detect:
- prompt injection attempts
- jailbreak behaviour
- suspicious AI usage
- unauthorized access
- anomalous token consumption
- operational misuse
- governance violations

This project demonstrates how KQL can improve enterprise AI security through:
- behavioural analytics
- telemetry correlation
- detection engineering
- anomaly detection
- operational investigations
- threat hunting
- governance visibility

The queries in this project are designed for use with:
- Microsoft Sentinel
- Azure Monitor
- Log Analytics
- Application Insights

The environment prioritizes:
- operational visibility
- behavioural analytics
- AI threat detection
- investigation readiness
- governance maturity
- enterprise AI resilience

---

# KQL Detection Objectives

The KQL analytics framework was designed around several operational and security goals.

| Objective | Purpose |
|---|---|
| Detect AI Threats | Identify suspicious AI behaviour |
| Improve Operational Visibility | Correlate AI telemetry |
| Improve Investigation Readiness | Support incident analysis |
| Improve Threat Hunting Capability | Enable proactive investigations |
| Improve Governance Maturity | Support operational oversight |
| Reduce Monitoring Blind Spots | Increase telemetry visibility |
| Improve AI Resilience | Strengthen layered defenses |
| Improve Detection Engineering | Support AI-focused analytics |

---

# Why KQL Matters for AI Security

Enterprise AI systems produce complex telemetry across:
- prompts
- outputs
- orchestration workflows
- authentication systems
- behavioural analytics

Traditional monitoring alone may not detect:
- adversarial prompting
- abnormal AI usage
- suspicious behavioural patterns
- orchestration abuse

KQL improves:
- telemetry analytics
- anomaly detection
- behavioural investigations
- AI threat visibility
- operational awareness

---

# KQL Data Sources

The environment centralizes telemetry from multiple sources.

| Source | Purpose |
|---|---|
| Azure OpenAI Logs | AI interaction telemetry |
| Application Insights | Behavioural analytics |
| Microsoft Entra ID Logs | Authentication visibility |
| Azure Monitor | Centralized telemetry |
| Defender for Cloud | Security posture visibility |
| Sentinel Analytics | Detection engineering |

---

# Prompt Injection Detection Queries

These queries help identify prompt manipulation attempts.

---

# Query 1 — Detect Suspicious Prompt Injection Keywords

```kusto
AppTraces
| where Message has_any (
    "ignore previous instructions",
    "bypass policy",
    "disable safety",
    "reveal system prompt",
    "forget previous instructions"
)
| project TimeGenerated, UserId, Message
| order by TimeGenerated desc
```

## Purpose

Detect suspicious prompts attempting to manipulate AI behaviour.

## Security Benefits

- improved adversarial visibility
- improved prompt injection detection

---

# Query 2 — Detect Repeated Adversarial Prompt Attempts

```kusto
AppTraces
| where Message has_any (
    "ignore instructions",
    "jailbreak",
    "override policy"
)
| summarize AttemptCount=count() by UserId, bin(TimeGenerated, 1h)
| where AttemptCount > 5
```

## Purpose

Identify repeated suspicious prompt behaviour.

## Security Benefits

- improved behavioural analytics
- improved anomaly detection

---

# Jailbreak Detection Queries

These queries help identify AI safety bypass attempts.

---

# Query 3 — Detect Jailbreak Behaviour Patterns

```kusto
AppTraces
| where Message has_any (
    "developer mode",
    "DAN",
    "unrestricted AI",
    "simulate illegal activity"
)
| project TimeGenerated, UserId, Message
```

## Purpose

Detect known jailbreak prompt patterns.

## Security Benefits

- improved AI safety visibility
- improved operational awareness

---

# Query 4 — Detect High-Risk Prompt Behaviour

```kusto
AppTraces
| summarize PromptCount=count() by UserId, bin(TimeGenerated, 15m)
| where PromptCount > 100
```

## Purpose

Detect unusually high AI interaction rates.

## Security Benefits

- improved abuse detection
- improved anomaly visibility

---

# Authentication Monitoring Queries

These queries help identify suspicious access behaviour.

---

# Query 5 — Detect Suspicious Login Locations

```kusto
SigninLogs
| summarize LoginCount=count() by UserPrincipalName, Location, bin(TimeGenerated, 1h)
| where LoginCount > 5
```

## Purpose

Monitor unusual authentication behaviour.

## Security Benefits

- improved identity visibility
- improved access monitoring

---

# Query 6 — Detect Failed Login Spikes

```kusto
SigninLogs
| where ResultType != 0
| summarize FailedAttempts=count() by UserPrincipalName, bin(TimeGenerated, 15m)
| where FailedAttempts > 10
```

## Purpose

Detect brute-force or suspicious login attempts.

## Security Benefits

- improved identity protection
- improved incident readiness

---

# AI Usage Analytics Queries

These queries monitor abnormal AI usage patterns.

---

# Query 7 — Detect Excessive Token Usage

```kusto
AppMetrics
| summarize TotalTokens=sum(TokensUsed) by UserId, bin(TimeGenerated, 1h)
| where TotalTokens > 100000
```

## Purpose

Detect abnormal AI resource consumption.

## Security Benefits

- improved operational visibility
- reduced abuse exposure

---

# Query 8 — Detect Unusual Request Spikes

```kusto
requests
| summarize RequestCount=count() by ClientIP, bin(TimeGenerated, 5m)
| where RequestCount > 500
```

## Purpose

Detect excessive request activity.

## Security Benefits

- improved anomaly detection
- improved abuse monitoring

---

# Governance Monitoring Queries

These queries improve governance and operational oversight.

---

# Query 9 — Detect RBAC Changes

```kusto
AuditLogs
| where OperationName contains "Add member to role"
| project TimeGenerated, InitiatedBy, TargetResources
```

## Purpose

Monitor privilege and access modifications.

## Security Benefits

- improved governance visibility
- improved accountability

---

# Query 10 — Detect Disabled Monitoring Services

```kusto
AzureActivity
| where OperationNameValue contains "Delete Diagnostic Setting"
| project TimeGenerated, Caller, ResourceGroup
```

## Purpose

Detect attempts to reduce operational visibility.

## Security Benefits

- improved monitoring integrity
- improved governance resilience

---

# AI Safety Monitoring Queries

These queries improve AI safety visibility.

---

# Query 11 — Detect Unsafe Output Indicators

```kusto
AppTraces
| where Message has_any (
    "malware",
    "exploit",
    "phishing",
    "credential theft"
)
| project TimeGenerated, UserId, Message
```

## Purpose

Detect potentially unsafe AI-generated content.

## Security Benefits

- improved AI safety monitoring
- improved operational oversight

---

# Query 12 — Detect AI Policy Violations

```kusto
AppTraces
| where SeverityLevel >= 3
| summarize Count=count() by UserId, bin(TimeGenerated, 1h)
```

## Purpose

Identify operational policy anomalies.

## Security Benefits

- improved governance visibility
- improved behavioural analytics

---

# Threat Hunting Queries

These queries support proactive investigations.

---

# Query 13 — Hunt for Suspicious Prompt Patterns

```kusto
AppTraces
| where Message matches regex @"(?i)(bypass|override|disable|ignore)"
| project TimeGenerated, UserId, Message
```

## Purpose

Proactively identify adversarial prompt behaviour.

## Security Benefits

- improved threat hunting capability
- improved adversarial visibility

---

# Query 14 — Hunt for Abnormal Usage Behaviour

```kusto
AppMetrics
| summarize AvgTokens=avg(TokensUsed) by UserId
| order by AvgTokens desc
```

## Purpose

Identify unusual AI consumption patterns.

## Security Benefits

- improved operational awareness
- improved anomaly investigations

---

# Query 15 — Hunt for Unauthorized Administrative Activity

```kusto
AuditLogs
| where OperationName contains "role"
| project TimeGenerated, InitiatedBy, OperationName
```

## Purpose

Identify suspicious privilege-related operations.

## Security Benefits

- improved governance monitoring
- improved identity investigations

---

# Detection Engineering Integration

The KQL framework supports enterprise AI detection engineering.

---

# Detection Areas

The project supports detection of:
- prompt injection
- jailbreak attempts
- suspicious authentication
- abnormal usage
- unsafe outputs
- governance anomalies

---

# Operational Benefits

- improved telemetry correlation
- improved behavioural analytics
- improved operational awareness

---

# Threat Hunting Integration

The environment supports proactive AI threat hunting.

---

# Threat Hunting Areas

Security teams investigate:
- suspicious prompts
- abnormal token usage
- orchestration abuse
- behavioural anomalies
- identity misuse

---

# Hunting Benefits

- improved AI resilience
- improved adversarial visibility
- improved investigation readiness

---

# Governance & Responsible AI Integration

The KQL framework supports Responsible AI governance through:
- operational transparency
- behavioural visibility
- accountability monitoring
- auditability

The implementation improves:
- governance maturity
- operational trust
- AI resilience

---

# Operational Security Considerations

The KQL analytics architecture prioritizes:
- behavioural visibility
- operational awareness
- governance maturity
- monitoring readiness
- AI resilience

The environment reflects how enterprise AI systems require advanced telemetry analytics and behavioural detection engineering.

---

# Governance & Compliance Alignment

The KQL analytics implementation aligns conceptually with:
- ISO/IEC 42001
- NIST AI RMF
- MITRE ATLAS
- CIS Controls
- Microsoft Responsible AI guidance

The objective is to demonstrate how telemetry analytics and behavioural detection support enterprise AI operational resilience and governance maturity.

---

# Validation Areas

The environment validates multiple telemetry analytics and detection engineering controls.

| Validation Area | Purpose |
|---|---|
| Query Validation | Ensure detection reliability |
| Telemetry Validation | Improve operational visibility |
| Threat Hunting Validation | Improve adversarial readiness |
| Behavioural Analytics Validation | Improve anomaly detection |
| Monitoring Validation | Improve governance visibility |
| Detection Validation | Improve incident readiness |

---

# Operational Security Outcomes

The KQL implementation improves:

## AI Threat Visibility

- improved behavioural monitoring
- improved anomaly detection

---

## Governance Maturity

- improved accountability
- improved operational oversight

---

## AI Operational Resilience

- reduced monitoring blind spots
- improved layered defenses
- improved investigation capability

---

## Detection Readiness

- improved threat hunting capability
- improved incident investigations
- improved operational awareness

---

# Strategic Importance

Enterprise AI systems increasingly require:
- telemetry analytics
- behavioural monitoring
- anomaly detection
- AI-focused detection engineering
- governance visibility
- operational investigations

Modern AI environments therefore require analytics platforms capable of:
- correlating AI telemetry
- identifying behavioural anomalies
- supporting governance oversight
- improving operational resilience

Telemetry analytics directly influence:
- enterprise trust
- governance maturity
- operational resilience
- AI security posture

---

# Final Perspective

Enterprise AI systems require advanced telemetry analytics and behavioural detection capabilities beyond traditional infrastructure monitoring.

Effective AI detection engineering requires:
- KQL analytics
- telemetry correlation
- behavioural monitoring
- governance integration
- operational investigations
- threat hunting capability
- monitoring readiness
- layered operational security

This project demonstrates how KQL analytics can improve enterprise AI resilience through behavioural detection engineering, telemetry analytics, operational investigations, threat hunting, and layered cloud-native AI security engineering practices.