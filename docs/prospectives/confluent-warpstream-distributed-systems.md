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

- **Languages:** Go, Python, Bash, TypeScript, Java
- **Streaming and Storage:** WarpStream, Apache Kafka, AWS MSK, object-storage-backed streaming, broker and agent operations, compaction strategies, partition reassignment, replication, consumer group management, Elasticsearch, Cassandra
- **Distributed Systems:** multi-tenant control plane design, custom Go operators and CRDs, high availability, capacity planning, performance profiling, disaster recovery, production debugging across microservices and containers
- **Cloud and Infrastructure:** GCP, Azure, AWS, GKE, Anthos, Kubernetes, Terraform, Helm, Docker, GitHub Actions, CI/CD, Cloud Storage, VPC, DNS, IAM
- **Operations:** 24x7 on-call, incident response, root cause analysis, SLA threshold definition, runbooks and operational playbooks, Prometheus, Thanos, Grafana, PromQL, PagerDuty
- **Frontend:** TypeScript, React, NextJS, self-service developer console

---

#### Experience

##### Principal Site Reliability Developer - Oracle
*Jul 2026 - Present* &nbsp;|&nbsp; Saint Paul, MN

- Federal contract work with enterprise Oracle Big Data Service (BDS).

##### Lead Software Engineer - Optum, UnitedHealth Group
*May 2026 - Jul 2026* &nbsp;|&nbsp; Saint Paul, MN

- Promoted to Lead to take WarpStream from beta to a supported production offering on the enterprise Kafka platform. Wrote the WarpStream operator from scratch in Go, authored all of its Terraform infrastructure (Cloud Storage, VPC, DNS, IAM), integrated it into self-service provisioning, and delivered full observability. Confluent licenses WarpStream but ships no deployment tooling, so the operator, automation, and runbooks were built in-house and are what the team runs it from today.

##### Senior Software Engineer - Optum, UnitedHealth Group
*Sep 2022 - May 2026* &nbsp;|&nbsp; Saint Paul, MN

- Solely designed and executed a head-to-head evaluation of WarpStream against Apache Kafka on GCP, coordinating with Confluent engineering. Stood up a bespoke WarpStream environment from scratch and rebuilt the methodology after the first results were challenged, adding consumer workloads, end-to-end latency tests, and continuous runs. Presented findings to Confluent engineering and internal leadership; the results decided that WarpStream would ship as a production product, projecting roughly 80% lower annual cost from its diskless, object-storage-backed design.
- Primary technical owner of a multi-tenant Apache Kafka platform: 4,000+ brokers across 800+ clusters, 100 billion+ messages per day, five-nines availability, zero customer data loss. Built on a two-tier control plane of custom Go operators and CRDs, with Elasticsearch as the shared state store guaranteeing full state recovery if either layer failed.
- Owned broker and agent level operations at production scale: compaction, partition reassignment, replication and rolling restarts, consumer group lag, throughput and latency tuning, certificate rotation, and exercised disaster recovery across GCP and Azure.
- Drove operational excellence for the platform as a 24x7 service: extended Prometheus, Thanos, and Grafana with Go monitoring controllers and PromQL dashboards, defined thresholds aligned to customer-facing SLAs, led incident response and root cause analysis, and authored the runbooks the organization still operates from.
- Owned the self-service developer console end to end (TypeScript, React, NextJS) that let teams provision production streaming infrastructure in minutes, and the versioned CRD contracts behind it decoupling the product surface from operator internals.
- Captained a team of 6, conducted code reviews, mentored engineers on distributed systems and Go, and interviewed early-career candidates each hiring cycle.

##### Software Engineer - Optum, UnitedHealth Group
*Jun 2020 - Aug 2022* &nbsp;|&nbsp; Saint Paul, MN

- Built Go operator features and provisioning pipelines for thousands of streaming clients; supported on-prem Cassandra and Elasticsearch clusters offered as a service; managed 120 Azure VM ScaleSets via Terraform and GitOps; migrated customers off bespoke AWS MSK. Assumed SRE on-call in 2021, and found undocumented Azure API rate limits through network-level investigation that drove the platform's migration to GCP.

---

#### Education and Certifications

B.S. Software Engineering, St. Cloud State University, GPA 3.79 &nbsp;|&nbsp; Google Cloud Certified - Cloud Digital Leader (2025) &nbsp;|&nbsp; Optum AI Dojo: RAG system in Python (2025) &nbsp;|&nbsp; [IEEE publication](https://ieeexplore.ieee.org/document/9659615)
