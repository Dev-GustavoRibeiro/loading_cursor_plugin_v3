# Non-functional requirements (NFRs) — template

> Primary: **English** + **PT —** blocks per section. Prefer **measurable** statements.  
> **PT —** Preferir afirmações **mensuráveis** (números, SLOs), não adjetivos vagos.

## Document control

| Field | Value |
|-------|--------|
| System | |
| Environment(s) | prod / staging / dev |
| Author | |
| Last updated | |

## 1. Performance and scalability

| ID | Requirement | Metric | Measurement method |
|----|---------------|--------|---------------------|
| NFR-P1 | API latency (p95) | < X ms | APM / load test |
| NFR-P2 | Throughput | X rps | Load test |

**PT —** Desempenho: latência, débito, limites de dados — sempre que possível com números.

## 2. Availability and reliability

| ID | Requirement | Target |
|----|---------------|--------|
| NFR-A1 | Uptime | 99.X% monthly |
| NFR-A2 | RTO / RPO | … |

**PT —** Disponibilidade e recuperação (RTO/RPO).

## 3. Security and privacy

| ID | Requirement | Notes |
|----|---------------|-------|
| NFR-S1 | AuthN / AuthZ model | |
| NFR-S2 | Data classification | public / internal / confidential |
| NFR-S3 | Encryption at rest / in transit | |
| NFR-S4 | Audit logging | |

**PT —** Segurança e privacidade: alinhamento com `security-architect` e políticas da empresa.

## 4. Maintainability and operability

| ID | Requirement | Notes |
|----|---------------|-------|
| NFR-M1 | Observable (logs, metrics, traces) | |
| NFR-M2 | Runbooks for top incidents | |
| NFR-M3 | Config via env / secrets manager | |

**PT —** Operação: observabilidade, runbooks, configuração segura.

## 5. Compliance and legal (if applicable)

| ID | Requirement | Reference |
|----|---------------|-----------|
| NFR-C1 | GDPR / LGPD handling | |
| NFR-C2 | Retention periods | |

**PT —** Conformidade legal quando aplicável (ex.: LGPD no Brasil).

## 6. Accessibility and UX quality (if user-facing)

| ID | Requirement | Standard |
|----|---------------|----------|
| NFR-U1 | WCAG | 2.1 AA target |

**PT —** Acessibilidade e qualidade de UX para produtos com interface.

## 7. Trade-offs and exclusions

Document conscious decisions **not** to meet certain NFRs yet.

**PT —** Compromissos explícitos: o que não vamos fazer já e porquê.
