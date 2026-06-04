# Threat Hunting Queries

## Overview

This document defines the AI-focused threat hunting methodology, behavioural investigation workflows, telemetry analytics logic, and proactive hunting queries implemented within the Secure AI Applications on Azure project.

Enterprise AI systems introduce behavioural attack surfaces that traditional threat hunting approaches may not fully address.

Large Language Models (LLMs) and AI orchestration platforms generate telemetry across:
- prompts
- responses
- orchestration workflows
- authentication systems
- AI safety controls
- behavioural analytics
- monitoring platforms
- cloud-native integrations

Without proactive hunting capabilities, organizations may fail to identify:
- stealthy prompt injection attempts
- advanced jailbreak activity
- suspicious orchestration workflows
- abnormal token consumption
- unauthorized access behaviour
- governance anomalies
- operational misuse
- monitoring tampering

This project demonstrates how AI-focused threat hunting can improve enterprise AI security through:
- behavioural analytics
- telemetry correlation
- operational investigations
- anomaly hunting
- adversarial analysis
- governance monitoring
- detection engineering

The queries in this project are designed for use with:
- Microsoft Sentinel
- Azure Monitor
- Log Analytics
- Application Insights

The environment prioritizes:
- operational visibility
- behavioural analytics
- adversarial visibility
- governance maturity
- proactive investigations
- enterprise AI resilience

---

# Threat Hunting Objectives

The threat hunting framework was designed around several operational and security goals.

| Objective | Purpose |
|---|---|
| Identify AI Threats Proactively | Detect adversarial behaviour early |
| Improve Operational Visibility | Correlate AI telemetry and workflows |
| Improve Behavioural Analytics | Detect anomalies and suspicious activity |
| Improve Governance Maturity | Support operational oversight |
| Improve Investigation Readiness | Enable proactive investigations |
| Improve AI Resilience | Strengthen layered defenses |
| Improve Threat Detection Coverage | Reduce monitoring blind spots |
| Improve Adversarial Visibility | Detect stealthy AI abuse |

---

# Why AI Threat Hunting Matters

Traditional threat hunting often focuses on:
- malware activity
- endpoint compromise
- network anomalies
- privilege escalation

Enterprise AI systems introduce additional behavioural risks because:
- prompts influence AI behaviour
- responses are dynamically generated
- adversarial manipulation is possible
- orchestration workflows are complex
- unsafe outputs may occur probabilistically

Without AI-focused hunting:
- stealthy prompt attacks may remain undetected
- behavioural anomalies may become normalized
- governance gaps may increase
- operational trust may decline

AI threat hunting improves:
- operational awareness
- behavioural visibility
- governance maturity
- AI resilience
- adversarial readiness

---

# Threat Hunting Architecture

The environment integrates proactive hunting workflows across multiple telemetry sources.

---

# Core Threat Hunting Components

| Component | Purpose |
|---|---|
| Microsoft Sentinel | Threat hunting and investigations |
| Azure Monitor | Telemetry collection |
| Log Analytics | Telemetry aggregation and analytics |
| Application Insights | Behavioural visibility |
| Defender for Cloud | Posture and workload visibility |
| KQL Analytics | Hunting queries and anomaly analysis |

---

# Threat Hunting Categories

The project implements several AI-focused hunting categories.

---

# Hunting Category 1 — Prompt Injection Hunting

## Objective

Proactively identify adversarial prompt behaviour.

---

# Query 1 — Hunt for Prompt Override Attempts

```kusto
AppTraces
| where Message has_any (
    "ignore previous instructions",
    "override system prompt",
    "disable safety",
    "reveal hidden instructions"
)
| project TimeGenerated, UserId, Message
| order by TimeGenerated desc
```

## Hunting Purpose

Identify attempts to manipulate AI behaviour or bypass protections.

## Security Benefits

- improved adversarial visibility
- improved prompt integrity monitoring

---

# Query 2 — Hunt for Repeated Suspicious Prompt Behaviour

```kusto
AppTraces
| where Message matches regex @"(?i)(ignore|override|bypass|disable)"
| summarize PromptAttempts=count() by UserId, bin(TimeGenerated, 1h)
| where PromptAttempts > 10
```

## Hunting Purpose

Identify users repeatedly attempting adversarial prompting.

## Security Benefits

- improved anomaly visibility
- improved operational awareness

---

# Hunting Category 2 — Jailbreak Hunting

## Objective

Identify attempts to bypass AI safety controls.

---

# Query 3 — Hunt for Jailbreak Terminology

