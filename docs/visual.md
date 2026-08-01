---
pdf_options:
  margin:
    top: 10mm
    bottom: 10mm
    left: 15mm
    right: 15mm
---

# Caleb Kopp
**Senior Software Engineer &middot; Kafka & Kubernetes Infrastructure**

Saint Paul, MN &nbsp;&nbsp;|&nbsp;&nbsp; 507-299-0445 &nbsp;&nbsp;|&nbsp;&nbsp; caleb.m.kopp@outlook.com &nbsp;&nbsp;|&nbsp;&nbsp; linkedin.com/in/calebmkopp &nbsp;&nbsp;|&nbsp;&nbsp; Open to remote

---

## Summary

I build platforms where streaming infrastructure disappears behind a self-service button. At Optum, the technology arm of UnitedHealth Group, I'm one of the deepest technical owners of a Kafka-as-a-Service platform built on custom Kubernetes operators in Go, a CRD-driven internal provisioning system (PRM/KRM), Terraformed GCP cloud infrastructure, and a NextJS micro-frontend embedded in HCP Console. 4,000+ Kafka brokers, 750+ high-throughput clusters, 100 billion+ messages per day, five nines, zero data loss. Through resilient data pipelines, clean self-service UI, or robust SRE - I'm always seeking a challenge. Most recently I co-led the full-stack delivery of Warpstream-based cluster provisioning, projected to reduce annual Kafka infrastructure costs by approximately 80% for our largest GCP customers. Always willing to work with anyone to make technology work better for everyone!

---

## Core Skills

| Category | Skills |
|---|---|
| **Languages & Runtimes** | Golang, Python, Bash, scripting, TypeScript, JavaScript, Java |
| **Infrastructure & Orchestration** | Kubernetes (CRDs, custom operator frameworks), Helm, Terraform, infrastructure as code, GitHub Actions, Azure DevOps, CI/CD, Google Cloud Platform, Azure, GKE, Docker, VPC, DNS, automated deployment, configuration management, cloud infrastructure, DevOps |
| **Data & Streaming** | Apache Kafka, Warpstream, Confluent, Confluent Schema Registry, Elasticsearch, ELK, stream processing, data ingestion, data orchestration, data engineering |
| **AI & Data Science** | Natural language processing, NLP, sentiment analysis, machine learning, data visualization, social media analytics, text classification |
| **Observability** | Prometheus, Thanos, Grafana, PromQL, PagerDuty, ServiceNow, cloud monitoring |
| **Security & Auth** | mTLS / PKI, encryption, network security, HashiCorp Vault, Chainguard hardened images, IAM, GCP KMS, data compliance, PHI/PII, disaster recovery |
| **Frontend** | React, NextJS, micro-frontend architecture, self-service provisioning UI |
| **Cloud** | Google Cloud Platform, Cloud Storage, cloud infrastructure, cloud engineering, cloud deployment, Azure |

---

## Experience

### Senior Software Engineer at Optum (UnitedHealth Group)
**Kafka & Infrastructure Platform &middot; HCP Console** &nbsp;&nbsp;&nbsp;&nbsp; *Sep 2022 - Present*

- **Kubernetes Resource Manager (KRM) SME:** Serve as one of the primary technical owners and deepest SMEs of KRM, a federated network of Kubernetes operators written in Go forming a two-tier control plane for automated deployment and configuration of streaming infrastructure at production scale. The upper control layer connects to and interfaces with external APIs, CSP provisioning hooks, and Optum-internal resource registration and billing services. A secondary operator layer, running in a separate Kubernetes cluster, generates and owns all concrete Kubernetes resources and links them back to the meta-resources established above. The PRM agent layer and KRM operators share a common **Elasticsearch cluster as a single source of truth**, ensuring full state recovery and resource utilization visibility if either system becomes unavailable. The platform manages **500+ individual Kafka clusters** across multi-tenant GCP environments, handling high-throughput, low-latency data ingestion workloads at enterprise production scale.

- **Platform Resource Manager (PRM):** Contribute to the PRM agent layer, an internal self-service developer platform and framework analogous to Spotify Backstage, through which all data orchestration and provisioning workflows are expressed as typed API contracts (Kinds and Objects) that decouple the product experience from operator implementation details. Enable self-service cloud deployment of streaming infrastructure across Google Cloud Platform.

- **Confluent Schema Registry as a Service:** Connect producers and consumers to managed Confluent Schema Registry endpoints, providing certificate/ACL governed schema management, compatibility enforcement, and data governance capabilities on top of the Kafka clusters the platform provisions.

- **Secure and Robust Client Infrastructure:** Maintain the platform's certificate authority and distribution pipeline: generate, distribute, and rotate thousands of client certificates with end-to-end encryption, each representing at least one producer and consumer served at **five nines reliability**. Manage VPC-scoped network security and DNS configuration for broker endpoints across all cloud environments.

