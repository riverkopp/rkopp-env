---
pdf_options:
  margin:
    top: 6mm
    bottom: 6mm
    left: 12mm
    right: 12mm
---

### River Kopp - Senior Software Engineer

Saint Paul, MN &nbsp;|&nbsp; 507-299-0445 &nbsp;|&nbsp; caleb.m.kopp@outlook.com &nbsp;|&nbsp; linkedin.com/in/rivermkopp

---

#### Skills

- **Languages:** Go, Python, Bash, TypeScript, JavaScript, Java
- **Infrastructure:** Kubernetes, custom operator framework development, Kubernetes CRDs, Helm, Terraform, GCP, GKE, VPC, DNS, IAM, Docker, infrastructure as code
- **Security:** mTLS, PKI, certificate authority management, HashiCorp Vault, GCP KMS, IAM, encryption at rest, PHI/PII compliance, Chainguard hardened images
- **CI/CD and DevOps:** GitHub Actions, Docker-based build pipelines, JFrog Artifactory, HashiCorp Vault secret injection, automated deployment, container image management
- **Observability:** Prometheus, Grafana, PromQL, Elasticsearch, PagerDuty, ServiceNow, runbooks, on-call, production debugging
- **Frontend:** React, NextJS, TypeScript, micro-frontend architecture, self-service provisioning UI

---

#### Experience

##### Senior Software Engineer - Optum, UnitedHealth Group
*Sep 2022 - Present* &nbsp;|&nbsp; Saint Paul, MN

- Primary technical owner of KRM, a federated network of custom Go Kubernetes operators forming a two-tier control plane that automates deployment and lifecycle management of 750+ Kafka clusters across multi-tenant GCP environments at five-nines reliability with zero customer data loss; co-author all Terraform across GKE, VPC, DNS, IAM, and CI/CD pipelines.
- Co-led 8-week sprint taking Warpstream cluster provisioning from whiteboard to production: wrote a net-new Go operator from scratch, authored all Terraform infrastructure (GCS buckets, VPC networking, DNS records, IAM policies), integrated into the self-service API, and delivered full observability; shipped to two of Optum's largest GCP customers, projected to reduce annual infrastructure costs by approximately 80%.
- Maintain the platform's certificate authority: generate, distribute, and rotate thousands of mTLS client certificates across all cloud environments; manage VPC-scoped network security and DNS for broker endpoints; enforce encryption at rest via GCP KMS for regulated PHI/PII data streams in compliance with healthcare data governance requirements.
- Own CI/CD pipeline configuration using GitHub Actions, Docker-based build pipelines, JFrog Artifactory, and HashiCorp Vault secret injection; support and advance development environments to reduce friction when shipping to production; enforce best practices for container image management, Chainguard hardened base images, and deployment automation.
- Extend the Prometheus/Grafana/Elasticsearch observability stack with custom Go monitoring controllers and PromQL dashboards surfaced to both engineers and customers; author runbooks and alert playbooks; troubleshoot production issues spanning applications, databases, networks, and proxies; serve on-call across a fleet of 1,000+ nodes.
- Captain a team of 6 engineers as lead engineer and product owner of the Kafka Clusters self-service web application (TypeScript, React, NextJS) embedded in Optum's enterprise developer portal; write user stories, conduct code reviews, mentor junior engineers, and coordinate across product, security, and compliance stakeholders.
- Solely owned the design and execution of a head-to-head Warpstream vs Apache Kafka performance benchmark in GCP: stood up a bespoke test environment from scratch in GKE, iterated on methodology after initial results were questioned, and produced a comprehensive report with architecture diagrams and Grafana dashboards that directly informed the decision to offer Warpstream as a production product.

##### Software Engineer - Optum, UnitedHealth Group
*Jun 2020 - Aug 2022* &nbsp;|&nbsp; Saint Paul, MN

- Contributed to Go Kubernetes operator frameworks and provisioning pipelines; discovered undocumented Azure API rate limits through hands-on network traffic investigation, producing a cost analysis that drove the platform's migration to GCP and saved the company millions in infrastructure spend.
- Built a full-stack web application (React, TypeScript, Express, MSSQL) replacing spreadsheet-based datacenter inventory management; adopted by the team.

---

#### Certifications

- Google Cloud Certified - Cloud Digital Leader (Mar 2025) &nbsp;|&nbsp; Optum AI Dojo: built a RAG system from scratch using Python (2025)

#### Education

B.S. Software Engineering, St. Cloud State University, GPA 3.79 &nbsp;|&nbsp; IEEE: [ieeexplore.ieee.org/document/9659615](https://ieeexplore.ieee.org/document/9659615)
