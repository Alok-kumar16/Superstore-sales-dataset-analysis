🛒 Northwind Retail: Profitability Analysis

## The Problem:

I took on a simulated brief from "Northwind Retail Co." Leadership had noticed something concerning: even though online sales kept growing, profit margins seemed to be shrinking over the past two years.
Nobody knew exactly why. Some product categories looked like they were losing money, a few regions weren't pulling their weight, and heavy discounting was the leading suspect.

My job: dig into the sales data, find out where the money was actually going, and come back with a clear answer with dashboard and real recommendation.

## How I Approached It

I worked through this the way I'd want to on an actual analyst team:
- Cleaned and explored the data in Python
- Validated the key numbers in SQL (MySQL) 
- Built an interactive Tableau dashboard so the findings would actually be usable by someone who isn't a data person

The dataset covered about 10,000 orders across four years — sales,profit,discounts,regions,categories,and customer segments.

## What I Actually Found

**The starting assumption was wrong.** Margins hadn't shrunk at all ,they'd gone up, from 10.2% in 2011 to 12.7% in 2014. 
That was honestly the most interesting moment of the project: instead of just answering the question I was asked, I checked whether the question itself held up. It didn't.
**Discounting past ~20% is where things fall apart.** Average profit per order goes negative once discounts cross into the 20–30% range
**The losses weren't spread evenly.** Just three sub-categories — Tables, Bookcases, and Supplies — were dragging things down. 
**A few individual products, not whole categories, were the real damage.** Three specific Technology products alone accounted for over $17,000 in losses — a pricing issue, not a discounting one.
**Home Office customers were quietly the best segment.** Lowest sales volume of the three segments, but the highest profit margin at 14%.

## What I'd Recommend

1. Cap discounts on Tables and Bookcases at 20%
2. Look specifically at how discounts get approved in the East region
3. Dig into why those 3 Technology products are losing so much — likely a cost/pricing problem, not discounting
4. Put more marketing effort behind Home Office customers, they're the most efficient segment by far

## Dashboard

Full interactive Tableau dashboard here: https://public.tableau.com/views/Northwind_17880051843720/Dashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link 
(view in full screen(f7))