```kusto
AppTraces
| where Message has_any (
    "DAN",
    "developer mode",
    "unrestricted AI",
    "simulate illegal activity",
    "pretend you are not restricted"
)
| project TimeGenerated, UserId, Message
```

## Hunting Purpose

Detect known jailbreak techniques and behavioural patterns.

## Security Benefits

- improved AI safety visibility
- improved behavioural analytics

---

# Query 4 — Hunt for Chained Jailbreak Attempts

```kusto
AppTraces
| where Message has_any ("ignore", "bypass", "simulate")
| summarize AttemptCount=count() by SessionId, UserId
| where AttemptCount > 20
```

## Hunting Purpose

Identify sustained adversarial interaction sessions.

## Security Benefits

- improved adversarial visibility
- improved investigation readiness

---

# Hunting Category 3 — AI Abuse Hunting

## Objective

Identify operational misuse of AI systems.

---

# Query 5 — Hunt for Excessive Token Usage

```kusto
AppMetrics
| summarize TotalTokens=sum(TokensUsed) by UserId, bin(TimeGenerated, 1h)
| where TotalTokens > 150000
```

## Hunting Purpose

Identify abnormal AI consumption behaviour.

## Security Benefits

- improved operational visibility
- reduced abuse exposure

---

# Query 6 — Hunt for High-Frequency Requests

```kusto
requests
| summarize RequestCount=count() by ClientIP, bin(TimeGenerated, 5m)
| where RequestCount > 1000
```

## Hunting Purpose

Detect automation abuse or suspicious request activity.

## Security Benefits

- improved anomaly detection
- improved operational awareness

---

# Hunting Category 4 — Identity & Access Hunting

## Objective

Identify suspicious AI access activity.

---

# Query 7 — Hunt for Suspicious Login Behaviour

```kusto
SigninLogs
| summarize LoginAttempts=count() by UserPrincipalName, IPAddress, bin(TimeGenerated, 1h)
| where LoginAttempts > 25
```

## Hunting Purpose

Identify suspicious authentication patterns.

## Security Benefits

- improved identity visibility
- improved access monitoring

---

# Query 8 — Hunt for Failed Login Spikes

```kusto
SigninLogs
| where ResultType != 0
| summarize FailedAttempts=count() by UserPrincipalName, bin(TimeGenerated, 15m)
| where FailedAttempts > 15
```

## Hunting Purpose

Detect potential brute-force or compromised account activity.

## Security Benefits

- improved incident readiness
- improved identity protection

---

# Query 9 — Hunt for Privileged Role Changes

```kusto
AuditLogs
| where OperationName contains "role"
| project TimeGenerated, InitiatedBy, TargetResources
```

## Hunting Purpose

Identify suspicious governance or privilege modifications.

## Security Benefits

- improved governance visibility
- improved accountability

---

# Hunting Category 5 — Governance & Monitoring Hunting

## Objective

Identify attempts to weaken operational visibility.

---

# Query 10 — Hunt for Diagnostic Setting Deletions

```kusto
AzureActivity
| where OperationNameValue contains "Delete Diagnostic Setting"
| project TimeGenerated, Caller, ResourceGroup
```

## Hunting Purpose

Detect attempts to disable monitoring visibility.

## Security Benefits

- improved monitoring integrity
- improved operational resilience

---

# Query 11 — Hunt for Suspicious Configuration Changes

```kusto
AzureActivity
| where OperationNameValue contains "Write"
| summarize ChangeCount=count() by Caller, ResourceGroup, bin(TimeGenerated, 1h)
| where ChangeCount > 50
```

## Hunting Purpose

Identify unusual operational modification behaviour.

## Security Benefits

- improved governance monitoring
- improved anomaly visibility

---

# Hunting Category 6 — Unsafe Output Hunting

## Objective

Identify potentially harmful AI-generated content.

---

# Query 12 — Hunt for Unsafe AI Responses

```kusto
AppTraces
| where Message has_any (
    "phishing",
    "credential theft",
    "malware",
    "exploit",
    "social engineering"
)
| project TimeGenerated, UserId, Message
```

## Hunting Purpose

Detect potentially unsafe AI-generated content.

## Security Benefits

- improved AI safety visibility
- improved governance oversight

---

# Query 13 — Hunt for Repeated AI Policy Violations

```kusto
AppTraces
| where SeverityLevel >= 3
| summarize ViolationCount=count() by UserId, bin(TimeGenerated, 1h)
| where ViolationCount > 10
```

## Hunting Purpose

Identify users repeatedly triggering AI safety controls.

## Security Benefits

