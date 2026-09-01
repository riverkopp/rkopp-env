---
pdf_options:
  margin:
    top: 10mm
    bottom: 10mm
    left: 15mm
    right: 15mm
---

# LinkedIn Profile
## River Kopp
---

## Headline

Platform Engineer | Kafka & Kubernetes Infrastructure | Go, Terraform, GCP | Full-Stack Delivery

---

## About

I build platforms where streaming infrastructure disappears behind a self-service button. I have a history of deep technical ownership of an enterprise Kafka platform; custom k8s operators, Terraformed GCP, and a NextJS frontend serving thousands of clients. 4,000+ Kafka brokers, 800+ clusters, 100 billion+ messages per day, five nines, zero data loss. Shipped WarpStream for ~80% infra cost reduction. Always willing to work with anyone to make technology work better for everyone!

---

## Experience

---

### Principal Site Reliability Developer

**Oracle** | Saint Paul, MN | Jul 2026 - Present

#### Description

```
Federal contract work with enterprise Oracle Big Data Service (BDS).
```

---

### Lead Software Engineer

**Optum, UnitedHealth Group** | Saint Paul, MN | May 2026 - Jul 2026

#### Description (1212 / 2000 chars)

```
Promoted to Lead for the final stretch at Optum, owning WarpStream as a production service offering end to end.

WarpStream as a Service: Took WarpStream from beta to a supported product on the Kafka platform. Owned the net-new Go operator I wrote from scratch, all Terraform infrastructure (GCS, VPC, DNS, IAM), self-service provisioning integration, and full observability. Delivered to Optum's two largest GCP Kafka customers; projected ~80% annual infrastructure cost reduction through WarpStream's diskless, object-storage-backed architecture that removes local disk I/O from the streaming data path.

Performance Validation: Solely owned the head-to-head WarpStream vs Apache Kafka benchmark that justified the investment - bespoke GKE environment built from scratch, methodology rebuilt after the first results were challenged, findings presented to Confluent engineering and Optum leadership.

Team Leadership: Captained a team of 6 engineers, ran code reviews, wrote user stories, and mentored on distributed systems, Go, and operator patterns.

Transition: Authored the runbooks, adoption playbooks, and knowledge-transfer documentation that let the platform team operate WarpStream after my departure.
```

#### Skills (10)

| # | Skill | Rationale |
|---|-------|-----------|
| **1** | **Apache Kafka** | Core domain; WarpStream is Kafka-protocol compatible |
| **2** | **Go (Programming Language)** | Wrote the WarpStream operator from scratch |
| **3** | **Kubernetes** | Operator and StatefulSet lifecycle for the service |
| **4** | **Terraform** | All WarpStream cloud infrastructure authored from scratch |
| **5** | **Technical Leadership** | Lead title; captained a team of 6 |
| 6 | Google Cloud Platform (GCP) | GCS, VPC, DNS, IAM for the WarpStream deployment |
| 7 | Performance Testing | Head-to-head benchmark that drove the product decision |
| 8 | Distributed Systems | Diskless streaming architecture |
| 9 | Mentoring | Code reviews and engineer development |
| 10 | Technical Documentation | Runbooks, playbooks, knowledge transfer |

---

### Senior Software Engineer

**Optum, UnitedHealth Group** | Saint Paul, MN | Sep 2022 - Jul 2026

#### Description (1729 / 2000 chars)

