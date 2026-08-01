---
pdf_options:
  margin:
    top: 15mm
    bottom: 15mm
    left: 20mm
    right: 20mm
---

# Personal Details

This file contains personal identity, experience narratives, technical profile, and career context used by Copilot when generating tailored resumes, cover letters, and interview prep materials. Update this file with your own details.

For detailed STAR-format interview answers, see [STAR_questions.md](STAR_questions.md).

---

## Who I Am
Senior Software Engineer at Optum, the technology arm of UnitedHealth Group. Six years at UHG (two as SE, four as Senior). Based in Saint Paul, MN. B.S. Software Engineering from St. Cloud State University, GPA 3.79. IEEE-published researcher in NLP/sentiment analysis. Former president of the Student Organization of Software Engineers (SOSE).

## What I Work On
I am one of the deepest technical owners of Optum's Kafka-as-a-Service platform: 4,000+ Kafka brokers, 750+ high-throughput clusters across GCP, 100 billion+ messages per day, five-nines reliability, zero customer data loss. The platform is built entirely on open-source Apache Kafka with custom Kubernetes operators in Go (KRM - Kubernetes Resource Manager) forming a two-tier distributed control plane, a CRD-driven internal provisioning framework (PRM - Platform Resource Manager, analogous to Spotify Backstage), Terraformed cloud infrastructure, and a self-service developer portal micro-frontend embedded in HCP Console. We do not use Confluent for Kubernetes (CFK) or any Confluent managed platform product; the entire operator framework, automation, tooling, and observability stack is handwritten. Teams at Optum choose between our custom KaaS offering and purchasing CFK off the shelf, making our platform an internal competitor to Confluent's commercial product. We do license Confluent Schema Registry and Warpstream from Confluent, but self-host both: Schema Registry runs in a Helm chart we built ourselves (Confluent provides the license key, not the chart), and Warpstream runs on an operator I wrote from scratch (Confluent provides the license, not the operator or any deployment tooling).

## Full-Stack Platform Engineering
I own the full-stack self-service developer portal experience for Kafka Clusters as a Service, embedded in Optum's enterprise-wide HCP Console. I lead every layer:
- **UI/UX:** TypeScript, React, NextJS micro-frontend; responsive, informative, intuitive interface
- **API layer:** Provisioning pipeline bridging the portal to real Kubernetes StatefulSet infrastructure
- **Portal integration:** Meeting UX, accessibility, and security standards of the central developer portal team
- **Infrastructure security:** Enforcing security posture on every cluster the portal provisions (mTLS, Vault, KMS)
- **Observability & alerting:** Ensure platform metrics are exposed and surfaced in Grafana dashboards used by both on-call engineers and customers. Write runbooks and alert playbooks for platform-specific alerts and customer engagement procedures during war rooms and incident response.

The product is one of the highest-regarded developer experience offerings at Optum due to the quality of its automation, ease of self-service, and responsiveness of its UI. Developers across the enterprise can provision production-grade streaming infrastructure in minutes.

## Key Value Created
- **On-prem to cloud migration and GCP advocacy (SE role, 2021-2022):** See detailed narrative below. This work directly led to my promotion to Senior.
- **Warpstream delivery (Q4 2025 - Q1 2026):** See detailed narrative below. Projected ~80% annual Kafka infrastructure cost reduction.
- **Warpstream performance testing (Mar 2025):** See detailed narrative below. Solo-owned head-to-head benchmarking; results directly informed the decision to offer Warpstream as a production product at Optum.
- **Platform scale:** 4,000+ Kafka brokers, 750+ clusters, 100 billion+ messages per day, five-nines reliability, zero customer data loss across the platform's history.
- **Organizational first-responder:** Consistently first to absorb company-wide mandates before golden paths exist: Chainguard hardened image adoption, cloud vulnerability remediation (hundreds of findings in days), Cloud Native 2029 migration, Grafana consolidation, Vault and break-glass CLI.
- **Confluent Schema Registry as a Service:** Certificate/ACL-governed schema management and data governance on top of provisioned Kafka clusters.
- **Full-stack web app (SE role):** Built a React/TypeScript/Express/MSSQL app replacing spreadsheet-based datacenter inventory management. Adopted by the team.
- **Cassandra/Elasticsearch On-Prem Operations:** Early in my tenure, supported on-prem Cassandra and Elasticsearch clusters as a service, including on-call troubleshooting and learning the operational quirks of running these systems at scale. The Elasticsearch product was later transitioned to a dedicated team, and all Cassandra clusters were decommissioned as the platform evolved.

## Key Narratives for Resume Tailoring
These are detailed stories to draw from when generating tailored resumes and cover letters. Condense, reword, and adapt them to the target role; do not copy verbatim into tailored documents.

