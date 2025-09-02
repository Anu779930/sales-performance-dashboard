# DAX Measures – Superstore Sales Dashboard

These are the main DAX measures I created for my Power BI dashboard.  
They power the KPI cards at the top (Sales, Profit, Average Order Value, Profit Margin) and make the report more insightful.

---

## Core KPIs

```DAX
Total Sales =
SUM('Sample - Superstore'[Sales])

Total Profit =
SUM('Sample - Superstore'[Profit])

Total Orders =
DISTINCTCOUNT('Sample - Superstore'[Order ID])
```

---

## Business Metrics

```DAX
Average Order Value =
DIVIDE([Total Sales], [Total Orders], 0)

Profit Margin % =
DIVIDE([Total Profit], [Total Sales], 0)
```

I used these two to highlight **efficiency**:  
- *Average Order Value* shows how much revenue each order brings in.  
- *Profit Margin %* tells us profitability, not just revenue.

---

## Notes

- I formatted **AOV** as a currency with 2 decimals and **Profit Margin %** as a percentage with 1–2 decimals.  
- These measures fed into **Card visuals** so that KPIs are always visible at the top.  
- Keeping visuals consistent, I used **blue for Sales** and **green for Profit** across the dashboard.  

---

## (Optional, Future Enhancements)

I experimented with YoY and MoM sales growth using time intelligence functions.  
This requires a proper Date table in Power BI, so I’ve left it as an optional extension:

```DAX
YoY Sales % = 
VAR Prev =
    CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Sample - Superstore'[Order Date]))
RETURN DIVIDE([Total Sales] - Prev, Prev)
```

```DAX
MoM Sales % =
VAR PrevMonth =
    CALCULATE([Total Sales], DATEADD('Sample - Superstore'[Order Date], -1, MONTH))
RETURN DIVIDE([Total Sales] - PrevMonth, PrevMonth)
```

These could be used in tooltips on the line chart to add growth insights.