```
One of the deepest technical owners of Optum's Kafka-as-a-Service platform: 4,000+ Kafka brokers, 800+ high-throughput clusters, 100 billion+ messages per day, five nines reliability.

KRM/PRM Technical Lead: SME of custom Kubernetes operators (Go) forming a two-tier control plane for automated streaming infra deployment across GCP. 800+ clusters in multi-tenant environments.

Frontend Product Lead: Lead engineer and product owner of the Kafka on Cloud micro-frontend (TypeScript, React, NextJS) in HCP Console. Captain a team of 6; write stories and conduct code reviews.

Infrastructure & Security: Terraform/IaC across GKE, VPC, DNS, IAM, Vault, and CI/CD. Own the platform's mTLS CA - generate, distribute, and rotate thousands of client certificates.

Data Compliance & DR: Ensure secure transport (SSL/TLS) and storage (GCP KMS encryption at rest) of PHI/PII data streams. Coordinate with data governance connecting owners to consumers through legally-approved workflows. Maintain DR options; participate in regular exercises.

Observability: Extend Prometheus/Thanos/Grafana with PromQL, Go controllers, and dashboards for on-call engineers and customers. PagerDuty/ServiceNow routing. Author playbooks and runbooks.

Organizational Leadership: First-responder for company-wide mandates - Chainguard hardened images, cloud vulnerability remediation (hundreds of findings in days), Cloud Native 2029 migration, Grafana consolidation.

Kafka Operations: Production ops - compaction, restarts, partition reassignment, lag monitoring, cert rotation.

SRE & Mentorship: Zero customer data loss. On-call across a 4,000+ broker fleet. Mentor juniors on distributed systems, Go, and operator patterns. Early Careers volunteer.
```

#### Skills (20 - first 5 shown on profile)

| # | Skill | Rationale |
|---|-------|-----------|
| **1** | **Kubernetes** | Foundation of the entire platform; highest signal for senior platform eng |
| **2** | **Apache Kafka** | Core domain expertise; defines the product |
| **3** | **Go (Programming Language)** | Primary implementation language for all operators |
| **4** | **Terraform** | IaC backbone; Warpstream infra built from scratch |
| **5** | **Google Cloud Platform (GCP)** | Concrete cloud platform; high recruiter search volume |
| 6 | Helm | Upstream chart syncing, authoring from scratch, Helm-to-operator translation |
| 7 | Distributed Systems | Senior-level architectural scope |
| 8 | CI/CD | DevOps pipeline ownership |
| 9 | Python | Utility tooling, scripting |
| 10 | TypeScript | Frontend micro-frontend language |
| 11 | React.js | HCP Console micro-frontend framework |
| 12 | Prometheus | Observability stack |
| 13 | Grafana | Dashboards and alerting |
| 14 | Docker | Container image management |
| 15 | Infrastructure as Code (IaC) | Broader IaC category beyond Terraform |
| 16 | Network Security | mTLS, PKI, VPC security |
| 17 | HashiCorp Vault | Secrets management, break-glass workflows |
| 18 | GitHub Actions | CI/CD platform |
| 19 | Elasticsearch | State store for KRM/PRM |
| 20 | Next.js | Frontend framework |

---

### Software Engineer

**Optum, UnitedHealth Group** | Saint Paul, MN | Jun 2020 - Aug 2022

#### Description (1904 / 2000 chars)

```
Kafka Platform (Jan 2021 - Aug 2022): Built and operated provisioning pipelines supporting thousands of Kafka-as-a-Service clients across multi-tenant and single-tenant streaming deployments on GCP.

Developed features in custom Kubernetes operators (Go) for automated Kafka resource deployment at production scale; shaped early architecture decisions for KRM during its design phase.

Azure Infrastructure: Managed 120 VM ScaleSets - image versioning, rolling updates, monitoring, alerting, and tagging - via Terraform modules and GitOps workflows using Atlantis. Built Bash utilities for broker operations and debugging.

Customer Migrations: Moved 87 customer repos from on-prem GitHub Enterprise to cloud. Transitioned 300 customer namespaces from legacy GitOps-based Kafka resource management to a CRD-backed provisioning model on HCP Console with minimal downtime by running parallel workloads before decommissioning the old environment.

Platform Migrations: Migrated 50 Terraform/Helm deployments from RedHat OpenShift to Google Anthos Kubernetes. Moved observability from self-hosted Grafana to Optum's enterprise monitoring. Replaced Jenkins, Drone, Ansible, and Atlantis pipelines with GitHub Actions.

Frontend Launch: Coordinated 20+ engineers to plan, design, and ship the Kafka managed service micro-frontend (TypeScript, React, NextJS) on HCP Console. Integrated Apache Beam & CDC partnership into the UI.

Took on SRE responsibilities Aug 2021 - stabilized production high-throughput Kafka services, established performance thresholds aligned to SLAs, and ran on-call shifts responding to production incidents.

Technology Development Program - ESRO Rotation (Jun - Dec 2020): Built a full-stack web app (React, TypeScript, Express, MSSQL) replacing a spreadsheet-based datacenter server inventory with a standardized naming and tracking system. Demoed and adopted by the team.
```

