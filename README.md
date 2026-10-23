# Construction Job Demand

SQL analysis of whether severe weather drives demand for construction jobs, using job requests and adverse weather records by month, week and state.

**Queries:** [sql/queries.sql](sql/queries.sql) · **Full completed document:** [project-pdf/construction-job-demand.pdf](project-pdf/construction-job-demand.pdf)

This is an optional LevelUp milestone project from the Global Career Accelerator program. The scenario and data come from the program. It is not work done for Hover or any construction company.

## Context

The scenario is set at Hover, a company whose software builds 3D models of homes, from the point of view of a junior analyst. The manager suspects that severe weather increases job requests and wants the data to test that idea, so teams can be sized and placed ahead of demand.

## Data

- `hover.jobs`: job requests from September 2016 to March 2019, with the state, the upload date and the job type (full building or roof).
- `hover.weather`: adverse weather events across the United States, with state and date (the PDF names the NOAA Storm Prediction Center as the source).
- `hover.weekly_weather_events`: weekly counts of weather events per state, prepared by a colleague in the scenario.

## Tools and skills

- SQL: `date_trunc` and `date_part` for monthly and weekly grouping
- `COUNT(DISTINCT ...)`
- A subquery inside `WHERE ... IN` instead of a join
- `INNER JOIN` on two keys (state and week)
- A subquery in `FROM`
- Charts made with the SQL app's built-in visualizer (included in the PDF)

## Approach

1. Counted job requests per month and charted them to look for seasonality.
2. Counted how many times each calendar month appears in the job data.
3. Counted weather events per month, limited to the job data's date range and then to states that appear in the job data.
4. Joined weekly weather counts to jobs by state and week.
5. Counted jobs and weather events per state and week, and plotted one against the other with a trendline.

## Key findings

- **Job requests are seasonal:** lowest in winter (January and February), highest in summer (May to September), and higher each year.
- **Weather events follow the same pattern**, low in winter and high in summer, with steeper rises and falls than job requests. Limiting the data to states in the job data keeps the pattern but changes how steep it is.
- **Weather and job requests have a positive relationship.** The scatterplot shows wide scatter at low event counts, which points to other factors as well, and a steadier relationship as event counts rise.
- **Other possible drivers:** government policy and aid after a storm, regular regional patterns, and demand for fast rebuilding. Data on how much rebuilding was needed after each event would help.

## Running the queries

The queries cannot be re-run outside the program. The data exists only in the Global Career Accelerator SQL app, and this repo does not include it.

`sql/queries.sql` holds the queries exactly as written in the completed document, in order, each labeled with its task. Tasks without a query (1B, 2D, 3C and 3D) were written answers.

## Repo structure

```
construction-job-demand-sql/
├── sql/
│   └── queries.sql                    the queries, labeled by task
└── project-pdf/
    └── construction-job-demand.pdf    full completed document with written answers and charts
```
