# To Learn

## Gaps

### Gaps - Solo.io Senior AI Software Engineer

#### Service Mesh (Istio and Ambient Mesh)
- Istio architecture: control plane (istiod), data plane (Envoy sidecars), xDS protocol for config distribution
- Ambient Mesh (sidecar-less): ztunnel (L4 proxy per node), waypoint proxies (L7), how it differs from sidecar model
- Traffic management: VirtualService, DestinationRule, Gateway resources; routing, retries, circuit breaking, fault injection
- mTLS in Istio: SPIFFE identity, automatic cert rotation, PeerAuthentication policies (vs your current manual cert management)
- AuthorizationPolicy: L4/L7 access control within the mesh
- Observability integration: how Istio generates metrics, traces, and access logs; integration with Prometheus/Grafana
- Multi-cluster mesh: primary-remote, multi-primary topologies; cross-cluster service discovery

#### Envoy Proxy
- Envoy architecture: listeners, filter chains, clusters, endpoints; how requests flow through the proxy
- xDS APIs: LDS, RDS, CDS, EDS, SDS - how control planes (like Istio) configure Envoy dynamically
- HTTP connection manager, route configuration, header manipulation
- Envoy filters: HTTP filters (ext_authz, rate limiting, RBAC), network filters, Lua/WASM filters
- Load balancing algorithms: round robin, least request, ring hash, Maglev
- Building and extending Envoy: Go or WASM extensions for custom filter logic
- Envoy as an API gateway: rate limiting, auth, TLS termination, gRPC transcoding

#### Kubernetes Gateway API
- Gateway API resources: GatewayClass, Gateway, HTTPRoute, TCPRoute, GRPCRoute, ReferenceGrant
- How Gateway API differs from Ingress: role-oriented design (infra provider vs cluster operator vs app developer)
- Gateway API implementations: kgateway (Solo/CNCF), Istio, Cilium, Contour
- Policy attachment: BackendTLSPolicy, timeouts, retries; how policies attach to Gateway API resources
- Gateway API for mesh: GAMMA initiative (Gateway API for Mesh Management and Administration)

#### AI Agentic Frameworks and Protocols
- MCP (Model Context Protocol): architecture, tool registration, resource exposure, how agents discover and invoke tools
- A2A (Agent-to-Agent): agent communication protocol, agent cards, task lifecycle, multi-agent orchestration patterns
- ADK (Agent Development Kit): Google's framework for building AI agents; tool use, memory, planning
- kagent (Solo.io): Kubernetes-native AI agent orchestration; CRDs for agent lifecycle, tool management, observability
- agentgateway (Solo.io): proxy/gateway patterns for AI agent traffic; routing, auth, rate limiting for agent-to-tool and agent-to-agent calls
- LLM serving on Kubernetes: vLLM, Ollama, TGI; GPU scheduling, model caching, autoscaling inference workloads
- RAG at production scale: vector databases (pgvector, Weaviate, Pinecone), chunking strategies, retrieval pipelines beyond the AI Dojo CSV project

#### API Gateway Patterns and Cloud Networking
- API gateway vs service mesh vs ingress controller: when to use each, how they overlap
- gRPC: protobuf, streaming, interceptors, gRPC-Web; Solo products heavily use gRPC
- Rate limiting architectures: local vs global rate limiting, token bucket, sliding window
- North-south vs east-west traffic: gateway (north-south) vs mesh (east-west) responsibilities
- WebSocket and HTTP/2 proxying; long-lived connection management

#### Open Source Contribution Workflow
- Contributing to CNCF projects: governance, SIGs, KEPs, review process, DCO sign-off
- OSS development cadence: public design docs, RFCs, issue triage, community meetings
- Building in public: balancing velocity with review thoroughness; working with external contributors

### Gaps - BeyondTrust Sr Software Development Engineer

