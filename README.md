# 🚀 Lending Risk & Profitability Analytics Dashboard

## 📌 Project Overview

**LendInsight** is an end-to-end lending analytics project designed to analyze **loan portfolio performance, borrower risk, and financial sustainability** using SQL and Power BI.

This project simulates a real-world fintech analytics workflow by transforming raw lending data into **actionable business insights**.

---

## 🎯 Objectives

- Analyze overall loan portfolio health  
- Identify high-risk borrower segments  
- Evaluate profitability and financial impact  
- Support data-driven lending decisions  

---

## 🏗️ Project Architecture
Raw Dataset (CSV)
↓
Data Cleaning & Transformation (MySQL)
↓
Feature Engineering (SQL)
↓
Data Modeling (Power BI)
↓
KPI Calculation (DAX)
↓
Interactive Dashboard (3 Pages)
↓
Business Insights


---

## 🗂️ Dataset

- Source: Lending dataset (Kaggle)
- Records: ~1M+ loan entries

### Key Features:
- Loan Details → `loan_amnt`, `term`, `int_rate`  
- Borrower Info → `annual_inc`, `dti`, `home_ownership`  
- Loan Outcome → `loan_status`  
- Financial Metrics → `total_pymnt`, `total_rec_prncp`  

---

## ⚙️ Data Processing (MySQL)

### Key Transformations:

- Created `default_flag`  
  - Charged Off → 1  
  - Others → 0  

- Converted loan term:
  - "36 months", "60 months" → `36`, `60`

- Cleaned and standardized numeric columns  
- Selected relevant columns for analytics  

---

## 🧮 KPI Development (DAX)

Key metrics created:

- Total Loans  
- Default Rate (%)  
- Total Interest Earned  
- Principal Loss  
- Net Realized Profit  
- Recovery Rate (%)  

---

## 📊 Dashboard Overview

The dashboard is divided into **3 analytical layers**:

---

### 📌 Page 1 — Portfolio Overview

**Objective:** Understand overall portfolio health  

**Visuals:**
- KPI Cards (Loans, Default Rate, Profit, Loss)  
- Default Rate by Credit Grade  
- Default Rate by Loan Term  
- Loan Status Distribution  

**Key Insights:**
- Default Rate ≈ **8.99%**  
- Higher risk in Grades F & G  
- 60-month loans show higher default rates  

---

### 🔍 Page 2 — Risk Segmentation

**Objective:** Identify high-risk borrower segments  

**Visuals:**
- Heatmap → Credit Grade × Income Band  
- Default Rate by DTI Band  
- Default Rate by Loan Purpose  
- Geographic Risk Map  

**Key Insights:**
- Highest risk: **Grade G + Low Income (~40%)**  
- Default increases significantly beyond **30% DTI**  
- Certain loan purposes (e.g., small business) carry higher risk  

---

### 💰 Page 3 — Profitability & Exposure

**Objective:** Evaluate financial sustainability  

**KPIs:**
- Total Funded Amount → $16.13B  
- Total Interest Earned → $2.11B  
- Principal Loss → $1.10B  
- Net Realized Profit → **-$157.9M**  
- Recovery Rate → 25.32%  

**Visuals:**
- Net Profit by Grade  
- Principal Loss by Grade  
- Exposure by Grade (Treemap)  
- Exposure by Loan Term  

**Key Insights:**
- Grades A & B → Profitable  
- Grades C–G → Loss-driving  
- High exposure in mid-risk segments increases losses  

---

## 🧠 Key Business Insights

- Risk increases with:
  - Lower income  
  - Higher DTI  
  - Lower credit grade  

- Loan tenure impacts default:
  - 60-month loans are riskier  

- Portfolio shows:
  - Significant **principal loss concentration**  
  - **Negative realized profitability**  

---

## 🛠️ Tech Stack

- **MySQL** → Data cleaning & transformation  
- **Power BI** → Dashboard visualization  
- **DAX** → KPI calculations  

---

## 🎯 Project Outcome

This project demonstrates:

- End-to-end data analytics workflow  
- Risk segmentation and borrower profiling  
- Financial impact and profitability analysis  
- Business-driven decision support  

---

## 🎤 Interview Summary

> Built an end-to-end lending analytics dashboard using SQL and Power BI to analyze portfolio performance, identify high-risk borrower segments, and evaluate financial sustainability through risk and profitability metrics.

---

## 📌 Future Enhancements

- Add machine learning model for default prediction  
- Implement real-time data pipeline  
- Build automated alerts for high-risk segments  

---

## ⭐ Final Note

This project showcases how data analytics can be used to:

✔ Improve credit risk decisions  
✔ Optimize loan approval strategies  
✔ Enhance financial performance monitoring  

---
