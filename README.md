# CaseStudy2DDS

## This employee attrition model seeks to analyze the relationship of over 30 variables on employee attrition levels in the Frito Lay Coorporation. Employee attrition is the process whereby a company loses its employees through self election, usually because of a lack of satisfaction or better opportunities elsewhere. Companies spend millions of dollars annually to hire, process, and train talent to make their workforce efficient and productive. Conversely, a talented workforce that is dedicated to a job can increase efficiency in production, reduce workhours, and invite innovation that can save a coorporation millions. Our approach to analyzing the data began with a visual analysis of the impact of certain variables on attrition. The visual analysis was then buttressed with tests using multiple regression models. We then used a stepwise analysis process to identify the most powerful and useful variables to test against attrition. For this study, we used three prediction models, a K to the nearest neighbor (KNN) model, a Naive Bayes model, and a predictive regression model. We tested these models against various variable patterns (using stepwise analysis: Forward, Backward, and Both) to identify which variables had the most statistically significant impact on Attrition rates.

## Monthly Income Analysis: The Root Mean Squared Error (RMSE) for this model is 2787.3 (Statistically significant)

## Employee Attrition Model:
### *   Accuracy - the model's ability to accurately predict Attrition is 83 percent
### *   Sensitivity – the model’s ability to predict true positives – 70 percent
### *   Specificity – the model’s ability to predict true negatives – 85.5 percent



# Variable Definitions:
## Age: Employee age
## Attrition: if the employee leaves the job (1 = Yes, 0 = No)
## BusinessTravel: The frequency of job travels
## DailyRate: Billing cost for employee’s services for a single day
## Department: Employee work department
## DistanceFromHome: Distance traveled to work from home
## Education: Employee education level (1 = Below College, 2 = College, 3 = Bachelor, 4 = Master, 5 = Doctor)
## EducationField: Employee education field
## EmployeeCount: Employee Count (Constant)
## EmployeeNumber: Employee ID
## EnvironmentSatisfaction: Num value for environment satisfaction (1 = Low, 2 = Medium, 3 = High, 4 = Very High)
## Gender: Employee gender
## HourlyRate: The amount of money that employee earns for every hour worked
## JobInvolvement: Numerical value for job involvement (1 = Low, 2 = Medium, 3 = High, 4 = Very High)
## JobLevel: Numerical value for job level
## JobRole: Employee job position
## JobSatisfaction: Numerical value for job satisfaction (1 = Low, 2 = Medium, 3 = High, 4 = Very High)
## MaritalStatus: Employee marital status
## MonthlyIncome: The amount of money that employee earns in one month, before taxes or deductions
## MonthlyRate: Billing cost for employee’s services for a month
## NumCompaniesWorked: Number of companies worked at
## Over18: if employee is over 18 years old
## OverTime: if employee works overtime
## PercentSalaryHike: Percent increase in salary
## PerformanceRating: Numerical value for performance rating (1 = Low, 2 = Good, 3 = Excellent, 4 = Outstanding)
## RelationshipSatisfaction: Numerical value for relationship satisfaction (1 = Low, 2 = Medium, 3 = High, 4 = Very High)
## StandardHours: Hours employee spent working (Constant)
## StockOptionsLevel: Numerical value for stock options
## TotalWorkingYears: Total number of years employee worked
## TrainingTimesLastYear: Hours employee spent on training last year
## WorkLifeBalance: Numerical value for work life balance (1 = Bad, 2 = Good, 3 = Better, 4 = Best)
## YearsAtCompany: Number of years employee worked at company
## YearsInCurrentRole: Number of years employee worked as their current job role
## YearsSinceLastPromotion: Number of years since last promotion
## YearsWithCurrentManager: Number of years employee worked with current manager

## These models draw on code chuncks from sources such as SMU's DDS class lectures, Internet Sources, such as (https://bradleyboehmke.github.io/HOML/knn.html, https://rpubs.com/mary18/929056, https://rpubs.com/hanifahpl/emp_att, https://www.datacamp.com/tutorial/k-nearest-neighbors-knn-classification-with-r-tutorial), and chatGPT.