#### AWS
- AWS core services: EC2, ECS/EKS, S3, IAM, VPC, Route 53, CloudWatch, CloudFormation/CDK
- AWS networking: VPC peering, Transit Gateway, PrivateLink, security groups vs NACLs
- AWS secrets management: AWS Secrets Manager, Parameter Store, KMS integration
- AWS container orchestration: EKS specifics vs GKE, Fargate, ECR
- AWS CI/CD: CodePipeline, CodeBuild, or how GitHub Actions integrates with AWS services

#### Secrets Management Domain
- Secrets management product patterns: vault architecture, secret rotation, dynamic secrets, lease management
- Privileged access management (PAM): session recording, just-in-time access, privilege elevation
- Identity security: service identity, machine identity, secrets sprawl detection
- BeyondTrust product suite: Password Safe, Privileged Remote Access, Endpoint Privilege Management
- Zero-trust secrets: how secrets management fits into zero-trust architectures

#### C#/.NET
- C# language fundamentals: async/await, LINQ, dependency injection, generics
- .NET ecosystem: ASP.NET Core, Entity Framework, NuGet, dotnet CLI
- C# in microservices: gRPC with C#, containerized .NET services

#### E2E Testing Frameworks
- Cypress: component testing, API testing, custom commands, CI integration
- Playwright: cross-browser testing, codegen, trace viewer, API testing
- Testing strategies for web-based enterprise applications at scale

### Kafka Internals (beyond operations)
- Kafka controller internals, partition leadership election, ISR mechanics
- KRaft consensus (replacing ZooKeeper) - how the quorum controller works, metadata topics, Raft log
- Replication protocol at depth: leader epoch, log truncation, high watermark advancement
- Exactly-once semantics and transactional APIs (idempotent producers, transactional consumers, read_committed isolation)
- Consumer group rebalancing protocols (eager vs cooperative sticky, static group membership)
- Log segment internals: indexing, compaction implementation, tiered storage

### Confluent Schema Registry (beyond infrastructure)
- Schema Registry REST API: registering, retrieving, and deleting schemas; subject-level vs global compatibility
- Compatibility modes in practice: BACKWARD, FORWARD, FULL, NONE, and TRANSITIVE variants; when to use each
- How Schema Registry relates to underlying CFK Kafka cluster (_schemas topic, leader election, single-primary architecture)
- Schema evolution strategies across Avro, Protobuf, and JSON Schema
- Schema references and schema contexts for complex multi-schema topologies
- Schema Registry in Confluent Cloud vs self-managed: architectural differences

### Confluent Platform and Products
- ksqlDB: streaming SQL engine, push/pull queries, persistent queries, state stores
- Kafka Connect: connector architecture, source vs sink, SMTs, distributed vs standalone mode, offset management
- Confluent Cloud architecture: multi-tenant cluster management, CKUs, networking (Private Link, VPC peering, Transit Gateway)
- Apache Flink on Confluent: Confluent acquired Immerok; Flink SQL, stream processing beyond Kafka Streams
- Confluent for Kubernetes (CFK): operator-based deployment, CR lifecycle, how it differs from Strimzi

### Kubernetes (beyond daily operator work)
- CNI (Container Network Interface): plugin architecture, pod networking, network policy enforcement
- CNS (Container Network Security): network segmentation, service mesh integration
- Building from scratch with kubectl create, edit, deploy - fluency beyond Helm/operator abstractions

### Databases and Storage (SQL and NoSQL)
- SQL at depth: query optimization, indexing strategies (B-tree, hash, composite), EXPLAIN plans, query profiling
- PostgreSQL: practical experience with a production relational DB beyond MSSQL
- NoSQL patterns: document stores (MongoDB), key-value (Redis, DynamoDB), wide-column (Cassandra); when to choose which
- Data modeling for scale: denormalization tradeoffs, partition key design, read/write optimization patterns
- Connection pooling, replication (leader-follower, multi-leader), sharding strategies
- Elasticsearch: deeper understanding beyond shared state store usage (query DSL, mappings, analyzer chains, cluster tuning)

