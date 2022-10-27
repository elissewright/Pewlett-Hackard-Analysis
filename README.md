# **Pewlett Hackard Employee Database Analysis**

## **Overview:**
### Pewlett Hackard is a large company with hundreds of thousands of loyal employees, many of whom have been with the company for decades and will be eligible for retirement soon. The organization is anticipating what they have referred to as a "silver tsunami", as these employees retire and leave vacancies across several departments. In order to fill these critical roles, Hewlett Packard has created a mentorship program and is seeking to recruit qualified employees in order to train a new generation and fill these critical roles. 
### This analysis, performed in PostgreSQL, will determine the number of workers by title who may retire in coming years, and identify other employees who may be a good fit for the mentorship program and promotion to these roles. 

## **Results:**
### Pewlett hackard employees eligible for retirement and at higher risk of leaving open vacancies are defined as those born between the years of 1952-1955. In order to evaluate the extent to which these prospective vacancies may impact the company over the coming years, we identified employees who fit this criteria, as well as the number of years they have been employed with the company, their employee number(s), and their job title(s). 

### We then defined any current employees who were born within the year of 1965 as eligible for the mentorship program; in order to assess whether the eligible individuals will be sufficient to lessen the impact of anticipated retirements at Pewlett Hackard, we created a table of individuals who fit the birthdate criteria, along with their titles, employee number(s) and duration of employment with the organization. These numbers were then compared to the number of individuals eligible for retirement from the first table.
 
* While analysis initially suggested a total of 90,398 employees eligible for retirement, many of these individuals have worked in multiple roles across their employment with Pewlett Hackard, or are not currently employed; the number of current employees set to retire from distinct positions is 72,458. 
* Across these distinct positions that may need to be filled soon, the majority include Senior Engineer, Senior Staff, and Engineer roles.  
![Distribution of Retirement-Eligible Employees by Current Role](https://github.com/elissewright/Pewlett-Hackard-Analysis/blob/main/retiring_employees_by_title.png)
* A total of 1,549 employees are eligible for participation in the mentorship program.
* While many of these individuals are also currently employed in senior roles or Engineering positions, there is only 1 mentorship program eligible employee for every 46 retirement eligible employees. This suggests the company is not prepared for the upcoming waves of retirements. 

## **Summary:**
### Our analysis reveals that a total of 72,458 distinct positions may be left open as long-standing PH employees begin to retire. A large proportion of these positions are senior roles, including critically important Engineering ones. 
### Compared to these numbers, there are a total of 1,549 current Pewlett Hackard employees eligible for the mentorship program, suggesting the company may not be adequately prepared for the anticipated wave of retirements.  
### While our initial analysis did not evaluate the distribution of job titles among employees eligible for the mentorship program, we performed an additional query in order to assess this data. Much like the distribution of roles for retirement eligible employees, individuals eligible for the mentorship program primarily occupy roles in Engineering and Staff. This is encouraging, despite the much smaller numbers. 
![Mentorship Eligible Job titles](https://github.com/elissewright/Pewlett-Hackard-Analysis/blob/main/mentorship_eligibility_titles.png)
### An additional query could be performed in order to evaluate the distribution of younger employees across various roles in order to determine whether there are adequate numbers of Assistant Engineers who may serve as mentees in the mentorship program, and be eligible for future promotion into unfilled senior roles. 
