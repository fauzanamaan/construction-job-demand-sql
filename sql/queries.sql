-- Queries copied as written from the completed document. Each was run on its own in the Global Career Accelerator SQL app, so they are not meant to run as one script.

-- Task 1A
SELECT
  date_trunc('month', job_first_upload_complete_datetime) AS
monthly,
  COUNT(*) AS num_jobs
FROM hover.jobs
GROUP BY
  monthly
ORDER BY
  monthly

-- Task 1C
SELECT
  date_part('month', job_first_upload_complete_datetime) AS
months,
  COUNT(DISTINCT(date_trunc('month',
job_first_upload_complete_datetime))) AS num_times
FROM hover.jobs
GROUP BY
  months
ORDER BY
  months

-- Task 2A
SELECT
  date_trunc('month', datetime) AS monthly,
  COUNT(*) as num_weather_events
FROM hover.weather
GROUP BY
  monthly
ORDER BY
  monthly

-- Task 2B
SELECT
  date_trunc('month', datetime) AS monthly,
  COUNT(*) as num_weather_events
FROM hover.weather
WHERE
  date_trunc('month', datetime) >= '2016-09-01'
GROUP BY
  monthly
ORDER BY
  monthly

-- Task 2C
SELECT
  date_trunc('month', datetime) AS monthly,
  COUNT(*) as num_weather_events
FROM hover.weather
WHERE date_trunc('month', datetime) >= '2016-09-01'
  AND state IN (SELECT DISTINCT job_location_region_code FROM
hover.jobs)
GROUP BY
  monthly
ORDER BY
  monthly

-- Task 3A
SELECT
  j.job_deliverable,
  j.job_location_region_code,
  date_trunc('week', j.job_first_upload_complete_datetime) AS
Week,
  w.n_weather_events
FROM
  hover.weekly_weather_events AS w
INNER JOIN hover.jobs as j
  ON w.state = j.job_location_region_code
     AND w.weather_ts = date_trunc('week',
j.job_first_upload_complete_datetime)

-- Task 3B
SELECT
  State,
  Week,
  Count(*) AS num_jobs,
  SUM(n_weather_events) AS total_weather_events
FROM
  (SELECT
    j.job_deliverable,
    j.job_location_region_code AS State,
    date_trunc('week', j.job_first_upload_complete_datetime)
AS Week,
    w.n_weather_events
  FROM
    hover.weekly_weather_events AS w
  INNER JOIN hover.jobs as j
    ON w.state = j.job_location_region_code
       AND w.weather_ts = date_trunc('week',
j.job_first_upload_complete_datetime)
  ) AS temp_table
GROUP BY
  State,
  Week
ORDER BY
  State