- **Data Compliance and Disaster Recovery:** Ensure secure transport (SSL/TLS) and storage (GCP KMS encryption at rest) of PHI/PII data streams flowing through the platform in compliance with healthcare data governance requirements. Coordinate with a sister data governance team that connects data owners to data consumers through secure, legally-approved access workflows. Maintain active disaster recovery options for customers and participate in regular DR exercises across the platform.

- **Self-Service Frontend and Team Leadership:** Serve as lead engineer and product owner of the Kafka Clusters on the Cloud self-service micro-frontend (TypeScript, React, NextJS) embedded in HCP Console, meeting UX, accessibility, and security standards of the central developer portal team; captain a team of **6 engineers**, write user stories, conduct code reviews, and ship features against product, security, and compliance requirements. Produce technical documentation for onboarding engineers and platform partners.

- **Terraform and Cloud Infrastructure Engineering:** Contribute deep SME expertise to infrastructure-as-code and cloud infrastructure provisioning across GKE, VPC, DNS, IAM, Vault policies, Artifact Registry, and CI/CD pipelines on Google Cloud Platform; co-design and deliver all Terraform backing the net-new Warpstream Clusters-as-a-Service product including Cloud Storage bucket provisioning and cloud deployment automation.

- **Observability and Cloud Monitoring:** Extend the Prometheus/Thanos/Grafana observability stack, writing PromQL queries, updating Go monitoring controllers for new offerings, and delivering Terraform-managed Grafana dashboards surfaced to both on-call engineers and customers with PagerDuty and ServiceNow alert routing for customer-facing SLAs. Author runbooks and alert playbooks for platform-specific alerts and customer engagement procedures during war rooms and incident response.

- **Kafka Operations:** Own day-to-day operations of high-throughput, low-latency Kafka clusters at production scale including topic compaction configuration, rolling restarts, partition reassignment, consumer group lag monitoring, throughput and utilization tuning, and broker certificate rotation across on-prem and cloud environments.

- **Utility Tooling and Scripting:** Build and maintain a suite of Python and Bash scripting utilities: broker debugging, auth log inspection, quick produce/consume tools, automated Kafka broker TLS certificate rotation, and internal documentation tooling.

- **DevOps and CI/CD:** Own and maintain CI/CD pipeline configuration for platform services using GitHub Actions, Docker-based build pipelines, JFrog Artifactory, and HashiCorp Vault secret injection; enforce DevOps best practices across the team for container image management, deployment automation, and environment promotion workflows.

- **SRE and Mentorship:** Serve on-call across a fleet of **4,000+ Kafka brokers** with zero customer data loss in production across the platform's history; mentor junior engineers on distributed systems design, stream processing patterns, operator framework development, and Go best practices. Coordinate across engineering, product, and security stakeholders. Author technical documentation and runbooks used across the Kafka Platform organization.

- **Early Careers:** Volunteer for Optum Early Careers, running technical bootcamp lectures and labs each summer and conducting candidate interviews each fall and spring.

---

#### Featured Project: Warpstream Cluster Provisioning Platform (Q4 2025 - Q1 2026)

> **Impact:** ~80% cost reduction projected &nbsp;|&nbsp; Net-new Go operator authored &nbsp;|&nbsp; 8-week delivery &nbsp;|&nbsp; Full stack: infra to operator to observability

- Co-led an 8-week sprint to deliver end-to-end Warpstream-based Kafka cluster provisioning across the full stack: PRM agent changes, KRM operator extensions for net-new resource kinds, and a net-new **Warpstream DME operator** (Go) that generates all required Kubernetes resources and connects them into Cloud Storage buckets, Warpstream API registrations, and agent configs.
- Co-designed and authored all Terraform cloud infrastructure for the Warpstream Clusters-as-a-Service cloud deployment from scratch, including GCP Cloud Storage provisioning, VPC configuration, DNS, and IAM.
- Delivered Warpstream cloud monitoring integration, extending Go monitoring controllers and PromQL dashboards and onboarding into existing PagerDuty/ServiceNow alert routing.
- Shipped to **two of Optum's largest Apache Kafka on GCP customers** as beta; Warpstream's diskless, Cloud Storage-based architecture eliminates local disk I/O from the stream processing data path, projected to reduce their annual Kafka infrastructure spend by approximately **80%**.

---

#### Organizational Initiative Leadership (ongoing)

Consistent first-responder when company-wide mandates land before any golden path exists. Role in each: absorb the directive from leadership, decompose into tightly-scoped Features and User Stories (1-2 story points each for parallelization and scope control), and run focused engineering calls across the team and adjacent Kafka Platform groups to resolve blockers with SME-level insight. Demonstrated problem solving, analytical skills, communication, coordination, and collaboration across product, security, compliance, and engineering stakeholders at every level of the organization.