### Distributed Systems Theory
- CAP theorem, PACELC: formal understanding vs intuitive operational knowledge
- Consensus protocols: Raft (in depth, since KRaft uses it), Paxos (conceptual)
- Consistent hashing, virtual nodes, ring-based partitioning
- Exactly-once delivery guarantees vs at-least-once vs at-most-once: formal definitions and implementation patterns
- Vector clocks, logical timestamps, causal ordering

### Gaps - Target Sr. Cloud Data Engineer

#### BigQuery
- BigQuery fundamentals: datasets, tables, views, materialized views, partitioned/clustered tables
- Scheduled queries: creating, monitoring, troubleshooting failed scheduled query jobs
- Recurring summary tables: patterns for building and maintaining rollup/aggregation tables
- Data transfers: BigQuery Data Transfer Service, scheduled transfers, monitoring transfer runs
- BigQuery SQL: differences from standard SQL (STRUCT, ARRAY, UNNEST, approximate aggregation functions)
- Cost management: on-demand vs capacity pricing, slot reservations, query optimization for cost
- BigQuery IAM: dataset-level, table-level, and row-level access controls; authorized views

#### Batch ETL and Data Transformation
- ETL vs ELT patterns: when to transform before vs after loading into BigQuery
- Data ingestion into Cloud Storage and BigQuery: batch loading, streaming inserts, Storage Write API
- Data pipeline orchestration for batch workloads (vs streaming-only experience with Kafka)
- Schema management in analytics contexts: schema evolution, backward compatibility in BigQuery
- Linearizability vs sequential consistency vs eventual consistency: formal definitions
- ETL vs ELT patterns in data streaming: formal definitions and tradeoffs

### Data Structures and Algorithms
- Interview-level DS&A prep: trees, graphs, dynamic programming, sliding window, two-pointer, backtracking
- System design interview format: structured approach to designing distributed systems on a whiteboard
- Time/space complexity analysis for common patterns

### Languages
- Go: deeper language internals (goroutine scheduler, GC, channels vs mutexes, interface satisfaction)
- Java: listed on resume but not primary; Confluent's core platform (Kafka, Schema Registry, Connect) is Java/Scala
- JVM internals: GC tuning, memory model, thread safety, concurrency primitives (CompletableFuture, ExecutorService)
- Modern Java: records, sealed classes, virtual threads (Project Loom), pattern matching
- Build tooling: Gradle (Confluent uses Gradle), Maven
- Rust
- Bloblang (Bento/Benthos stream processing DSL)

### Stream Processing Patterns (beyond Kafka ops)
- CDC pipelines: Debezium, Kafka Connect source connectors for database change capture
- Stream-table duality, KTable/GlobalKTable, interactive queries
- Windowing: tumbling, hopping, sliding, session windows; watermarks and late arrival handling
- Stream processing frameworks comparison: Kafka Streams vs Flink vs Spark Structured Streaming
- Bento stream processing: rebuilding OSNI with Bento (input tweets, output Warpstream, read buckets in a UI, filter by company for sentiment tracking)

### Gaps - Staff Go Engineer (CNCF K8s Developer Tools via Realm)

#### Open Source / CNCF Contribution
- Contributing to public CNCF projects: governance, SIGs, KEPs, review process, DCO sign-off (partially covered under Solo.io gaps)
- Building in public: balancing velocity with review thoroughness, working with external contributors
- Public API design for OSS projects: backward compatibility, deprecation policies, semantic versioning
- Community engagement: conference talks, blog posts, meetup participation, Discord/Slack community moderation

#### External SaaS Multi-Tenancy
- Multi-tenant Kubernetes SaaS for external customers vs internal enterprise platform
- Tenant isolation patterns: namespace-per-tenant, cluster-per-tenant, virtual clusters (vcluster)
- SaaS billing, onboarding, and self-service for untrusted external users
- Public API design: versioning, rate limiting, authentication for external consumers
- SLA contracts and incident management for external customers