- improved behavioural analytics
- improved operational awareness

---

# Hunting Category 7 — Orchestration Workflow Hunting

## Objective

Identify suspicious AI orchestration activity.

---

# Query 14 — Hunt for Abnormal Workflow Behaviour

```kusto
AppDependencies
| summarize DependencyCount=count() by Target, bin(TimeGenerated, 15m)
| where DependencyCount > 1000
```

## Hunting Purpose

Identify suspicious orchestration activity or abuse.

## Security Benefits

- improved workflow visibility
- improved operational resilience

---

# Query 15 — Hunt for Unusual Service Communication

```kusto
AppDependencies
| where Success == false
| summarize FailureCount=count() by Target, bin(TimeGenerated, 30m)
| where FailureCount > 100
```

## Hunting Purpose

Identify operational instability or suspicious communication patterns.

## Security Benefits

- improved diagnostics visibility
- improved investigation readiness

---

# Threat Hunting Methodology

The environment applies several hunting principles.

---

# Behavioural Analytics

The hunting model focuses on:
- anomalies
- suspicious patterns
- adversarial behaviour
- operational inconsistencies

---

# Telemetry Correlation

The environment correlates telemetry across:
- prompts
- authentication logs
- orchestration workflows
- monitoring platforms
- governance events

---

# Adversarial Visibility

The project assumes attackers may:
- evade simple detections
- manipulate prompts subtly
- abuse orchestration workflows
- target operational blind spots

---

# Monitoring & Detection Integration

Threat hunting integrates directly into the monitoring architecture.

---

# Microsoft Sentinel Integration

Used for:
- centralized investigations
- hunting workflows
- behavioural analytics
- incident visibility

---

# Log Analytics Integration

Used for:
- telemetry aggregation
- operational investigations
- analytics correlation

---

# Application Insights Integration

Used for:
- behavioural telemetry
- AI interaction visibility
- diagnostics analytics

---

# Defender for Cloud Integration

Used for:
- posture visibility
- governance analytics
- configuration monitoring

---

# Governance & Responsible AI Integration

Threat hunting supports Responsible AI governance through:
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

The threat hunting architecture prioritizes:
- behavioural visibility
- operational awareness
- governance maturity
- adversarial readiness
- AI resilience

The environment reflects how enterprise AI systems require continuous proactive investigations and behavioural analytics.

---

# Governance & Compliance Alignment

The threat hunting framework aligns conceptually with:
- ISO/IEC 42001
- NIST AI RMF
- MITRE ATLAS
- CIS Controls
- Microsoft Responsible AI guidance

The objective is to demonstrate how proactive AI threat hunting supports enterprise operational resilience and governance maturity.

---

# Validation Areas

The environment validates multiple threat hunting and analytics controls.

| Validation Area | Purpose |
|---|---|
| Hunting Query Validation | Ensure investigation reliability |
| Telemetry Validation | Improve operational visibility |
| Behavioural Analytics Validation | Improve anomaly detection |
| Monitoring Validation | Improve governance visibility |
| Investigation Validation | Improve incident readiness |
| Detection Validation | Improve adversarial visibility |

---

# Operational Security Outcomes

The threat hunting implementation improves:

## AI Threat Visibility

- improved behavioural monitoring
- improved anomaly investigations

---

## Governance Maturity

- improved accountability
- improved operational oversight

---

## AI Operational Resilience

- reduced monitoring blind spots
- improved layered defenses
- improved adversarial readiness

---

## Investigation Readiness

- improved proactive investigations
- improved threat hunting capability
- improved operational awareness

---

# Strategic Importance

Enterprise AI systems increasingly require:
- proactive behavioural investigations
- AI-focused threat hunting
- telemetry analytics
- operational investigations
- governance visibility
- adversarial readiness

Modern AI environments therefore require hunting frameworks capable of:
- identifying subtle behavioural anomalies
- correlating AI telemetry
- supporting governance oversight
- improving operational resilience

Threat hunting directly influences:
- enterprise trust
- governance maturity
- operational resilience
- AI security posture

---

# Final Perspective

Enterprise AI systems require proactive behavioural investigations beyond traditional infrastructure threat hunting approaches.

Effective AI threat hunting requires:
- behavioural analytics
- telemetry correlation
- governance integration
- operational investigations
- adversarial visibility
- monitoring readiness
- AI-focused hunting techniques
- layered operational security

This project demonstrates how AI-focused threat hunting can improve enterprise AI resilience through behavioural analytics, telemetry investigations, operational visibility, adversarial monitoring, and layered cloud-native AI security engineering practices.