### On-Prem to Cloud Migration and GCP Advocacy (SE role, 2021-2022)
The KaaS platform initially only offered Kafka clusters in Optum's own datacenter. The first cloud venture was a pilot program using GitOps automation to generate customer Terraform and create Azure VM ScaleSets. This proved operationally unfeasible for two reasons: (1) GCP offered dramatically lower compute pricing for equivalent storage/memory/CPU specs, and (2) Azure imposed undocumented per-3-minute and per-30-minute API call rate limits on large-scale Terraform operations, with no documentation, no usage dashboard, and no forewarning in official engagements. I discovered these rate limits by personally digging into network traffic and request/response headers to the Azure API. This investigation, combined with cost analysis, led the team to adopt GCP as the primary KaaS cloud host. The decision cascaded across all of Optum's data platforms through "Data Gravity" - where Kafka streams land, producers and consumers follow with their compute and services. The push for GCP over Azure has saved the company millions of dollars in comparable infrastructure costs. I owned the UI/UX of the KaaS GCP self-service portal throughout, accelerating customer adoption. The following year was spent migrating customers off on-prem shared-tenant clusters, bespoke MSK instances, and self-hosted Kafka deployments onto the automated self-service GCP product. This body of work directly led to my promotion to Senior Software Engineer.

### Warpstream Delivery (Senior role, Q4 2025 - Q1 2026)
Co-led an 8-week sprint delivering full-stack Warpstream-based cluster provisioning. Built a net-new Go operator (Warpstream DME), authored all Terraform cloud infrastructure from scratch (GCS, VPC, DNS, IAM), integrated into the self-service portal, and delivered full observability. Shipped to Optum's two largest GCP Kafka customers as beta. Warpstream's diskless, Cloud Storage-backed architecture eliminates local disk I/O from the streaming data path, projected to reduce annual Kafka infrastructure costs by approximately 80%. This was the platform's most impactful cost-reduction initiative and demonstrated the team's ability to deliver net-new infrastructure products end-to-end in compressed timelines.

### Warpstream vs Apache Kafka Performance Testing (Senior role, Mar 2025)
Solely owned the design and execution of a head-to-head performance comparison between Warpstream and Apache Kafka in GCP, coordinating on dual timelines with Confluent (external vendor) and Optum leadership. Stood up a bespoke Warpstream environment from scratch in GKE, navigating corporate image pull restrictions (cannot pull public images; mirrored and scanned through internal registries). First iteration of the test plan (producer-only, sequential runs) produced results that both Confluent and Optum questioned as unexpected; took another week to completely redesign the methodology: added consumer workloads, end-to-end latency tests, continuous 30-minute runs with 10-minute interval metrics, and updated properties per Warpstream benchmarking docs. Designed three test scenarios: moderate concurrent load (5 producers/10 consumers), heavy concurrent load (10 producers/20 consumers pushing autoscaling from 3 to 7 agents), and end-to-end latency. Configured equivalent infrastructure, standardized producer/consumer properties, ran structured 30-minute tests with metrics at 10-minute intervals, and produced a comprehensive report with architecture diagrams, scaling timelines, Grafana dashboards, and raw data tables. Presented findings to both Confluent engineering and Optum upper leadership. Results directly informed the decision to offer Warpstream as a production product at Optum. This story is a strong "SWAT team / unstructured problem" narrative: solo assignment, no playbook, no precedent, figured out corporate infra constraints, failed on first attempt and iterated, coordinated with an external vendor, designed methodology from scratch, delivered business-critical results.

## Technical Identity
- **Primary languages:** Go, TypeScript, Python, Java, Bash
- **Infrastructure:** Kubernetes (CRDs, custom operators, Helm), Terraform (GCP), Docker, GKE, VPC, DNS, IAM
- **Data streaming:** Apache Kafka (open-source, not Confluent Platform), Warpstream (Confluent-licensed, self-hosted with custom operator), Confluent Schema Registry (Confluent-licensed, self-hosted with custom Helm chart), Elasticsearch
- **Frontend:** React, NextJS, Redux, Context API, Recoil, micro-frontend architecture, self-service provisioning UI
- **CI/CD:** GitHub Actions, Jenkins, JFrog Artifactory, Azure DevOps, HashiCorp Vault secret injection
- **Security:** mTLS, PKI, certificate authority management, GCP KMS, encryption at rest, PHI/PII data compliance, Chainguard hardened images, disaster recovery
- **Observability:** Prometheus, Thanos, Grafana, PromQL, PagerDuty, ServiceNow
- **Databases:** Elasticsearch (shared state store), MSSQL, TypeORM

## Professional Intersection
I sit at the intersection of: Healthcare (regulated, PHI/PII workloads), Data Streaming (Kafka at enterprise scale), Developer Experience Portals (full-stack self-service for internal developers), Platform Engineering (Kubernetes operators, IaC, cloud infrastructure), Security (mTLS, Vault, compliance, certificate management), and Go/TypeScript full-stack development. I captain a team of 6 engineers, mentor through Optum Early Careers, and lead through technical depth, not title.

## Hands-On Coding Identity
I am a senior engineer who still writes production code every day. I personally implement React UI components, API integrations, and backend service logic - I am in the codebase daily writing features, fixing bugs, and reviewing pull requests. I also co-design and author all of the platform's Terraform infrastructure across GCP, from VPC and IAM to Cloud Storage and DNS - not delegating IaC to a separate infrastructure team but writing and maintaining it myself alongside application code. When tailoring for roles that emphasize hands-on engineering over pure architecture/oversight, lead with language like "write and ship production code daily," "personally wrote," "implement directly," and "stay hands-on." Avoid framing that sounds like pure management ("own," "serve as," "lead") without pairing it with concrete coding activity.

