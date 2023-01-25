-- In this data exploration, we will take a look at the top colleges of 2022. The dataset contains several variables which may be interesting 
-- analyze such as salary, student population, campus setting. 

-- First, we will view the total table with all columns

SELECT * FROM colleges.top_colleges_2022;

-- We will get rid of any unnecessary columns and be left with relevant ones to our exploration

-- Select the columns we will be using

SELECT ranking, organizationName, state, studentPopulation, campusSetting, medianBaseSalary, city, region, collegeType, studentFacultyRatio, totalStudentPop, undergradPop, totalGrantAid, percentOfStudentsGrant
FROM colleges.top_colleges_2022;

-- First, we are interested in how the undergrad population affects the ranking of the colleges

-- We find the percentage of student population that are undergrad

SELECT ranking, organizationName, studentPopulation, undergradPop, (undergradPop/studentPopulation) as UndergradRatio
FROM colleges.top_colleges_2022;

SELECT ranking, organizationName, studentPopulation, undergradPop, (undergradPop/studentPopulation) as UndergradRatio
FROM colleges.top_colleges_2022
ORDER BY UndergradRatio desc;

-- It appears that a decent amount of the higher ranked colleges have a complete 1 ratio for undergrads

-- Now we will look at the salaries

SELECT ranking, organizationName, MAX(medianBaseSalary) as HighestSalary
FROM colleges.top_colleges_2022
GROUP BY ranking, organizationName
ORDER BY HighestSalary desc;

-- Let's break it down by state

SELECT state, MAX(medianBaseSalary) as HighestSalary
FROM colleges.top_colleges_2022
GROUP BY state
ORDER BY HighestSalary desc;

-- Select organization with the maximum salary

SELECT *
FROM colleges.top_colleges_2022
WHERE medianBaseSalary = (select Max(medianBaseSalary) from colleges.top_colleges_2022);

-- MIT has the highest salary of the colleges

-- Select second highest salary

SELECT Max(medianBaseSalary)
FROM colleges.top_colleges_2022
WHERE medianBaseSalary Not In (select Max(medianBaseSalary) from colleges.top_colleges_2022)

-- We get second highest salary is 173500