#### AWS (see also BeyondTrust gaps)
- EKS specifics vs GKE: networking, IAM integration, add-ons, managed node groups
- AWS IAM: policies, roles, OIDC federation for Kubernetes service accounts (IRSA)
- AWS networking: VPC, security groups, PrivateLink, Transit Gateway

### Gaps - limitless. Staff Cloud Infrastructure Engineer

#### Rust
- Rust ownership model, borrowing, lifetimes: foundational language concepts not yet built
- Async Rust: tokio runtime, async/await, channels, select!
- Rust for systems/infra work: writing CLI tools, network services, Kubernetes controllers in Rust
- Error handling patterns: anyhow, thiserror, Result propagation
- Rust build tooling: Cargo, workspaces, feature flags, cross-compilation

#### BYOC (Bring Your Own Cloud) Deployment Patterns
- BYOC architecture: deploying vendor control plane into customer-owned cloud accounts
- Tenant isolation in BYOC: IAM boundary design, network segregation, secrets scoping per tenant
- Agent-based BYOC: outbound-only agent pattern vs inbound connectivity; credential/token models
- Upgrade and lifecycle management for BYOC deployments: rolling upgrades with no customer downtime
- Customer onboarding for BYOC: Terraform modules, Helm charts, or CLI tooling designed for external operators

#### Bare Metal Infrastructure
- Bare metal provisioning: PXE boot, iPXE, IPMI, Redfish API; network boot vs image-based deployment
- Cluster lifecycle on bare metal: node discovery, OS provisioning, Kubernetes bootstrapping (Talos, RKE2, kubeadm)
- Hardware-level observability: SMART, IPMI sensors, out-of-band management integration with monitoring stacks
- Storage on bare metal: Ceph, Rook-Ceph, local PV provisioning vs network-attached storage

#### AWS (additional - see also BeyondTrust and Staff Go Engineer gaps)
- EKS specifics: managed node groups, Karpenter autoscaler, EKS add-ons, IRSA (IAM Roles for Service Accounts)
- AWS networking deep dive: PrivateLink for BYOC, Transit Gateway for multi-account architectures
- Multi-account AWS patterns: AWS Organizations, SCPs, landing zones for SaaS isolation

### Gaps - Apple Staff SW Engineer Applied AI (200630749) / DevOps Engineer Agents (200631016)

#### LLM APIs and Applied AI
- Building production solutions on LLM APIs: OpenAI, Anthropic, Gemini, Mistral, Llama integration patterns
- Custom fine-tuned models: Defog, Nous Research; when to fine-tune vs prompt-engineer vs RAG
- Prompt optimization and evaluation: systematic eval frameworks, A/B testing prompts, regression detection
- Model pipeline and registry tools: MLflow, Weights & Biases, model versioning, artifact management
- Model drift detection and automated monitoring: data drift vs concept drift, alerting on accuracy degradation
- RAG at production scale beyond AI Dojo CSV project: vector DB selection (pgvector, Weaviate, Pinecone), chunking strategies, hybrid search, retrieval evaluation

#### MCP Servers and AI Agent Infrastructure
- MCP (Model Context Protocol): server implementation, tool registration, resource exposure, transport protocols (stdio, SSE, streamable HTTP)
- MCP server deployment and scaling: containerized MCP servers, load balancing, connection management
- Agent orchestration patterns: LangChain, LangGraph, AutoGen, CrewAI; production vs prototyping tradeoffs
- Agent observability: tracing token flows, tool invocations, hallucination detection, evals as CI

#### ETL and Data Warehousing
- ETL pipeline construction: Snowflake, dbt, Airflow; batch vs streaming ingestion patterns
- PostgreSQL: production experience beyond MSSQL (query optimization, indexing, EXPLAIN plans)
- SQL at depth for analytics workloads: window functions, CTEs, materialized views