## Regulated Data Handling
My platform carries PHI/PII healthcare data streams requiring end-to-end SSL/TLS transport, GCP KMS encryption at rest, mTLS certificate management, strict IAM controls, and legally-approved data governance workflows. I implement these security patterns directly in the code I write and maintain the platform's certificate authority that generates and rotates thousands of client certificates. When tailoring for regulated industries (financial services, insurance, government), emphasize: PHI/PII handling, encryption at rest and in transit, certificate management, IAM, auditability, compliance workflows, and coordination with data governance teams. Frame healthcare compliance as directly transferable to financial data sensitivity.

## Leadership Style
Lead engineer and product owner. Captain a team of 6. Write user stories, conduct code reviews, mentor junior engineers on distributed systems, Go, and secure development. Coordinate across engineering, product, security, and compliance stakeholders. Volunteer for Optum Early Careers each year (technical bootcamp lectures, candidate interviews). Serve on-call across the full production fleet.

## Certifications
- **Google Cloud Certified - Cloud Digital Leader** (Mar 2025 - Mar 2028): Validates foundational knowledge across six GCP domains: (1) Digital Transformation with Google Cloud (cloud adoption frameworks, lift-and-shift, brownfield/greenfield strategies, TCO analysis, hybrid/multi-cloud), (2) Exploring Data Transformation, (3) Innovating with Google Cloud AI, (4) Modernizing Infrastructure and Applications (VMs vs. containers vs. serverless, monolith-to-microservice decomposition, GKE, Anthos, Google Compute Engine, App Engine, Cloud Run, rehosting legacy apps, APIs/Apigee), (5) Trust and Security, (6) Scaling with Google Cloud Operations. The digital transformation and infrastructure modernization domains are directly relevant when tailoring for roles involving cloud migration, monolith-to-microservice initiatives, or GCP hosting strategy decisions.
- **Optum AI Dojo Certificate** (internal, 2025): Internal certification covering Generative AI fundamentals, reasoning models, GCP AI offerings, and Azure Databricks/Jupyter notebook workflows. Final project: built a RAG (Retrieval-Augmented Generation) system from scratch using Python and a CSV dataset. This is an internal Optum credential, not a vendor certification. When tailoring for roles emphasizing GenAI proficiency, reference the hands-on RAG build, familiarity with reasoning models, and practical GenAI application to development workflows.

## Honest Gaps and Depth Calibration
These are areas where the resume lists experience but actual depth is limited, or where target roles commonly require knowledge Caleb has not yet built. Use this section when generating gap analyses (see copilot-instructions.md "Gap Analysis" rule) and when calibrating how confidently to present a skill in tailored documents. Detailed study items live in docs/writings/to-learn.md.

- **Confluent Schema Registry:** Owns the infrastructure (Terraform, Helm, certificates, ACLs) but has not worked deeply with the Schema Registry REST API, compatibility mode selection, schema evolution strategies across Avro/Protobuf/JSON Schema, or the _schemas topic internals. Frame as "set up and operate" rather than "designed schema governance workflows."
- **Databases (SQL and NoSQL):** Production experience limited to MSSQL (ESRO rotation app) and Elasticsearch (shared state store). No production PostgreSQL, MongoDB, Redis, DynamoDB, or Cassandra beyond early-career on-prem Cassandra troubleshooting. Weak on query optimization, indexing strategies, and data modeling for scale. Do not present database skills as a strength; list them factually and do not over-claim.
- **Java:** Listed on resume and used academically but not a daily production language. Confluent's core platform is Java/Scala. JVM tuning, concurrency primitives, and modern Java features are gaps. Present as "proficient" not "deep."
- **Distributed Systems Theory:** Strong operational intuition from running distributed systems at scale, but formal CS theory (CAP/PACELC proofs, consensus protocol mechanics, linearizability definitions, vector clocks) is weaker. Present distributed systems experience through concrete outcomes, not theoretical framing.
- **Kafka Internals:** Deep operational knowledge (compaction, restarts, partitions, lag, certs) but less depth on controller internals, KRaft consensus, replication protocol mechanics, exactly-once semantics, and consumer rebalancing protocols.
- **Stream Processing Patterns:** Operates Kafka at scale but limited hands-on with Kafka Streams, ksqlDB, Flink, CDC/Debezium, or windowing patterns beyond basic consumer group consumption.
- **Confluent Platform Products:** Licenses Confluent Schema Registry and Warpstream from Confluent, but self-hosts both with entirely custom Helm charts, Terraform, certificate automation, and (for Warpstream) a custom Go operator. Confluent provides the license keys, not the deployment tooling. Has coordinated with Confluent engineering on Warpstream benchmarking. The core KaaS platform is built on open-source Apache Kafka with custom operators, not on Confluent's commercial platform. Has not used ksqlDB, Kafka Connect at depth, Confluent Cloud, or CFK. CFK is a competing product to the custom platform Caleb built, not something he has deployed.
