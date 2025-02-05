# Gen AI Core Components

### Foundation Model Integration
- Located in provider's domain (not your infrastructure)
- Examples: OpenAI, Anthropic, AWS Bedrock
- Key differences from traditional ML:
  - Much larger (billions of parameters vs. millions)
  - Open-ended responses vs. specific predictions
  - Pre-trained models vs. custom training
  - Higher resource requirements

### Context Management
- Enhances model input quality
- Components:
  - Knowledge base integration
  - Prompt engineering
  - Context formatting
  - Input processing
- Placement: Before model interaction

###  Guard Rails System
- Input Protection:
  - PII detection
  - Content filtering
  - Security validation
  - Data sanitization
- Output Protection:
  - Safety checks
  - Bias detection
  - Response validation
  - Compliance verification

### Pipeline Orchestration
- Manages workflow end-to-end
- Features:
  - Multiple model coordination
  - Response processing
  - State management
  - Error handling
- Capabilities:
  - Multi-model calls
  - Response chaining
  - Tool integration

### Knowledge Base Integration
- Purpose: Augment model knowledge
- Implementation:
  - Company information
  - Domain-specific data
  - Real-time updates
- Position: Before context management
- Integration: RAG (Retrieval Augmented Generation)

### Agency/Agents
- Separate from orchestration
- Purpose: Autonomous actions
- Characteristics:
  - Continuous reasoning
  - Task completion
  - Tool utilization
- Implementation: External to core model
