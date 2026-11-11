CREATE TABLE user_engagement_per_day (
    user_id INT,
    total_sessions INT,
    activity_date DATE,
    total_time VARCHAR,
    total_vedios INT
);

CREATE TABLE users (
    user_id INT,
    name VARCHAR,
    signup_date DATE,
    city VARCHAR,
    state VARCHAR,
    phone_number VARCHAR,
    email VARCHAR,
    country VARCHAR,
    aquisition_id INT,
    PRIMARY KEY (user_id)
);

CREATE TABLE date (
    date DATE,
    day VARCHAR,
    quater VARCHAR,
    year VARCHAR,
    month VARCHAR,
    PRIMARY KEY (date)
);

CREATE TABLE aquisition_channel (
    aquisition_id TEXT,  /* no type on the canvas */
    name TEXT,  /* no type on the canvas */
    campaign_id TEXT,  /* no type on the canvas */
    PRIMARY KEY (aquisition_id)
);

ALTER TABLE user_engagement_per_day
    ADD FOREIGN KEY (user_id) REFERENCES users (user_id);

ALTER TABLE user_engagement_per_day
    ADD FOREIGN KEY (activity_date) REFERENCES date (date);

ALTER TABLE users
    ADD FOREIGN KEY (aquisition_id) REFERENCES aquisition_channel (aquisition_id);
