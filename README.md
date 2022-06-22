# Pewlett-Hackard Analysis

## Overview:
 
The goal of this analyis is to determine, for the fictional  **Pewlett-Hackard Company**,  how many **retiring employees** the company would have in **each job role/title**, and subsequently how many retiring employees would be available for a **mentorship program**. 

## Results:
- Pewlett-Packard faces a total of 72,458 employee retirements in the near term. This represents 30% of the existing work force (70,458/240,124).

```
Total employee count was calculated using the following query:
select count(e.emp_no) as total
from employees e
INNER JOIN titles t
	ON (e.emp_no = t.emp_no)
where t.to_date = '9999-01-01'
group by e.emp_no;
```


- The retirements are broken down by department as follows:

![Retirees by dept](Roles_by_title_with_total.png)

- 70 % of retiring employees, 50,842, are considered senior (26K senior engineers, 25K senior staff).


- We have identified 1,940 potential mentors from the retiring employee group.  The mentors are divided by current role as follows:

![Mentors by dept](Mentor_count_by_role.png)

## Summary:
Results: Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?


## Overview of the analysis:

The purpose of the new analysis is well defined. (3 pt)
Results:

There is a bulleted list with four major points from the two analysis deliverables. (6 pt)
Summary:

The summary addresses the two questions and contains two additional queries or tables that may provide more insight. (5 pt)