#### Deployment Tooling
- Ansible: playbook authoring, roles, inventory management, idempotent configuration (JDs list alongside Docker/Jenkins)
### Gaps - Aloe Identity Founding Infrastructure Engineer

#### Identity and Access Management Domain
- OIDC and OAuth2 flows: authorization code, PKCE, client credentials, token exchange, refresh token rotation
- SAML 2.0: SP-initiated vs IdP-initiated SSO, assertion parsing, metadata exchange
- SCIM: user/group provisioning protocol, schema, bulk operations, filtering
- Identity provider architecture: directory services, federation, multi-tenancy, session management
- Passwordless auth patterns: WebAuthn/FIDO2, passkeys, magic links
- Okta/Auth0 product landscape: understanding competitor patterns to build against

#### Startup / Greenfield Infrastructure
- Standing up production infrastructure from zero: sequencing decisions (networking, DNS, secrets, compute, observability)
- Cost-conscious infrastructure design at seed stage vs enterprise scale
- SOC 2 compliance from day one: audit logging, access controls, evidence collection
- Infrastructure decisions with no existing playbook or team norms

### Gaps - Akamai Senior Software Engineer (Zero Trust Security Group)

#### Zero Trust Architecture and Products
- ZTNA (Zero Trust Network Access): architecture, policy enforcement points, trust evaluation
- SDP (Software-Defined Perimeter): controller, gateway, client architecture; SPA (Single Packet Authorization)
- Micro-segmentation: identity-based segmentation, east-west traffic policies, least-privilege network access
- Zero Trust product development: how ZT principles translate into shipped product features vs infrastructure posture
- Akamai Enterprise Application Access / Enterprise Threat Protector: competitor landscape awareness

#### FedRAMP Compliance
- NIST 800-53 control families: access control, audit, identification/authentication, system integrity
- FedRAMP authorization process: JAB vs agency path, P-ATO, ATO, continuous monitoring
- FedRAMP documentation: System Security Plan (SSP), Plan of Action and Milestones (POA&M), security assessment reports
- Continuous monitoring requirements: vulnerability scanning cadence, configuration management, incident response
- FedRAMP vs HIPAA/healthcare compliance: mapping transferable concepts and identifying gaps

#### Modern Authorization and Identity Management
- OIDC flows: authorization code, PKCE, implicit, hybrid; ID tokens vs access tokens
- OAuth2: client credentials, token exchange, refresh token rotation, scopes, resource indicators
- SAML 2.0: SP-initiated vs IdP-initiated SSO, assertion parsing, metadata exchange
- RBAC/ABAC policy engines: OPA (Open Policy Agent), Cedar, Casbin; policy-as-code patterns
- Identity federation: multi-IdP, cross-domain trust, SCIM provisioning
- Session management, token revocation, and zero-trust session evaluation

#### Government and Defense Sector
- Security clearance process: Secret clearance investigation, SF-86, adjudication timeline
- Government software development lifecycle: RMF (Risk Management Framework), Authority to Operate
- ITAR/EAR awareness for defense-adjacent software
- Working with government customers: contracting, compliance documentation, audit readiness

#### Caching Mechanisms
- Redis: data structures, pub/sub, clustering, persistence, eviction policies
- Memcached: use cases vs Redis, consistent hashing, slab allocation
- CDN-level caching: cache invalidation strategies, edge caching, TTL management
- Application-level caching patterns: cache-aside, write-through, write-behind

#### Edge Computing
- Edge deployment patterns: edge nodes, fog computing, disconnected/intermittent connectivity
- Tactical network integration: bandwidth-constrained environments, store-and-forward
- Edge-to-cloud synchronization: eventual consistency, conflict resolution at the edge

### Other
- Web scraping (Selenium, etc)