| Initiative | Summary |
|---|---|
| **Chainguard image adoption** | Adopted UHG's hardened base image standard early, rebuilding the platform Docker-based container supply chain and encryption baseline before a formal golden path existed. |
| **Cloud vulnerability remediation** | Triaged and resolved hundreds of cloud infrastructure security findings and network security misconfigurations in days when the internal security team hard-launched a new detection system, unblocking the broader Kafka Platform. |
| **UHG Cloud Native 2029 migration** | Drove accelerated cloud deployment and migration of customers off on-prem shared multi-tenant Kafka clusters toward Google Cloud Platform cloud-native deployments. |
| **Optum Grafana consolidation** | Led platform-side transition from self-hosted Grafana pods to Optum's centralized internal cloud monitoring offering, migrating dashboards, alert routing, and data source configs. |
| **HashiCorp Vault and break-glass CLI** | Manage team and sister-team secrets and encryption keys in Vault; co-maintain a proprietary CLI tool for time-boxed secondary ID check-in/check-out supporting privileged break-glass access workflows. |

---

### Software Engineer at Optum (UnitedHealth Group)
*Jun 2020 - Aug 2022*

**Kafka as a Service Platform** &nbsp;&nbsp;&nbsp;&nbsp; *Jan 2021 - Aug 2022*

- Contributed to provisioning pipelines and day-to-day operations supporting thousands of Kafka as a Service clients across multi-tenant and single-tenant stream processing deployments on Google Cloud Platform.
- Implemented novel features in custom Kubernetes operator frameworks in Go for automated deployment and configuration of Kafka resources at production scale; participated in early architecture discussions for KRM during its design phase.
- **On-Prem to Cloud Migration and GCP Advocacy:** Helped lead the platform's first venture from on-prem-only Kafka clusters to the cloud. Piloted a GitOps-driven automation pipeline generating customer Terraform to provision Azure VM ScaleSets for KaaS cloud clusters. Through hands-on investigation of Azure API network traffic and request/response headers, discovered undocumented per-3-minute and per-30-minute API call rate limits that made large-scale Terraform management operationally unfeasible; Azure provided no documentation, no usage dashboard, and no forewarning in official engagements. Combined this finding with a cost analysis showing significantly lower compute pricing in GCP for equivalent VM specs (storage, memory, CPU), and presented findings to platform leadership and Azure/Google engineering contacts. This investigation directly steered the team's decision to adopt GCP as the primary KaaS cloud host, a decision that cascaded across Optum's data platforms: as Kafka streams moved to GCP, producers and consumers followed (a pattern Optum calls **"Data Gravity"**), driving **millions of dollars** in cumulative infrastructure savings company-wide. Owned the UI/UX of the KaaS GCP self-service portal throughout this migration, enabling customers to provision cloud Kafka clusters through the developer portal and accelerating adoption. The following year was spent migrating customers off on-prem shared-tenant clusters, bespoke MSK instances, and self-hosted Kafka deployments onto the automated self-service GCP product.
- Assumed SRE responsibilities beginning Aug 2021, stabilizing production high-throughput Kafka services, establishing performance and utilization thresholds aligned to SLAs, and running on-call shifts responding to production incidents.

**Technology Development Program - ESRO Rotation** &nbsp;&nbsp;&nbsp;&nbsp; *Jun - Dec 2020*

- Designed and built a full-stack web application (React, TypeScript, Express, TypeORM, MSSQL) to replace a spreadsheet-based datacenter server inventory management process. Implemented a standardized server naming scheme encoding datacenter location, team ownership, and function metadata. Demoed to ESRO stakeholders and adopted by the team.

---

### Software Development Intern at Optum
*Jun - Aug 2019*

- Documented microservices leveraging master data integrity capabilities to maintain a unified golden record view of individuals and HCOs across multiple data sources.
- Improved quality of an Angular web application through UI testing, defect identification, and increased code coverage.

---

### Student Software Developer at Sogeti USA
*Jan - May 2019*

- Partnered in building a full-stack serverless web application for managing client success stories and demonstrating value delivered to the company.
- Led a small team of fellow student developers as agile team lead - writing user stories, running ceremonies, and interfacing with product owners from the company.

---

## Projects

### Online Social Network Interactions (OSNI)
**Lead Developer & Scrum Master** &nbsp;&nbsp;|&nbsp;&nbsp; Senior Year - Post-Graduation &nbsp;&nbsp;|&nbsp;&nbsp; [IEEE Publication](https://ieeexplore.ieee.org/document/9659615)

- Designed and built OSNI, a novel online reputation management solution that applies **natural language processing** and **sentiment analysis** to assess, monitor, and visualize social media content at scale using Python. Managed CI/CD pipelines via Azure DevOps.
- Architected a data pipeline to collect and analyze public social network discourse, producing interactive reputation dashboards from live data across multiple platforms.
- System validated through a peer-reviewed **IEEE case study** analyzing public sentiment toward three COVID-19 vaccines (Pfizer-BioNTech, Oxford-AstraZeneca, Johnson & Johnson), demonstrating practical application of NLP, text classification, and machine learning techniques to real-world online reputation management.

---

## Education

- B.S. in Software Engineering
- St. Cloud State University &nbsp;|&nbsp; Aug 2016-May 2020 &nbsp;|&nbsp; GPA 3.79
- President, Student Organization of Software Engineers (SOSE)

---

## Certifications
- Google Cloud Certified - Cloud Digital Leader &nbsp;|&nbsp; Mar 2025 - Mar 2028
