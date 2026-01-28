# Intraday-Stock-Market-Analytics-Pipeline-Project
An end-to-end automated intraday analytics system for Indian stock markets (NSE), built using Python, SQL Server, and Power BI.
The project ingests 5-minute live market data, processes it safely, stores it in a relational database, and powers interactive dashboards for real-time insights.

🎯 Project Objective

To design and implement a production-style data pipeline that:

Fetches intraday NSE stock data every 5 minutes

Handles real-world API inconsistencies

Stores clean, analytics-ready data in SQL Server

Serves structured views to Power BI dashboards

This project simulates how intraday market data is handled in real analytics and trading environments.

🧱 Tech Stack

Python 3.10

yfinance (NSE intraday market data)

pandas

SQL Server Express

Windows Task Scheduler

Power BI

🔄 Architecture & Data Flow
yfinance (NSE 5-minute data)
        ↓
Python ETL Pipeline
        ↓
SQL Server (Tables + Analytics Views)
        ↓
Power BI Dashboards

📊 Data Collected

Stock Symbol

Datetime (IST)

Open

High

Low

Close

Volume

Granularity: 5-minute intraday candles

🗄️ Database Design
Tables

intraday_market_data

stock_metadata

SQL Views (used by Power BI)

intraday_base

day_reurn

latest_price

intraday_returns

day_data

Views are used instead of raw tables to ensure clean, consistent, and analytics-ready data for reporting.

⏱ Automation & Scheduling

Python ETL runs every 5 minutes

Scheduled using Windows Task Scheduler

Executes only during NSE market hours (09:15 – 15:30 IST)

Automatically skips weekends and non-trading hours

Execution logs generated for monitoring and debugging

📈 Power BI Dashboards
Page 1 – Market Overview

<img width="1104" height="618" alt="image" src="https://github.com/user-attachments/assets/9232e17d-9a59-4a25-ac93-7f4e649f63de" />


Page 2 – Stock Details Drill-Through
<img width="1103" height="624" alt="image" src="https://github.com/user-attachments/assets/305c1a75-639e-4241-b134-5c6ecee51b72" />


🧪 Current Status

✅ Fully automated pipeline

✅ SQL Server updated every 5 minutes

✅ Power BI connected via SQL views

✅ Scheduler tested and stable

✅ API edge cases handled

🔑 What This Project Demonstrates

Real-world data engineering practices

Handling unreliable real-time APIs

Scheduler-based automation

SQL analytics modeling using views

End-to-end Python → SQL → Power BI integration

Production-oriented thinking for analytics systems

📌 Author
Adnan Khader
Aspiring Data Analyst / Data Engineer
