DROP DATABASE packiot;
CREATE DATABASE packiot;

USE packiot;

CREATE TABLE IF NOT EXISTS counters (
  id INTEGER PRIMARY KEY,
  code VARCHAR(11) UNIQUE
);
CREATE TABLE IF NOT EXISTS machines (
  id INTEGER PRIMARY KEY,
  code VARCHAR(11) UNIQUE,
  counter INTEGER REFERENCES counters(id)
);
CREATE TABLE IF NOT EXISTS values (
  timestamp_value TIMESTAMPTZ PRIMARY KEY,
  id INTEGER REFERENCES counters(id),
  value INTEGER
);
CREATE TABLE IF NOT EXISTS shifts (
  id INTEGER PRIMARY KEY,
  code VARCHAR(11) UNIQUE,
  machine INTEGER REFERENCES machines(id),
  hour_start TIME,
  hour_end TIME
);
 -- INSERT's test --

INSERT INTO counters (id, code) VALUES (1, 11), (2, 21);
INSERT INTO machines (id, code, counter) VALUES (1, 12, 1), (2, 22, 2);
INSERT INTO values (timestamp_value, id, value) values (now(), 1, 25.50), (now(), 2, 25.50);
INSERT INTO shifts (id, code, machine, hour_start, hour_end) VALUES (1, 13, 1, '08:49:04.566025-07', current_time), (2, 23, 2, '08:49:04.566025-07', current_time);
