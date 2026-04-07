# User Behavior & Content Discovery Analysis

## Overview
Analysis of 2.7M ecommerce events to understand how discovery behavior 
(search vs browse) affects conversion rates and purchase funnel performance.

## Dataset
Retailrocket eCommerce dataset — 2.7M events from 1.4M users over 4.5 months.
Events include: views, add-to-carts, and transactions.

## Tools
- PostgreSQL — data storage and analysis
- Python (Pandas, Matplotlib) — visualization
- VS Code + SQLTools — development environment

## Methodology
Users were segmented into discovery channels based on behavioral proxies:
- **Search-type**: viewed 1-2 items (high intent, low exploration)
- **Browse-type**: viewed 10+ items (low intent, high exploration)
- **Mixed**: everything in between

## Key Findings

1. Browse-intent users convert at 15% vs 0.52% for search-intent users — 
   a 29x gap — suggesting recommendation and discovery features drive 
   significantly more revenue than direct search.

2. Browse users show 4x higher view-to-cart rates (6.43% vs 1.56%), 
   indicating that product discovery features keep users engaged throughout 
   the funnel.

3. Once browse users add to cart, they complete the purchase at 43% vs 27% 
   for search users — suggesting browse-driven users have stronger purchase 
   commitment once they find a product they like.

## Business Recommendations
- Invest in recommendation and discovery features to increase browse-type 
  sessions
- Optimize cart-recovery campaigns for mixed-intent users who show high 
  drop-off between cart and purchase
- Don't optimize search at the expense of discovery — browse users are your 
  highest-value segment

## Files
- `sql/01_classification.sql` — user segmentation logic
- `sql/02_conversion.sql` — conversion rate by discovery channel
- `sql/03_funnel.sql` — funnel drop-off analysis
- `notebooks/visualize.ipynb` — Python visualizations