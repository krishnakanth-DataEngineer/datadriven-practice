# Who Comes Back

[Data Modeling · Medium · on DataDriven](https://datadriven.io/problems/who_comes_back)

## How it went

| | |
|---|---|
| Solved | 2026-11-11 |
| Accepted | on the first submission |
| Hints | none |
| Concepts | Dimension Tables, Fact Tables, Foreign Keys, Grain Definition, Metric Additivity, One-to-Many, Pre-Aggregation, Primary Keys, Star Schema, Surrogate Keys |

## The design

```mermaid
erDiagram
    user_engagement_per_day {
        INT user_id FK
        INT total_sessions
        DATE activity_date FK
        VARCHAR total_time
        INT total_vedios
    }
    users {
        INT user_id PK
        VARCHAR name
        DATE signup_date
        VARCHAR city
        VARCHAR state
        VARCHAR phone_number
        VARCHAR email
        VARCHAR country
        INT aquisition_id FK
    }
    date {
        DATE date PK
        VARCHAR day
        VARCHAR quater
        VARCHAR year
        VARCHAR month
    }
    aquisition_channel {
        unspecified aquisition_id PK
        unspecified name
        unspecified campaign_id
    }
    users only one optionally to zero or more user_engagement_per_day : "user_id"
    date only one optionally to zero or more user_engagement_per_day : "activity_date = date"
    aquisition_channel only one optionally to zero or more users : "aquisition_id"
```

The accepted design is in [`schema.sql`](./schema.sql) as DDL and in [`schema.json`](./schema.json) as JSON.
