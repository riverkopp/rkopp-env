---
pdf_options:
  margin:
    top: 6mm
    bottom: 6mm
    left: 12mm
    right: 12mm
---

### Caleb Kopp - Principal Site Reliability Developer

Saint Paul, MN &nbsp;|&nbsp; 507-299-0445 &nbsp;|&nbsp; followtheriversong@proton.me &nbsp;|&nbsp; linkedin.com/in/calebmkopp

---

#### Skills

- **Event Streaming:** Apache Kafka, Warpstream, AWS MSK, Confluent Schema Registry, broker operations, compaction strategies, partition reassignment, replication, consumer group management, throughput and latency tuning
- **Distributed Systems and Data Stores:** multi-tenant platform architecture, control plane design, high availability, capacity planning, disaster recovery, performance profiling, production troubleshooting, Elasticsearch, Cassandra, Oracle Big Data Service
- **Languages:** Go, Python, Java, Bash, TypeScript
- **Kubernetes and Infrastructure as Code:** custom Go operators, CRDs, StatefulSet operations, lifecycle automation, rolling upgrades, safe rollout and environment promotion, Helm, GKE, Anthos, Terraform, GitHub Actions, Docker, CI/CD, HashiCorp Vault
- **Observability and Operations:** Prometheus, Thanos, Grafana, PromQL, PagerDuty, ServiceNow, SLA threshold definition, incident response, root cause analysis, runbooks and adoption playbooks, 24x7 on-call
- **Networking and Security:** REST APIs, SSL/TLS, mTLS, PKI, certificate authority management, VPC, DNS, IAM, KMS, secure coding, vulnerability remediation

---

#### Experience

##### Principal Site Reliability Developer - Oracle
*Jul 2026 - Present* &nbsp;|&nbsp; Saint Paul, MN

- Federal contract work with enterprise Oracle Big Data Service (BDS).

##### Senior Software Engineer - Optum, UnitedHealth Group
*Sep 2022 - Jul 2026* &nbsp;|&nbsp; Saint Paul, MN

- Primary technical owner of a multi-tenant Apache Kafka platform serving thousands of internal customers: 4,000+ brokers across 500+ clusters, 100 billion+ messages per day, five-nines availability, zero customer data loss over the platform's history. Built on a two-tier control plane of custom Go operators and CRDs, with Elasticsearch as the shared state store guaranteeing full state recovery if either layer failed.
- Owned broker-level operations and performance tuning at production scale: topic compaction configuration, partition reassignment, replication and rolling restarts, consumer group lag, throughput and latency optimization, certificate rotation, and regularly exercised disaster recovery.
- Solely designed and executed a head-to-head performance benchmark of two streaming architectures, standing up a bespoke environment from scratch, rebuilding the methodology after the first results were challenged, and presenting findings to an external vendor's engineering team and internal leadership. Results directly decided which architecture went to production.
- Defined safe rollout and compatibility practices: versioned CRD contracts decoupling the product surface from operator internals, environment promotion through CI/CD, and zero-downtime migrations of 300 customer namespaces onto CRD-backed provisioning and 50 Terraform and Helm deployments from OpenShift to Anthos.
- Drove observability and reliability standards by extending Prometheus, Thanos, and Grafana with Go monitoring controllers and PromQL dashboards; defined utilization thresholds aligned to customer-facing SLAs, led incident response and root cause analysis, and authored the runbooks and adoption playbooks used across the organization.
- Led cross-team initiatives ahead of any established golden path, rebuilding the container supply chain onto hardened base images and resolving hundreds of cloud security findings in days to unblock the wider platform organization; captained a team of 6, conducted code reviews, mentored engineers on distributed systems and Go, and interviewed early-career candidates each hiring cycle.

##### Software Engineer - Optum, UnitedHealth Group
*Jun 2020 - Aug 2022* &nbsp;|&nbsp; Saint Paul, MN

- Supported on-prem Cassandra and Elasticsearch clusters offered as a service, handling on-call troubleshooting and the operational quirks of running them at scale; built Go operator features and provisioning pipelines for thousands of streaming clients, managed 120 Azure VM ScaleSets through Terraform and GitOps, and migrated customers off bespoke AWS MSK deployments. Assumed SRE on-call in 2021, and discovered undocumented Azure API rate limits through network investigation that drove the platform's migration to GCP.

---

#### Education and Certifications

B.S. Software Engineering, St. Cloud State University, GPA 3.79 &nbsp;|&nbsp; Google Cloud Certified - Cloud Digital Leader (2025) &nbsp;|&nbsp; Optum AI Dojo: RAG system in Python (2025) &nbsp;|&nbsp; [IEEE publication](https://ieeexplore.ieee.org/document/9659615)
