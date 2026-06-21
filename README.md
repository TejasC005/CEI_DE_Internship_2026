# Shopping Dataset Analysis & Pipeline

This repository contains the Exploratory Data Analysis (EDA), data cleaning pipeline, and insights dashboard built for the shopping dataset assignment. The primary goal is to take raw, unformatted product information from Myntra, clean it, extract new features, and construct a sequential visualization flow to understand platform pricing, ratings, and category trends.

---

## Repository Structure

```text
CEI_DE_Internship_2026/
├── Assignement 1/
│   ├── data/
│   │   ├── Combined_dataset.csv     # Raw dataset (1,000 products, 24 features)
│   │   └── cleaned_data.csv        # Cleaned dataset (exported via pipeline)
│   └── notebook/
│       └── shopping_analysis_on_combined_data.ipynb  # Main EDA & analysis notebook
└── README.md                       # Documentation
```

---

## Pipeline Overview

The project is structured sequentially inside the notebook following standard data engineering and analytical workflows:

### 1. Data Loading & Inspection
* Loading the raw dataset using `pandas` and checking basic attributes (shape, schemas, and columns).
* Analyzing missingness ratios to map out where data imputation is necessary.

### 2. Data Cleaning & Normalization
* **Currency Formatting**: Cleans the `final_price` column by removing currency symbols (`₹`), quotes, and comma separators, casting the final values to float.
* **Missing Value Imputation**: 
  * Missing discount percentages are filled with `0` (indicating no discount).
  * Missing text fields like `seller_name`, `seller_information`, `what_customers_said`, `videos`, and `variations` are imputed with `'Not Available'`.
* **Deduplication**: Automatically checks for and removes duplicate rows.
* **CSV Export**: The cleaned dataframe is exported directly to `../data/cleaned_data.csv`.

### 3. Feature Engineering
* **Savings Indicator (`price_difference`)**: Calculates the absolute difference between `initial_price` and `final_price`.
* **Popularity Score**: Combines `rating` with the log-transformed `ratings_count` (i.e., `rating * log1p(ratings_count)`) to measure product engagement without letting outlier review counts dominate.
* **Image Count (`num_images`)**: Counts the number of product images provided in the comma-separated listing.

### 4. Sequential Visualization Flow
All plots are designed to be clean, professional, and visually minimal, utilizing a muted steel-blue (`#4A607A`) and gray palette:
* **Univariate Analyses**: Individual rating, review volume, final price, and discount percentage distributions.
* **Bivariate Relations**: Scatter plots of discount vs. price metrics, and a clean lower-triangle correlation heatmap.
* **Category Metrics**: Average final price and average rating (plotted against the overall average benchmark) for the top 10 categories.
* **Detailed Distributions**: Boxplots of price spreads across top-volume categories.
* **Dashboard Indicators**: Visualizing category distribution shares (pie chart with a dark-to-light gradient), average discount rates, popularity vs. pricing, and average pricing across rating brackets.

---

## Key Analytics & Business Insights

* **Product Dominance**: Fashion categories (`tops`, `dresses`, `shirts`) form the core volume of listings.
* **Pricing Skew**: The final price distribution is heavily right-skewed. Most listings concentrate under Rs. 3,000, signaling a platform focus on budget and mid-range buyers.
* **Reviews and Visibility**: Several highly-rated products (4.5+) suffer from low popularity scores because of a small review footprint, pointing to an opportunity to encourage reviews post-purchase.
* **Discount Dynamics**: Categories show distinct discount profiles. Some premium categories like jewelry/accessories maintain deep discounts to move stock, while other utility categories maintain higher base prices with fewer markdowns.
