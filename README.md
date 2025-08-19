# Netflix Data Analysis using dbt & Snowflake

This project demonstrates an end-to-end workflow for analyzing Netflix dataset using **dbt** and **Snowflake**. It covers data ingestion, transformation, testing, snapshots, and analysis, with best practices for modular, scalable, and maintainable pipelines.

---

## Project Overview

- **Data Source**: MovieLens / Netflix dataset (dataset: https://grouplens.org/datasets/movielens/20m/)
- **Tools Used**: dbt, Snowflake, Python (for environment setup)
- **Key Concepts Covered**:
  - Staging and dimension models
  - Fact tables
  - Incremental & ephemeral models
  - Snapshots for Type 2 Slowly Changing Dimensions (SCD)
  - Generic and singular dbt tests
  - Macros for reusable SQL logic
  - Analysis queries for reporting
  - dbt documentation generation

---

## Folder Structure
models/

│

├── staging/ # Raw data transformations and cleaning

├── dim/ # Dimension tables

├── fact/ # Fact tables with measurable metrics

├── snapshots/ # Historical SCD tables

├── analyses/ # Ad-hoc or exploratory queries

macros/ # Reusable SQL logic
tests/ # Custom singular tests

## Key Steps

1. **Data Ingestion**
   - Load raw CSV files or connect Snowflake tables.
   - Use `dbt seed` to load small static datasets.

2. **Staging Models**
   - Clean raw data, standardize columns, and create staging views.
   - Example: `src_movies` with cleaned movie titles and genre arrays.

3. **Dimension & Fact Tables**
   - Transform staging views into dimension tables (`dim_movies`, `dim_tags`) and fact tables (`fct_ratings`, `fct_genome_scores`).
   - Implement incremental models for large datasets to optimize performance.

4. **Snapshots**
   - Track historical changes for Type 2 SCD.
   - Example: `snap_tags` captures historical changes in tags.

5. **Testing**
   - Generic tests: unique, not_null, accepted_values, relationships.
   - Singular tests: custom SQL checks like `relevance_score > 0`.
   - Use macros for reusable validations.

6. **Analysis**
   - Write ad-hoc queries under `analyses/`.
   - Example: Top 20 movies by average rating with at least 100 ratings.
   - Compile queries using `dbt compile` and run in Snowflake or downstream tools like Power BI.

7. **Documentation**
   - Generate project documentation using `dbt docs generate`.
   - View lineage, model dependencies, and column-level metadata.