#### Skills (18 - first 5 shown on profile)

| # | Skill | Rationale |
|---|-------|-----------|
| **1** | **Terraform** | Atlantis GitOps, Azure modules, IaC-first role |
| **2** | **Microsoft Azure** | Azure StatefulSets, VMs, rolling updates - unique to this role |
| **3** | **Site Reliability Engineering (SRE)** | On-call, SLA ownership from Aug 2021 |
| **4** | **Red Hat OpenShift** | OpenShift-to-Anthos migration - not in Senior role |
| **5** | **Jenkins** | CI/CD migration from Jenkins/Ansible - not in Senior role |
| 6 | Apache Kafka | Core daily work (shared with Senior) |
| 7 | Kubernetes | Operator framework development (shared with Senior) |
| 8 | Go (Programming Language) | Primary language (shared with Senior) |
| 9 | Google Cloud Platform (GCP) | Anthos target platform |
| 10 | GitHub Actions | CI/CD migration target |
| 11 | Ansible | Legacy CI/CD automation |
| 12 | Bash | Broker utilities and scripting |
| 13 | React.js | HCP Console frontend launch |
| 14 | TypeScript | Frontend micro-frontend language |
| 15 | Grafana | Observability migration |
| 16 | Atlantis | GitOps Terraform workflow |
| 17 | Monitoring & Alerting | SRE threshold work |
| 18 | Cross-functional Team Leadership | HCP Console Design/Product/QA collaboration |
| 19 | Microsoft SQL Server | ESRO rotation full-stack app |
| 20 | Express.js | ESRO rotation API layer |

---

### Software Development Intern

**Optum** | Saint Paul, MN | Jun 2019 - Aug 2019

#### Description (385 / 2000 chars)

```
Collaborated with product owners and engineers to document 6 asynchronous microservices leveraging master data integrity capabilities to maintain a unified golden record view of individuals and HCOs across government, public, and licensed data sources. Improved quality of an Angular web application through UI testing, defect identification, and increased code coverage via SonarQube.
```

#### Skills (5)

| # | Skill |
|---|-------|
| **1** | **Angular** |
| **2** | **SonarQube** |
| **3** | **Technical Documentation** |
| **4** | **Postman API** |
| **5** | **Web Application Development** |

---

### Student Software Developer

**Sogeti USA** | Jan 2019 - May 2019

#### Description (310 / 2000 chars)

```
Partnered in building a full-stack serverless web application for managing client success stories and demonstrating value delivered to the company. Led a small team of fellow student developers as agile team lead - writing user stories, running ceremonies, and interfacing with product owners from the company.
```

#### Skills (5)

| # | Skill |
|---|-------|
| **1** | **Full-Stack Development** |
| **2** | **Serverless Architecture** |
| **3** | **Agile Methodologies** |
| **4** | **Scrum** |
| **5** | **Stakeholder Management** |

---

## Projects

---

### Online Social Network Interactions (OSNI)

**Role:** Lead Developer | **Timeline:** Senior Year - Post-Graduation | **Paper:** https://ieeexplore.ieee.org/document/9659615

#### Description

```
https://ieeexplore.ieee.org/document/9659615

Designed and built OSNI, a novel online reputation management solution that uses sentiment analysis to assess, monitor, and visualize social media content. Managed CI/CD pipelines via Azure DevOps. The system collected and analyzed public discourse around real-world subjects, producing reputation dashboards from live social network data.

Served as developer and scrum master through senior year and continued contributing after graduation while onboarding into a full-time engineering role. A peer-reviewed paper was published based on the system's design, architecture, and a COVID-19 vaccine reputation case study (Pfizer-BioNTech, Oxford-AstraZeneca, Johnson & Johnson).
```

#### Skills (5)

| # | Skill |
|---|-------|
| **1** | **Sentiment Analysis** |
| **2** | **Natural Language Processing (NLP)** |
| **3** | **Python** |
| **4** | **Data Visualization** |
| **5** | **Azure DevOps** |

---
