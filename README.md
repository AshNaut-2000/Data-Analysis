# Data-Analysis
PW Skills Data Analysis with Gen AI Course Assignments and Projects

## Sales data sample

Run `sales_data.sql` with SQLite to recreate the `salesdata` table and populate it with 10,000 randomly generated synthetic records:

```sh
sqlite3 Data-Analysis.db < sales_data.sql
```

The script replaces any existing `salesdata` table, then creates these columns: `customerid`, `name`, `age`, `city`, `purchaseamount`, and `purchasedate`. It finishes with a row-count query; the expected result is `10000`.
