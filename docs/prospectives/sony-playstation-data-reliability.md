---
pdf_options:
  margin:
    top: 6mm
    bottom: 6mm
    left: 12mm
    right: 12mm
---

### Caleb Kopp - Principal Site Reliability Developer

Saint Paul, MN &nbsp;|&nbsp; 507-299-0445 &nbsp;|&nbsp; caleb.m.kopp@outlook.com &nbsp;|&nbsp; linkedin.com/in/calebmkopp

---

#### Skills

- **Languages:** Go, Python, Bash, TypeScript, Java
- **Data Platforms:** Apache Kafka, AWS MSK, Warpstream, Elasticsearch, Cassandra, Oracle Big Data Service, compaction strategies, partition reassignment, backup and recovery, performance tuning
- **Stateful Workloads on Kubernetes:** custom Go operators, CRDs, StatefulSet operations, lifecycle automation, automated failover, rolling upgrades, Helm, GKE, Anthos
- **Infrastructure as Code and Automation:** Terraform, self-service provisioning, automation frameworks, operational tooling, GitHub Actions, Docker, CI/CD
- **Reliability Engineering:** SLA threshold definition, incident response, root cause analysis, runbooks and operational playbooks, disaster recovery, 24x7 on-call, Prometheus, Thanos, Grafana, PromQL, PagerDuty, ServiceNow
- **Cloud and Security:** GCP, GKE, Cloud Storage, VPC, DNS, IAM, Azure, mTLS, PKI, HashiCorp Vault, KMS
- **AI and GenAI:** RAG systems in Python, GenAI fundamentals, reasoning models

---

#### Experience

##### Principal Site Reliability Developer - Oracle
*Jul 2026 - Present* &nbsp;|&nbsp; Saint Paul, MN

- Federal contract work with enterprise Oracle Big Data Service (BDS).

##### Senior Software Engineer - Optum, UnitedHealth Group
*Sep 2022 - Jul 2026* &nbsp;|&nbsp; Saint Paul, MN

- Primary technical owner of a two-tier control plane of custom Go operators automating provisioning, scaling, and lifecycle management of stateful data workloads on Kubernetes: 4,000+ Kafka brokers across 500+ clusters, 100 billion+ messages per day, five-nines availability, zero customer data loss. Elasticsearch backed the control plane as its shared state store and single source of truth, guaranteeing full state recovery if either layer went down.
- Wrote performant, idiomatic Go daily across modular operator packages, reconciliation loops, and monitoring controllers; co-authored all Terraform behind the platform across GKE, VPC, DNS, IAM, Vault, Cloud Storage, and CI/CD, making provisioning repeatable, automated, and self-service rather than manual.
- Owned day-to-day reliability of high-throughput, low-latency streaming clusters: topic compaction configuration, rolling restarts, partition reassignment, consumer group lag monitoring, throughput and utilization tuning, broker certificate rotation, backup and recovery, and regularly exercised disaster recovery.
- Built the self-service platform that let engineering teams across the enterprise provision production-grade data infrastructure in minutes, cutting manual toil for the platform team and removing us as a bottleneck for product delivery.
- Developed observability for the data platform by extending Prometheus, Thanos, and Grafana with Go monitoring controllers and PromQL dashboards for on-call engineers and customers; defined utilization and performance thresholds aligned to customer-facing SLAs with PagerDuty and ServiceNow routing, led incident response and root cause analysis, and drove permanent automated fixes back into the operators.
- Co-led an 8-week sprint delivering net-new Warpstream cluster provisioning end-to-end: a Go operator built from scratch, all Terraform infrastructure, self-service API integration, and full observability; projected to cut annual infrastructure costs by approximately 80%. Solely owned the head-to-head Warpstream versus Apache Kafka benchmark behind that decision.
- Mentored engineers on distributed systems, Go, and operator patterns; captained a team of 6, conducted code reviews, and authored the operational playbooks and runbooks used across the organization.

##### Software Engineer - Optum, UnitedHealth Group
*Jun 2020 - Aug 2022* &nbsp;|&nbsp; Saint Paul, MN

- Supported on-prem Cassandra and Elasticsearch clusters offered as a service, handling on-call troubleshooting and the operational quirks of running them at scale; built Go operator features and provisioning pipelines for thousands of streaming clients, managed 120 Azure VM ScaleSets through Terraform and GitOps, and migrated customers off self-hosted and bespoke AWS MSK deployments. Assumed SRE on-call in 2021, and discovered undocumented Azure API rate limits through hands-on network investigation that drove the platform's migration to GCP.

---

#### Education and Certifications

B.S. Software Engineering, St. Cloud State University, GPA 3.79 &nbsp;|&nbsp; Google Cloud Certified - Cloud Digital Leader (2025) &nbsp;|&nbsp; Optum AI Dojo: built a RAG system from scratch in Python (2025) &nbsp;|&nbsp; [IEEE publication](https://ieeexplore.ieee.org/document/9659615)
