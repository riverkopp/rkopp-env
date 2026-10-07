---
pdf_options:
  scale: 0.95
  margin:
    top: 6mm
    bottom: 6mm
    left: 12mm
    right: 12mm
---

### River Kopp - Principal Site Reliability Developer

Saint Paul, MN &nbsp;|&nbsp; 507-299-0445 &nbsp;|&nbsp; followtheriversong@proton.me &nbsp;|&nbsp; linkedin.com/in/rivermkopp

---

#### Skills

- **Distributed Systems:** multi-tenant control plane design, Go operators and CRDs, shared state stores and state recovery, high availability, disaster recovery, benchmarking, production debugging
- **Streaming and Storage:** WarpStream, Apache Kafka, object storage (GCS), Confluent Schema Registry, Elasticsearch, compaction, partition reassignment, replication, consumer group lag, throughput and latency tuning
- **Languages:** Go, Python, TypeScript, JavaScript, Java, Bash
- **Cloud and Infrastructure:** GCP, Azure, Kubernetes, GKE, Docker, Helm, Terraform, VPC, DNS, IAM, GitHub Actions, CI/CD
- **Operations:** on-call rotation, incident response, root cause analysis, SLA thresholds, Prometheus, Thanos, Grafana, PromQL, PagerDuty, runbooks
- **Security and Frontend:** mTLS, PKI, certificate authority management, KMS, HashiCorp Vault; React, NextJS, self-service developer portals

---

#### Experience

##### Principal Site Reliability Developer - Oracle
*Jul 2026 - Present* &nbsp;|&nbsp; Saint Paul, MN

- Federal contract work with enterprise Oracle Big Data Service (BDS).

##### Lead Software Engineer - Optum, UnitedHealth Group
*May 2026 - Jul 2026* &nbsp;|&nbsp; Saint Paul, MN

- Promoted to Lead to take WarpStream from beta to a supported production service. Owned the Go operator, all Terraform infrastructure (GCS, VPC, DNS, IAM), self-service provisioning integration, and observability. Delivered to the platform's two largest GCP customers, projected to cut their annual Kafka infrastructure costs by approximately 80%. Authored the runbooks and knowledge-transfer documentation for the handoff to the team.

##### Senior Software Engineer - Optum, UnitedHealth Group
*Sep 2022 - May 2026* &nbsp;|&nbsp; Saint Paul, MN

- Primary technical owner of a multi-tenant Apache Kafka platform: 4,000+ brokers across 800+ clusters, 100 billion+ messages per day, five-nines reliability, and zero customer data loss over the platform's history. Built on a two-tier control plane of custom Go operators and CRDs, with Elasticsearch as the shared state store guaranteeing full state recovery if either layer failed.
- Co-led an 8-week sprint delivering WarpStream cluster provisioning across the full stack. The platform provisions everything through custom operators rather than Helm installs, so in place of the vendor Helm chart, wrote a net-new Go operator that works with the WarpStream APIs directly, connecting Agents to Cloud Storage buckets, API registrations, and Agent configs, alongside provisioning API changes and operator extensions for net-new resource kinds. Shipped as beta to the platform's two largest GCP customers.
- Solely designed and ran the WarpStream vs Apache Kafka benchmark in GKE that drove the investment: built the environment from scratch, rebuilt the methodology (consumer load, end-to-end latency, Agent autoscaling) after first results were challenged, and presented findings to Confluent engineering and Optum leadership.
- Owned broker-level operations and performance at scale: compaction configuration, partition reassignment, rolling restarts, consumer group lag, throughput and latency tuning, and regularly exercised disaster recovery. Maintained the platform's certificate authority, generating and rotating thousands of mTLS client certificates, plus VPC network security and DNS for broker endpoints.
- Took regular on-call shifts for the platform; extended Prometheus, Thanos, and Grafana with Go monitoring controllers and PromQL dashboards, defined utilization thresholds aligned to customer-facing SLAs, and led incident response and root cause analysis.
- Lead engineer and de facto product owner of the self-service Kafka developer portal (TypeScript, React, NextJS); captained a team of 6, wrote user stories, conducted code reviews, and mentored engineers on distributed systems, Go, and operator patterns.

##### Software Engineer - Optum, UnitedHealth Group
*Jun 2020 - Aug 2022* &nbsp;|&nbsp; Saint Paul, MN

- Built Go operator features and provisioning pipelines for thousands of Kafka clients, managed 120 Azure VM ScaleSets through Terraform and GitOps, and migrated 300 customer namespaces to CRD-backed provisioning with minimal downtime. Assumed SRE on-call in 2021, and discovered undocumented Azure API rate limits through network traffic investigation, which drove the platform's move to GCP.

---

#### Education and Certifications

B.S. Software Engineering, St. Cloud State University, GPA 3.79 &nbsp;|&nbsp; Google Cloud Digital Leader (2025) &nbsp;|&nbsp; Optum AI Dojo: RAG system in Python (2025) &nbsp;|&nbsp; [IEEE publication](https://ieeexplore.ieee.org/document/9659615)
