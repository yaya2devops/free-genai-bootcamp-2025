# Language Learning Portal Technical Specifications

## 1. System Overview

### 1.1 Project Purpose
The Language Learning Portal is designed to serve as an integrated platform for language learning with three core functions:
- Vocabulary inventory management system
- Learning Record Store (LRS) for tracking practice performance
- Unified launchpad for various learning applications

### 1.2 Technical Stack
- **Backend Framework**: Go with Gin web framework
- **Database**: SQLite3
- **Task Runner**: Mage
- **Response Format**: JSON
- **API Design**: RESTful principles
- **Authentication**: None (Single user system)

### 1.3 Core Features
- Vocabulary management with Japanese-English translations
- Study session tracking and analytics
- Progress monitoring and statistics
- Multiple study activity support
- Group-based vocabulary organization

## 2. Architecture

### 2.1 System Components
```
[Client Applications] → [RESTful API Layer] → [Service Layer] → [Data Access Layer] → [SQLite Database]
```

### 2.2 Project Structure
```
backend_go/
├── cmd/
│   └── server/              # Application entry points
│       └── main.go         
├── internal/
│   ├── models/             # Data structures and DB operations
│   ├── handlers/           # HTTP request handlers
│   └── service/            # Business logic
├── db/
│   ├── migrations/         # Database migrations
│   └── seeds/              # Initial data
├── magefile.go             # Task runner configuration
└── words.db               # SQLite database
```

### 2.3 Layer Responsibilities
1. **API Layer (handlers/)**
   - Request validation
   - Response formatting
   - HTTP error handling
   - Route management

2. **Service Layer (service/)**
   - Business logic implementation
   - Transaction management
   - Data aggregation
   - Cross-cutting concerns

3. **Data Access Layer (models/)**
   - Database operations
   - Entity definitions
   - Data validation
   - Query building

## 3. Database Design

### 3.1 Tables Overview
1. **words**
   - Primary storage for vocabulary
   - Contains Japanese, romaji, and English translations
   - Stores word components in JSON format

2. **groups**
   - Thematic organization of words
   - Maintains word count for performance
   - Enables categorical learning

3. **word_groups**
   - Junction table for words-groups relationship
   - Enables many-to-many relationships
   - Facilitates flexible word organization

4. **study_activities**
   - Defines available learning activities
   - Stores activity metadata
   - Links to external applications

5. **study_sessions**
   - Records learning sessions
   - Links activities to groups
   - Tracks temporal data

6. **word_review_items**
   - Stores individual word practice attempts
   - Tracks correctness of responses
   - Enables progress analysis

### 3.2 Schema Relationships
- words ←→ groups (Many-to-Many via word_groups)
- groups → study_sessions (One-to-Many)
- study_activities → study_sessions (One-to-Many)
- study_sessions → word_review_items (One-to-Many)
- words → word_review_items (One-to-Many)

### 3.3 Database Schema Details
```sql
CREATE TABLE words (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    japanese TEXT NOT NULL,
    romaji TEXT NOT NULL,
    english TEXT NOT NULL,
    parts JSON NOT NULL
);

CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    words_count INTEGER DEFAULT 0
);

CREATE TABLE word_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word_id INTEGER REFERENCES words(id),
    group_id INTEGER REFERENCES groups(id)
);

CREATE TABLE study_activities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    url TEXT NOT NULL
);

CREATE TABLE study_sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_id INTEGER REFERENCES groups(id),
    study_activity_id INTEGER REFERENCES study_activities(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE word_review_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word_id INTEGER REFERENCES words(id),
    study_session_id INTEGER REFERENCES study_sessions(id),
    correct BOOLEAN NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 4. API Design

### 4.1 API Standards
- All endpoints return JSON
- Standard error response format
- Pagination for list endpoints (100 items per page)
- Consistent date format (ISO 8601)
- HTTP status codes follow REST conventions

### 4.2 Common Response Formats
1. **List Response**
```json
{
  "items": [],
  "pagination": {
    "current_page": 1,
    "total_pages": 5,
    "total_items": 100,
    "items_per_page": 20
  }
}
```

2. **Error Response**
```json
{
  "error": {
    "code": "INVALID_REQUEST",
    "message": "Detailed error message"
  }
}
```

3. **Success Response**
```json
{
  "success": true,
  "data": {}
}
```

## 5. Task Runner Configuration

### 5.1 Database Tasks
1. **Initialize Database**
   - Creates SQLite database file
   - Sets up initial schema
   - Configures constraints

2. **Run Migrations**
   - Executes migration files in order
   - Handles schema updates
   - Maintains version history

3. **Seed Data**
   - Imports initial vocabulary
   - Creates default groups
   - Sets up study activities

### 5.2 Development Tasks
1. **Build**
   - Compiles application
   - Runs tests
   - Generates artifacts

2. **Clean**
   - Removes build artifacts
   - Cleans temporary files
   - Resets development state

## 6. Security Considerations

### 6.1 Data Validation
- Input sanitization for all API endpoints
- Validation of JSON structures
- Type checking for all parameters

### 6.2 Error Handling
- Graceful error recovery
- Detailed logging
- User-friendly error messages

### 6.3 Rate Limiting
- Basic rate limiting per IP
- Prevents abuse of API endpoints
- Configurable limits

## 7. Performance Considerations

### 7.1 Database Optimizations
- Indexed foreign keys
- Counter cache for frequently accessed counts
- Efficient query patterns

### 7.2 API Optimizations
- Response caching where appropriate
- Pagination for large datasets
- Efficient JSON serialization

## 8. Development Guidelines

### 8.1 Code Organization
- Feature-based package organization
- Clear separation of concerns
- Consistent naming conventions

### 8.2 Testing Requirements
- Unit tests for business logic
- Integration tests for API endpoints
- Performance benchmarks for critical paths

### 8.3 Documentation Requirements
- Inline code documentation
- API documentation
- Setup and deployment guides

## 9. Deployment

### 9.1 Requirements
- Go 1.20 or higher
- SQLite3
- Mage task runner

### 9.2 Setup Steps
1. Initialize database
2. Run migrations
3. Seed initial data
4. Start API server

### 9.3 Environment Variables
- `PORT`: Server port (default: 8080)
- `DB_PATH`: Database file path
- `LOG_LEVEL`: Logging verbosity

## 10. Monitoring and Maintenance

### 10.1 Logging
- Request/response logging
- Error tracking
- Performance metrics

### 10.2 Backup Strategy
- Regular database backups
- Transaction logs
- Recovery procedures

### 10.3 Health Checks
- Database connectivity
- API endpoint status
- System resource usage