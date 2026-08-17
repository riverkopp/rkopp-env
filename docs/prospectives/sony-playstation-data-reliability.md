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

- **Languages:** Go, Python, Bash, TypeScript, JavaScript, Java
- **Infrastructure as Code and Automation:** Terraform, Helm, Kubernetes CRDs, custom operator development, GitHub Actions, Docker, automated provisioning, lifecycle management, self-service infrastructure
- **Streaming and Data Platforms:** Apache Kafka, Warpstream, AWS MSK, compaction strategies, partition reassignment, consumer lag monitoring, backup and recovery, performance tuning, Elasticsearch, Cassandra
- **Kubernetes and Stateful Workloads:** StatefulSet operations, custom Go operators, control plane design, automated failover, rolling upgrades, GKE, Anthos
- **Cloud:** GCP, GKE, Cloud Storage, VPC, DNS, IAM, Azure, multi-cloud provisioning
- **Reliability and Observability:** Prometheus, Thanos, Grafana, PromQL, PagerDuty, ServiceNow, SLA threshold definition, incident response, root cause analysis, runbooks, disaster recovery
- **Security:** mTLS, PKI, certificate authority management, HashiCorp Vault, GCP KMS, IAM, encryption at rest and in transit

---

#### Experience

##### Principal Site Reliability Developer - Oracle
*Jul 2026 - Present* &nbsp;|&nbsp; Saint Paul, MN

- Contract work for the federal government.

##### Lead Software Engineer - Optum, UnitedHealth Group
*Sep 2022 - Jul 2026* &nbsp;|&nbsp; Saint Paul, MN

- Primary technical owner of KRM, a federated network of custom Go operators and backend services forming a two-tier control plane that automated provisioning, scaling, and lifecycle management of stateful streaming workloads on Kubernetes: 4,000+ Kafka brokers across 500+ clusters in multi-tenant environments, 100 billion+ messages per day, five-nines reliability, zero customer data loss.
- Wrote idiomatic, production-grade Go daily across modular operator packages, reconciliation loops, and monitoring controllers; co-authored all Terraform backing the platform across GKE, VPC, DNS, IAM, Vault, Cloud Storage, and CI/CD pipelines, making provisioning repeatable and self-service rather than manual.
- Owned day-to-day reliability of high-throughput, low-latency Kafka clusters at production scale: topic compaction configuration, rolling restarts, partition reassignment, consumer group lag monitoring, throughput and utilization tuning, broker certificate rotation, and regularly exercised disaster recovery.
- Developed observability for the data platform by extending Prometheus, Thanos, and Grafana with Go monitoring controllers and PromQL dashboards for on-call engineers and customers; defined utilization thresholds aligned to customer-facing SLAs with PagerDuty and ServiceNow routing, and led incident response and root cause analysis across the fleet.
- Led engineering and product ownership of the self-service provisioning portal (TypeScript, React, NextJS) in the enterprise developer platform, letting teams stand up production-grade streaming infrastructure in minutes and removing manual toil from the platform team.
- Co-led an 8-week sprint delivering net-new Warpstream cluster provisioning end-to-end: a Go operator built from scratch, all Terraform infrastructure, self-service API integration, and full observability; projected to reduce annual infrastructure costs by approximately 80%. Solely owned the preceding head-to-head Warpstream versus Apache Kafka benchmark behind that decision.
- Mentored junior engineers on distributed systems, Go, and operator patterns; captained a team of 6, conducted code reviews, and authored operational playbooks and runbooks used across the organization.

##### Software Engineer - Optum, UnitedHealth Group
*Jun 2020 - Aug 2022* &nbsp;|&nbsp; Saint Paul, MN

- Built provisioning pipelines and Kubernetes operator features in Go supporting thousands of streaming clients; managed 120 Azure VM ScaleSets through Terraform and GitOps, migrated customers off self-hosted and bespoke AWS MSK deployments, and assumed SRE on-call in 2021. Discovered undocumented Azure API rate limits through hands-on network investigation and paired that with a cost analysis that drove the platform's migration to GCP.

---

#### Education and Certifications

B.S. Software Engineering, St. Cloud State University, GPA 3.79 &nbsp;|&nbsp; Google Cloud Certified - Cloud Digital Leader (2025) &nbsp;|&nbsp; Optum AI Dojo: RAG system in Python (2025) &nbsp;|&nbsp; [IEEE publication](https://ieeexplore.ieee.org/document/9659615)
