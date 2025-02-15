# Language Learning Portal - API Overview

## Business Context
This API supports a language learning school's prototype portal that serves three main purposes:
1. Vocabulary inventory management
2. Learning Record Store (LRS) for practice vocabulary tracking
3. Unified launchpad for various learning applications

## Technical Constraints
- Database: SQLite3
- Authentication: Single user system (no auth required)
- Framework: Framework-agnostic design

## Core API Endpoints

| Method | Endpoint | Query Parameters | Purpose |
|--------|----------|------------------|----------|
| **Word Management** |
| GET | `/words` | `page` (default: 1)<br>`sort_by` (kanji/romaji/english/correct_count/wrong_count)<br>`order` (asc/desc) | Get paginated word list with review statistics |
| **Group Management** |
| GET | `/groups` | `page` (default: 1)<br>`sort_by` (name/words_count)<br>`order` (asc/desc) | Get paginated group list |
| GET | `/groups/:id` | `page` (default: 1) | Get words from specific group |
| **Study Session Management** |
| POST | `/study_sessions` | - | Create new study session |
| POST | `/study_sessions/:id/review` | - | Log word review attempt |

## Request/Response Formats

### GET `/words`
```json
{
  "items": [
    {
      "id": 1,
      "kanji": "漢字",
      "romaji": "kanji",
      "english": "Chinese characters",
      "parts": {},
      "correct_count": 10,
      "wrong_count": 2
    }
  ],
  "total": 100,
  "page": 1,
  "per_page": 20
}
```

### GET `/groups`
```json
{
  "items": [
    {
      "id": 1,
      "name": "JLPT N5 Vocabulary",
      "words_count": 100
    }
  ],
  "total": 10,
  "page": 1,
  "per_page": 20
}
```

### POST `/study_sessions`
Request:
```json
{
  "group_id": 1,
  "study_activity_id": 1
}
```

### POST `/study_sessions/:id/review`
Request:
```json
{
  "word_id": 1,
  "correct": true
}
```

## Database Schema

### words
```sql
CREATE TABLE words (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kanji TEXT NOT NULL,
  romaji TEXT NOT NULL,
  english TEXT NOT NULL,
  parts JSON NOT NULL
);
```

### groups
```sql
CREATE TABLE groups (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  words_count INTEGER DEFAULT 0
);
```

### word_groups
```sql
CREATE TABLE word_groups (
  word_id INTEGER REFERENCES words(id),
  group_id INTEGER REFERENCES groups(id),
  PRIMARY KEY (word_id, group_id)
);
```

### study_activities
```sql
CREATE TABLE study_activities (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  url TEXT NOT NULL
);
```

### study_sessions
```sql
CREATE TABLE study_sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  group_id INTEGER REFERENCES groups(id),
  study_activity_id INTEGER REFERENCES study_activities(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### word_review_items
```sql
CREATE TABLE word_review_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  word_id INTEGER REFERENCES words(id),
  study_session_id INTEGER REFERENCES study_sessions(id),
  correct BOOLEAN NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Key Database Relationships
- Word ↔ Groups: Many-to-many through word_groups
- Session → Group: Belongs to
- Session → Study Activity: Belongs to
- Session → Word Review Items: Has many
- Word Review Item → Session: Belongs to
- Word Review Item → Word: Belongs to

## Design Considerations
1. Auto-incrementing primary keys for all tables
2. Automatic timestamp management
3. Foreign key constraints for referential integrity
4. JSON storage for flexible word components
5. Counter cache on groups.words_count for optimization