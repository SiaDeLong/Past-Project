#Sia De Long
#TP060810


# ======================= Install Packages =========================
install.packages("ggplot2")
install.packages("dplyr")
install.packages("cowplot")


# ======================= Load Libraries =========================
library(ggplot2)
library(dplyr)
library(cowplot)


# ======================= Import Datasets =========================
# Ensure student.csv can be found in the files tab of Rstudio first
setwd("C:/Users/Sia De Long/Desktop/PFDA assignment")
raw = readLines("student.csv")
raw = gsub("\"", "", raw)
students = read.table(text = raw, sep = ';', quote = ';', header = T)

# Check data
str(students)
summary(students)
View(students)


# ======================= Data Pre-processing =========================
# Rename dataset header
names(students) = c("School_Name", "Sex", "Age", "Living_Area", 
                    "Family_Size", "Cohabitation_Status", "Mother_Education",
                    "Father_Education", "Mother_Job_Type",  "Father_Job_Type",
                    "Reason_Choosing_School", "Guardian",
                    "Travel_Time", "Study_Time", "Past_Failures", 
                    "School_Extra_EduSup", "Family_Extra_EduSup", 
                    "Paid_Extra_Class", "Cocurricular_Activity", 
                    "Attended_Nursery_School", "Wanting_Higher_Education", 
                    "Internet_At_Home", "Couple_Relationship", 
                    "Family_Relationship", "Free_Time", "Hang_Out", 
                    "WeekDay_Alcohol_Consumed", "Weekend_Alcohol_Consumed", 
                    "Health_Status", "School_Absences", "G1", "G2", "G3")

# Change suitable string for sex attribute
students$Sex[students$Sex == "M"] = "Male"
students$Sex[students$Sex == "F"] = "Female"

# Change suitable string for mother job type attribute
students$Mother_Job_Type[students$Mother_Job_Type == "teacher"] = "Teacher"
students$Mother_Job_Type[students$Mother_Job_Type == "health"] = "Health Care"
students$Mother_Job_Type[students$Mother_Job_Type == "services"] = "Civil Services"
students$Mother_Job_Type[students$Mother_Job_Type == "at_home"] = "Work At Home"
students$Mother_Job_Type[students$Mother_Job_Type == "other"] = "Other" 

# Change suitable string for father job type attribute
students$Father_Job_Type[students$Father_Job_Type == "teacher"] = "Teacher"
students$Father_Job_Type[students$Father_Job_Type == "health"] = "Health Care"
students$Father_Job_Type[students$Father_Job_Type == "services"] = "Civil Services"
students$Father_Job_Type[students$Father_Job_Type == "at_home"] = "Work At Home"
students$Father_Job_Type[students$Father_Job_Type == "other"] = "Other" 

# Change suitable string for family size attribute
students$Family_Size[students$Family_Size == "GT3"] = "Greater Than 3"
students$Family_Size[students$Family_Size == "LE3"] = "Less Than 3"

#Change suitable string for living area attribute
students$Living_Area[students$Living_Area == "R"] = "Rural Area"
students$Living_Area[students$Living_Area == "U"] = "Urban Area"

#Change suitable string for cohabitation status attribute
students$Cohabitation_Status[students$Cohabitation_Status == "A"] = "Living Apart"
students$Cohabitation_Status[students$Cohabitation_Status == "T"] = "Living Together"

#Change suitable string for reason choosing school attribute
students$Reason_Choosing_School[students$Reason_Choosing_School == "course"] = "Interest in Course"
students$Reason_Choosing_School[students$Reason_Choosing_School == "home"] = "Close to Home"
students$Reason_Choosing_School[students$Reason_Choosing_School == "other"] = "Other"
students$Reason_Choosing_School[students$Reason_Choosing_School == "reputation"] = "School Reputation"


# ======================= Question 1 ========================================
# What is the personal attribute affecting student performance?
# ===========================================================================
# ----------------------------- Exploration -----------------------------
# "Sex", "Age", "Reason_Choosing_School", "Study_Time",
# "Wanting_Higher_Education", "School_Absences"

# Sex
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Sex)) +
  labs(title = "Frequency Distribution of G1 Result by Sex",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Sex)) +
  labs(title = "Frequency Distribution of G2 Result by Sex",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Sex)) +
  labs(title = "Frequency Distribution of G3 Result by Sex",
       x = "G3",
       y = "Number of Students")

# Age
ggplot(students, aes(x = G1, y = Age)) +
  geom_count() +
  labs(title = "Frequency Distribution of G1 Result by Age",
       x = "G1",
       y = "Age")
ggplot(students, aes(x = G2, y = Age)) +
  geom_count() +
  labs(title = "Frequency Distribution of G2 Result by Age",
       x = "G2",
       y = "Age")
ggplot(students, aes(x = G3, y = Age)) +
  geom_count() +
  labs(title = "Frequency Distribution of G3 Result by Age",
       x = "G3",
       y = "Age")

# Reason_Choosing_School
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Reason_Choosing_School)) +
  labs(title = "Frequency Distribution of G1 Result by Reason Choosing School",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Reason_Choosing_School)) +
  labs(title = "Frequency Distribution of G2 Result by Reason Choosing School",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Reason_Choosing_School)) +
  labs(title = "Frequency Distribution of G3 Result by Reason Choosing School",
       x = "G3",
       y = "Number of Students")

# Study_Time
ggplot(students, aes(x = G1, y = Study_Time)) +
  geom_boxplot(aes(group = Study_Time)) +
  labs(title = "Frequency Distribution of G1 Result by Study Time",
       x = "G1",
       y = "Study Time")
ggplot(students, aes(x = G2, y = Study_Time)) +
  geom_boxplot(aes(group = Study_Time)) +
  labs(title = "Frequency Distribution of G2 Result by Study Time",
       x = "G2",
       y = "Study Time")
ggplot(students, aes(x = G3, y = Study_Time)) +
  geom_boxplot(aes(group = Study_Time)) +
  labs(title = "Frequency Distribution of G3 Result by Study Time",
       x = "G3",
       y = "Study Time")

# Wanting_Higher_Education
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Wanting_Higher_Education)) +
  labs(title = "Frequency Distribution of G1 Result by Wanting Higher Education",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Wanting_Higher_Education)) +
  labs(title = "Frequency Distribution of G2 Result by Wanting Higher Education",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Wanting_Higher_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Wanting Higher Education",
       x = "G3",
       y = "Number of Students")

# School_Absences
ggplot(students, aes(x = G1, y = School_Absences)) +
  geom_count() +
  labs(title = "Frequency Distribution of G1 Result by School Absences",
       x = "G1",
       y = "School Absences")
ggplot(students, aes(x = G2, y = School_Absences)) +
  geom_count() +
  labs(title = "Frequency Distribution of G2 Result by School Absences",
       x = "G2",
       y = "School Absences")
ggplot(students, aes(x = G3, y = School_Absences)) +
  geom_count() +
  labs(title = "Frequency Distribution of G3 Result by School Absences",
       x = "G3",
       y = "School Absences")


# ----------------------------- Data Manipulation -----------------------------
# Main data sets
Question1Data = students %>%
  mutate(Final_Result = round((G1+G2+G3)/60*100, digits = 2)) %>%
  select(Sex, Age, Reason_Choosing_School, Study_Time, 
        Wanting_Higher_Education, School_Absences, Final_Result) %>%
  arrange(Final_Result)
# Arrange columns name
  Question1Data = Question1Data %>%
  select(order(colnames(Question1Data)))

View(Question1Data)
str(Question1Data)
summary(Question1Data)

# ----------------------------- Visualization -----------------------------
# ----------------------------- Analysis 1 -----------------------------
# Determine the Relationship between Final Result and Age in Different Sex

# Population Pyramid Graph
studentFrequency = Question1Data %>%
  ggplot(aes(x = Age, fill = Sex)) +
  geom_bar(data = subset(students, Sex == "Male")) + 
  geom_bar(data = subset(students, Sex == "Female"), aes(y=..count..*(-1)))  + 
  scale_y_continuous(breaks=seq(-150,150,10),labels=abs(seq(-150, 150,10))) + 
  coord_flip() +
  labs(title = "Number of Female and Male students in diferent age",
       x = "Age",
       y = "Frequency")
studentFrequency

# Boxplot and Jitter plot
Final_Age_Sex = Question1Data %>%
  ggplot(aes(x = Age, y = Final_Result)) +
  geom_boxplot(aes(group = Age)) +
  geom_jitter(alpha = 0.4, aes(color = Sex)) +
  facet_wrap(~Sex) +
  labs(title = "Relationship Between Final Result And Age In Different Sex",
       x = "Age",
       y = "Final Result(%)")
Final_Age_Sex

# Display both graph
plot_grid(studentFrequency, Final_Age_Sex, nrow = 2)
# -Female students tend to produce higher performance in age of 17
# -Male students tend to produce higher performance in age of 15
# -we can see that the performance of male students is 
#  decreasing following the increasing in age which is not the case for female 
#  where all female in age of 20 get a high performance male in age of 20 
#  also have exception of high performance but it is rare


# ----------------------------- Analysis 2 -----------------------------
# Determine the relationship between final result and school absences

# Correlation of age and absences (regression line)
ggplot(Question1Data, aes(x = Age, y = School_Absences)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relationship Between Age And Absences",
       x = "Age",
       y = "Absences to School") +
  theme(text=element_text(size = 16))
# -Students who higher age will have more number of absences to the school
  
# Density 2D graph 
ggplot(Question1Data, aes(x = Final_Result, y = School_Absences)) +
  geom_density2d() +
  stat_density2d(aes(fill = stat(level)), geom="polygon") +
  labs(title = "Density of Final Result Affect by Frequency of Absences to School",
       x = "Final Result",
       y = "Density of Absences to School") +
  theme(text=element_text(size = 16))
# -Students with large number of absences to the school does not mean 
#  that student will have a bad performance


# ----------------------------- Analysis 3 -----------------------------
# Determine the relationship between final result and study time

# Unstacked Bar graph
ggplot(Question1Data, aes(x = Study_Time)) +
  geom_bar(aes(fill = Sex), position = "dodge") +
  labs(title = "Number of Students in Every Level of Study Time",
       x = "Study Time",
       y = "Frequency") +
  facet_wrap(~Age, labeller = label_both) +
  theme(text=element_text(size = 16))
# -Female students start to put more time on study when the age is higher.
# -Male students study harder than female on the minimum age but 
#  the hardworking reduce as the age go higher.

# Correlation of study time and final result (regression line)
ggplot(Question1Data, aes(x = Study_Time, y = Final_Result)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relationship Between Final Result And Study Time",
       x = "Study Time",
       y = "Final Result") +
  scale_x_continuous(labels=c("low", "below average", "above average", "high"), 
                     breaks=1:4) +
  theme(text=element_text(size = 16))
# -the more the study time is, the higher the performance in the exam


# ----------------------------- Analysis 4 -----------------------------
# Determine the relationship between final result and desired of wanting higher education

# Boxplot and Count Plot
ggplot(Question1Data, aes(x = Wanting_Higher_Education, y = Final_Result)) +
  geom_boxplot(aes(group = Wanting_Higher_Education)) +
  geom_count(alpha = 0.2) +
  labs(title = "Relationship Between Final Result And Desired of Wanting Higher Education",
       x = "Desired of Wanting Higher Education",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -If the student wants to get to a higher education level then 
#  it will definitely motivate that student to obtain a good result
#  to obtain a better result (at least pass)


# ----------------------------- Analysis 5 -----------------------------
# Determine the relationship between final result and reason choosing school

# Boxplot and Count Plot
ggplot(Question1Data, aes(x = Reason_Choosing_School, y = Final_Result)) +
  geom_boxplot(aes(group = Reason_Choosing_School)) +
  geom_count(alpha = 0.2) +
  labs(title = "Relationship Between Final Result And Reason Choosing School",
       x = "Reason Choosing School",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -If the school is close to home, then there will be much time saved 
#  from the transportation 


# Conclusion: 
# Different sex will have higher performance in different age, it may 
# cause by puberty, part time work or mature aspects. Absences does not affect 
# to result too much but it is the opposite for study time. Besides that, self 
# motivation for students is important for student's performance.


# ======================= Question 2 ====================================
# Do the past result affect the following result?
# =======================================================================
# ----------------------------- Exploration -----------------------------
# "Past_Failures", "G1", "G2", "G3"

# Past_Failures
ggplot(students, aes(x = G1, y = Past_Failures)) +
  geom_boxplot(aes(group = Past_Failures)) +
  labs(title = "Frequency Distribution of G1 Result by Past_Failures",
       x = "G1",
       y = "Past Failures")
ggplot(students, aes(x = G2, y = Past_Failures)) +
  geom_boxplot(aes(group = Past_Failures)) +
  labs(title = "Frequency Distribution of G2 Result by Past_Failures",
       x = "G2",
       y = "Past Failures")
ggplot(students, aes(x = G3, y = Past_Failures)) +
  geom_boxplot(aes(group = Past_Failures)) +
  labs(title = "Frequency Distribution of G3 Result by Past_Failures",
       x = "G3",
       y = "Past Failures")

# G1
ggplot(students, aes(x = G2, y = G1)) +
  geom_count() +
  labs(title = "Frequency Distribution of G2 Result by G1",
       x = "G2",
       y = "G1")
ggplot(students, aes(x = G3, y = G1)) +
  geom_count() +
  labs(title = "Frequency Distribution of G3 Result by G1",
       x = "G3",
       y = "G1")

# G2
ggplot(students, aes(x = G3, y = G2)) +
  geom_count() +
  labs(title = "Frequency Distribution of G3 Result by G2",
       x = "G3",
       y = "G2")

# ----------------------------- Visualization -----------------------------
# ----------------------------- Data Manipulation -----------------------------
# Main data sets
Question2Data = students %>%
  mutate(Final_Result = round((G1+G2+G3)/60*100, digits = 2)) %>%
  select(Age, Sex, Past_Failures, G1, G2, G3, Reason_Choosing_School,
         Final_Result)%>%
  arrange(Final_Result)
# Arrange columns name
Question2Data = Question2Data %>%
  select(order(colnames(Question2Data)))

View(Question2Data)
str(Question2Data)
summary(Question2Data)


# Focus on outliers data sets
students_outliers = Question2Data %>%
  filter(G2 == 0 & G3 == 0) %>%
  select(Reason_Choosing_School, Sex)

View(students_outliers)
summary(students_outliers)

# ----------------------------- Analysis 1 -----------------------------
# Determine the relationship between performance and past failure

# Correlation of age and past failures (regression line)
ggplot(Question2Data, aes(x = Age, y = Past_Failures)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between Age and Past Failures",
       x = "Age",
       y = "Past Failures") +
  theme(text=element_text(size = 16))
# -The higher the age is, the more failures made in the past

# Correlation of past failures and final result (regression line)
ggplot(Question2Data, aes(x = Past_Failures, y = Final_Result)) +
  geom_count() +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between Past Failures and Final Result",
       x = "Past Failures",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -The more failures made in the past can affect the performance


# ----------------------------- Analysis 2 -----------------------------
# Determine the relationship between G1, G2 and G3

# Correlation of G1 and G2 (regression line)
G1G2 = Question2Data %>%
  ggplot(aes(x = G1, y = G2)) +
  geom_boxplot(aes(group = G1)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between G1 and G2",
       x = "G1",
       y = "G2") +
  theme(text=element_text(size = 16))

# Correlation of G2 and G3 (regression line)
G2G3 = Question2Data %>%
  ggplot(aes(x = G2, y = G3)) +
  geom_boxplot(aes(group = G2)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between G2 and G3",
       x = "G2",
       y = "G3") +
  theme(text=element_text(size = 16))

# Correlation of G1 and G3 (regression line)
G1G3 = Question2Data %>%
  ggplot(aes(x = G1, y = G3)) +
  geom_boxplot(aes(group = G1)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between G1 and G3",
       x = "G1",
       y = "G3") +
  theme(text=element_text(size = 16))

# Display three graph together
plot_grid(G1G2, G2G3, G1G3, ncol = 3)
# -the higher the past result is, the higher the following result.


# ----------------------------- Analysis 3 -----------------------------
# Determine the relationship between lower limit outliers and reason choosing school

# Focus on outliers
# Stacked Bar Graph
ggplot(students_outliers, aes(x = Reason_Choosing_School)) +
  geom_bar(aes(fill = Sex)) +
  labs(title = "Reason of Choosing School for those students who gave up",
       x = "Reason Choosing School",
       y = "Frequency of Students") +
  theme(text=element_text(size = 16))
# -Most of the student who gave up have the reason of interest in some course,
#  so, the students will totally lose their confidence after the first exam 
#  does not go well

# Conclusion:
# The past result of a student will be affecting the following performance
# because of self confidence lost, the more interest and dream of the student 
# wanting for the course certificate, the more it will cause them to gave up.


# ======================= Question 3 ====================================
# What is the best living environment for students
# =======================================================================
# ----------------------------- Exploration -----------------------------
# "Living_Area", "Internet_At_Home", "Cohabitation_Status" , 
# "Family_Relationship", "Family_Size"

# Living_Area
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Living_Area)) +
  labs(title = "Frequency Distribution of G1 Result by Living Area",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Living_Area)) +
  labs(title = "Frequency Distribution of G2 Result by Living Area",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Living_Area)) +
  labs(title = "Frequency Distribution of G3 Result by Living Area",
       x = "G3",
       y = "Number of Students")

# Internet_At_Home
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Internet_At_Home)) +
  labs(title = "Frequency Distribution of G1 Result by Internet At Home",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Internet_At_Home)) +
  labs(title = "Frequency Distribution of G2 Result by Internet At Home",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Internet_At_Home)) +
  labs(title = "Frequency Distribution of G3 Result by Internet At Home",
       x = "G3",
       y = "Number of Students")

# Cohabitation_Status
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Cohabitation_Status)) +
  labs(title = "Frequency Distribution of G1 Result by Cohabitation Status",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Cohabitation_Status)) +
  labs(title = "Frequency Distribution of G2 Result by Cohabitation Status",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Cohabitation_Status)) +
  labs(title = "Frequency Distribution of G3 Result by Cohabitation Status",
       x = "G3",
       y = "Number of Students")

# Family_Relationship
ggplot(students, aes(x = G1, y = Family_Relationship)) +
  geom_boxplot(aes(group = Family_Relationship)) +
  labs(title = "Frequency Distribution of G1 Result by Family Relationship",
       x = "G1",
       y = "Family Relationship")
ggplot(students, aes(x = G2, y = Family_Relationship)) +
  geom_boxplot(aes(group = Family_Relationship)) +
  labs(title = "Frequency Distribution of G2 Result by Family Relationship",
       x = "G2",
       y = "Family Relationship")
ggplot(students, aes(x = G3, y = Family_Relationship)) +
  geom_boxplot(aes(group = Family_Relationship)) +
  labs(title = "Frequency Distribution of G3 Result by Family Relationship",
       x = "G3",
       y = "Family Relationship")
sum(students$Family_Relationship == 4)
sum(students$Family_Relationship == 5)

# Family_Size
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Family_Size)) +
  labs(title = "Frequency Distribution of G1 Result by Family Size",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Family_Size)) +
  labs(title = "Frequency Distribution of G2 Result by Family Size",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Family_Size)) +
  labs(title = "Frequency Distribution of G3 Result by Family Size",
       x = "G3",
       y = "Number of Students")

# ----------------------------- Visualization -----------------------------
# ----------------------------- Data Manipulation -----------------------------
# Main data sets
Question3Data = students %>%
  mutate(Final_Result = round((G1+G2+G3)/60*100, digits = 2)) %>%
  select(Sex, Living_Area, Internet_At_Home, Cohabitation_Status, 
         Family_Relationship, Family_Size, Reason_Choosing_School,
         Final_Result) %>%
  arrange(Final_Result)
# Arrange columns name
Question3Data = Question3Data %>%
  select(order(colnames(Question3Data)))

View(Question3Data)
str(Question3Data)
summary(Question3Data)

# Focus on rural living area data sets
students_rural = Question3Data %>% 
  filter(Living_Area == "Rural Area") %>%
  select(Family_Relationship, Living_Area, Reason_Choosing_School, Sex)

View(students_rural)
summary(students_rural)

# Focus on specific family relationship data sets
students_famrel = Question3Data %>% 
  filter(Family_Relationship == 4 | Family_Relationship == 5)

View(students_famrel)
summary(students_famrel)


# ----------------------------- Visualization -----------------------------
# ----------------------------- Analysis 1 -----------------------------
# Determine the relationship between Final Result and Living Area  

# Boxplot
ggplot(Question3Data, aes(x = Living_Area, y = Final_Result)) +
  geom_boxplot(aes(group = Living_Area)) +
  labs(title = "Average of Final Result in Different Living Area",
       x = "Living Area",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -Students living at urban area have slightly higher performance compared to 
#  rural area.


# ----------------------------- Analysis 2 -----------------------------
# Determine the relationship between Living Area and Internet At Home

# Count plot
ggplot(Question3Data, aes(x = Living_Area, y = Internet_At_Home)) +
  geom_count() +
  labs(title = "Frequency of Students Have Internet at Home for Both Rural and Urban Area",
       x = "Living Area",
       y = "Internet at Home") +
  theme(text=element_text(size = 16))
# -Students live in urban area will have a higher opportunity to have 
#  internet at home.
# -It might not make changes to the students study time but it can make students
#  to be more convenient for searching learning resource for further 
#  understanding of the course.


# ----------------------------- Analysis 3 -----------------------------
# Determine the relationship between Reason Choosing School and living area

# Stacked Bar Graph
ggplot(students_rural, aes(x = Reason_Choosing_School)) +
  geom_bar(aes(fill = Sex)) +
  labs(title = "Number of Students Live in Rural Area with Different Reason Choosing School",
       x = "Reason Choosing School",
       y = "Frequncy of Students") +
  theme(text=element_text(size = 16))
# -Female students will stay at rural area mostly because of the school 
#  reputation and interest in course
# -Male students will stay at rural area mostly because of 
#  interest in course

# Stacked Bar Graph
ggplot(students_rural, aes(x = Family_Relationship)) +
  geom_bar(aes(fill = Sex)) +
  labs(title = "Number of Students Live in Rural Area with Different Family Relationship",
       x = "Family Relationship",
       y = "Frequncy of Students") +
  scale_x_continuous(labels=c("Worst", "Bad", "Normal", "Close", "Closest"), 
                     breaks=1:5) +
  theme(text=element_text(size = 16))
# -The higher the family relation for students, the higher the chance that 
#  the students will stay at rural area for study.

# Reason why Closest relation is lower in graph compared to Close
# Bar graph
ggplot(students_famrel, aes(x = Family_Relationship)) +
  geom_bar(width = 0.5) +
  labs(title = "Ratio of Students in Close and Closest Family Relationship",
       x = "Family Relationship",
       y = "Frequncy of Students") +
  scale_x_continuous(labels=c("Close", "Closest"), breaks=4:5)+
  theme(text=element_text(size = 16))
# -ratio is 2:1 exactly how it is expected and causing closest family 
#  relationship shows around half frequency compared to close


# ----------------------------- Analysis 4 -----------------------------
# Determine the relationship between Final Result and Family Relationship in different Family Size

# Correlation between Family Relationship and Final Result(regression)
ggplot(Question3Data, aes(x = Family_Relationship, y = Final_Result)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between Final Result and Family Relationship in Different Family Size",
       x = "Family Relationship",
       y = "Final Result") +
  scale_x_continuous(labels=c("Worst", "Bad", "Normal", "Close", "Closest"), 
                     breaks=1:5) +
  facet_grid(rows =  vars(Family_Size), cols = vars(Cohabitation_Status)) +
  theme(text=element_text(size = 16))
# -Positive correlation: Family Size Greater than 3 and Living Apart /
#                        Family Size Less than 3 and Living Together
# -Negative correlation: Family Size Greater than 3 and Living Together /
#                        Family Size Less than 3 and Living Apart
# -The closer the family relationship is, the higher the student performance 
#  but there is another attribute influences this result if family size is 
#  greater than 3 it is more better to living apart when the relationship is 
#  close because the environment for students is more noisy and unable to 
#  concentrate to study


# Conclusion:
# Living environment will affect student performance in many aspect. Student 
# lives in urban area will be more facilities that can be utilizes for more 
# understanding to the course for example availability of internet at home. 
# Shelter environment also can affect student environment which involve of 
# family aspect, if family member can give some help in appropriate time and 
# not to make home environment become noisy then it can help the students on 
# studying the course. 


# ======================= Question 4 ====================================
# Health/Stress status or focus on study is more important?
# =======================================================================
# ----------------------------- Exploration -----------------------------
# "WeekDay_Alcohol_Consumed", "Weekend_Alcohol_Consumed", "Health_Status", 
# "Free_Time", "Hang_Out", "Cocurricular_Activity", "Travel_Time"

# WeekDay_Alcohol_Consumed
ggplot(students, aes(x = G1, y = WeekDay_Alcohol_Consumed)) +
  geom_boxplot(aes(group = WeekDay_Alcohol_Consumed)) +
  labs(title = "Frequency Distribution of G1 Result by WeekDay Alcohol Consumed",
       x = "G1",
       y = "WeekDay Alcohol Consumed")
ggplot(students, aes(x = G2, y = WeekDay_Alcohol_Consumed)) +
  geom_boxplot(aes(group = WeekDay_Alcohol_Consumed)) +
  labs(title = "Frequency Distribution of G2 Result by WeekDay Alcohol Consumed",
       x = "G2",
       y = "WeekDay Alcohol Consumed")
ggplot(students, aes(x = G3, y = WeekDay_Alcohol_Consumed)) +
  geom_boxplot(aes(group = WeekDay_Alcohol_Consumed)) +
  labs(title = "Frequency Distribution of G3 Result by WeekDay Alcohol Consumed",
       x = "G3",
       y = "WeekDay Alcohol Consumed")

# Weekend_Alcohol_Consumed
ggplot(students, aes(x = G1, y = Weekend_Alcohol_Consumed)) +
  geom_boxplot(aes(group = Weekend_Alcohol_Consumed)) +
  labs(title = "Frequency Distribution of G1 Result by Weekend Alcohol Consumed",
       x = "G1",
       y = "Weekend Alcohol Consumed")
ggplot(students, aes(x = G2, y = Weekend_Alcohol_Consumed)) +
  geom_boxplot(aes(group = Weekend_Alcohol_Consumed)) +
  labs(title = "Frequency Distribution of G2 Result by Weekend Alcohol Consumed",
       x = "G2",
       y = "Weekend Alcohol Consumed")
ggplot(students, aes(x = G3, y = Weekend_Alcohol_Consumed)) +
  geom_boxplot(aes(group = Weekend_Alcohol_Consumed)) +
  labs(title = "Frequency Distribution of G3 Result by Weekend Alcohol Consumed",
       x = "G3",
       y = "Weekend Alcohol Consumed")

# Health_Status
ggplot(students, aes(x = G1, y = Health_Status)) +
  geom_boxplot(aes(group = Health_Status)) +
  labs(title = "Frequency Distribution of G1 Result by Health Status",
       x = "G1",
       y = "Health Status")
ggplot(students, aes(x = G2, y = Health_Status)) +
  geom_boxplot(aes(group = Health_Status)) +
  labs(title = "Frequency Distribution of G2 Result by Health Status",
       x = "G2",
       y = "Health Status")
ggplot(students, aes(x = G3, y = Health_Status)) +
  geom_boxplot(aes(group = Health_Status)) +
  labs(title = "Frequency Distribution of G3 Result by Health Status",
       x = "G3",
       y = "Health Status")

# Free_Time
ggplot(students, aes(x = G1, y = Free_Time)) +
  geom_boxplot(aes(group = Free_Time)) +
  labs(title = "Frequency Distribution of G1 Result by Free Time",
       x = "G1",
       y = "Free Time")
ggplot(students, aes(x = G2, y = Free_Time)) +
  geom_boxplot(aes(group = Free_Time)) +
  labs(title = "Frequency Distribution of G2 Result by Free Time",
       x = "G2",
       y = "Free Time")
ggplot(students, aes(x = G3, y = Free_Time)) +
  geom_boxplot(aes(group = Free_Time)) +
  labs(title = "Frequency Distribution of G3 Result by Free Time",
       x = "G3",
       y = "Free Time")

# Hang_Out
ggplot(students, aes(x = G1, y = Hang_Out)) +
  geom_boxplot(aes(group = Hang_Out)) +
  labs(title = "Frequency Distribution of G1 Result by Hang Out",
       x = "G1",
       y = "Hang Out")
ggplot(students, aes(x = G2, y = Hang_Out)) +
  geom_boxplot(aes(group = Hang_Out)) +
  labs(title = "Frequency Distribution of G2 Result by Hang Out",
       x = "G2",
       y = "Hang Out")
ggplot(students, aes(x = G3, y = Hang_Out)) +
  geom_boxplot(aes(group = Hang_Out)) +
  labs(title = "Frequency Distribution of G3 Result by Hang Out",
       x = "G3",
       y = "Hang Out")

# Cocurricular_Activity
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Cocurricular_Activity)) +
  labs(title = "Frequency Distribution of G1 Result by Cocurricular Activity",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Cocurricular_Activity)) +
  labs(title = "Frequency Distribution of G2 Result by Cocurricular Activity",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Cocurricular_Activity)) +
  labs(title = "Frequency Distribution of G3 Result by Cocurricular Activity",
       x = "G3",
       y = "Number of Students")

# Travel_Time
ggplot(students, aes(x = G1, y = Travel_Time)) +
  geom_boxplot(aes(group = Travel_Time)) +
  labs(title = "Frequency Distribution of G1 Result by Travel Time",
       x = "G1",
       y = "Travel Time")
ggplot(students, aes(x = G2, y = Travel_Time)) +
  geom_boxplot(aes(group = Travel_Time)) +
  labs(title = "Frequency Distribution of G2 Result by Travel Time",
       x = "G2",
       y = "Travel Time")
ggplot(students, aes(x = G3, y = Travel_Time)) +
  geom_boxplot(aes(group = Travel_Time)) +
  labs(title = "Frequency Distribution of G3 Result by Travel Time",
       x = "G3",
       y = "Travel Time")


# ----------------------------- Data Manipulation -----------------------------
# Main data sets
Question4Data = students %>%
  mutate(Final_Result = round((G1+G2+G3)/60*100, digits = 2),
         Daily_Alcohol = (WeekDay_Alcohol_Consumed + Weekend_Alcohol_Consumed)/2) %>%
  select(Sex, Study_Time, Daily_Alcohol, Health_Status, Free_Time, 
         Hang_Out, Cocurricular_Activity, Travel_Time, Final_Result) %>%
  arrange(Final_Result)
# Arrange columns name
Question4Data = Question4Data %>%
  select(order(colnames(Question4Data)))

View(Question4Data)
str(Question4Data)
summary(Question4Data)


# ----------------------------- Visualization -----------------------------
# ----------------------------- Analysis 1 -----------------------------
# Determine the relationship between final result and health status

# -Assume Health Status include physically and mentally(stress).
# Correlation between final result and health status (regression)
ggplot(Question4Data, aes(x = Health_Status, y = Final_Result)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between Final Result and Health Status",
       x = "Health Status",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -The higher the health status, the lower the students performance.
# -Health Status is high means physical health is good but mental health is bad

# Correlation between Study Time and health status (regression)
ggplot(Question4Data, aes(x = Study_Time, y = Health_Status)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between Study Time and Health Status",
       x = "Study Time",
       y = "Health Status") +
  theme(text=element_text(size = 16))
# -The more time spent on study, the mental health of the student will be 
#  lower.

# Correlation between Daily Alcohol and health status (regression)
ggplot(Question4Data, aes(x = Daily_Alcohol, y = Health_Status)) +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relation between Daily Alcohol and Health Status",
       x = "Daily Alcohol",
       y = "Health Status") +
  theme(text=element_text(size = 16))
# -The more daily alcohol consumed, the health status of the student improve.
# -we can say that student is too high pressure nowadays, hence drinking give 
#  them more relief on stress compared to harm to the body which mean the 
#  improvement in mental health outrun the harm cause by alcohol to the 
#  physical health.


# ----------------------------- Analysis 2 -----------------------------
# Determine the relationship between Cocurricular Activity and Final Result

# -Assume co-curricular activity is referring to sport clubs or liberal arts 
#  related clubs instead of society service or school event.
# Boxplot
ggplot(Question4Data, aes(x = Cocurricular_Activity, y = Final_Result)) +
  geom_boxplot() +
  facet_grid(~Sex) +
  labs(title = "Average of Final Result for Participation of Co-Curicullar",
       x = "Participation of Co-Curicullar",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -Female student will have lower performance when participating in 
#  co-curricular because majority of female student will choose for liberal arts 
#  related clubs. So they also might need to consume some focus and memories 
#  knowledge from the clubs.
# -Male student will have higher performance when participating in 
#  co-curricular because majority of female student will choose for sport clubs.
#  So it will be really useful for them to destress and have a fresh mind after 
#  some sport activities. 


# ----------------------------- Analysis 3 -----------------------------
# Determine the relationship between Free Time, Hang Out, Travel Time, Study Time

# Heat Map
ggplot(Question4Data, aes(x = Free_Time, y = Hang_Out)) +
  geom_tile(aes(fill = Final_Result), color = "white") +
  scale_fill_gradient(low = "white", high = "steel blue") +
  labs(title = "Average Final Result with a Combination of Free Time and Hang Out",
       x = "Free Time",
       y = "Hang Out") +
  scale_x_continuous(labels = c("least", "less", "normal", "high", "highest"), 
                     breaks = 1:5) +
  scale_y_continuous(labels = c("least", "less", "normal", "high", "highest"), 
                     breaks = 1:5) +
  theme(text=element_text(size = 16))

# Heat Map
ggplot(Question4Data, aes(x = Free_Time, y = Travel_Time)) +
  geom_tile(aes(fill = Final_Result), color = "white") +
  scale_fill_gradient(low = "white", high = "steel blue") +
  labs(title = "Average Final Result with a Combination of Free Time and Travel Time",
       x = "Free Time",
       y = "Travel Time") +
  scale_x_continuous(labels = c("least", "less", "normal", "high", "highest"), 
                     breaks = 1:5) +
  scale_y_continuous(labels = c("least", "less", "high", "highest"), 
                     breaks = 1:4) +
  theme(text=element_text(size = 16))

# Heat Map
ggplot(Question4Data, aes(x = Free_Time, y = Study_Time)) +
  geom_tile(aes(fill = Final_Result), color = "white") +
  scale_fill_gradient(low = "white", high = "steel blue") +
  labs(title = "Average Final Result with a Combination of Free Time and Study Time",
     x = "Free Time",
     y = "Study Time") +
  scale_x_continuous(labels = c("least", "less", "normal", "high", "highest"), 
                     breaks = 1:5) +
  scale_y_continuous(labels = c("least", "less", "high", "highest"), 
                     breaks = 1:4) +
  theme(text=element_text(size = 16))

# -From upper left corner of hang out heat map, we can know that if the free 
#  time after school is least then the student should not still spend much time 
#  on hang out with friends.
# -From bottom half of travel time heat map, it shows that it is better in 
#  performance which mean travel once in a while will increase student 
#  performance but if too often then the student performance will drop.
# -From study time heat map, the center of the heat map shows more stable 
#  final result than the surroundings.


# Conclusion:
# Both are important to a student, if only one aspect is always focus on it 
# will eventually decrease the student's performance and health status hence a 
# balanced lifestyle is more suitable for students.


# ======================= Question 5 ==============================================
# Is fundamental and extra education a must for student? 
# =================================================================================
# ----------------------------- Exploration -----------------------------
# "School_Extra_EduSup", "Family_Extra_EduSup", "Paid_Extra_Class" 
# "Attended_Nursery_School"

# School_Extra_EduSup
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = School_Extra_EduSup)) +
  labs(title = "Frequency Distribution of G1 Result by School Extra Educational Support",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = School_Extra_EduSup)) +
  labs(title = "Frequency Distribution of G2 Result by School Extra Educational Support",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = School_Extra_EduSup)) +
  labs(title = "Frequency Distribution of G3 Result by School Extra Educational Support",
       x = "G3",
       y = "Number of Students")

# Family_Extra_EduSup
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Family_Extra_EduSup)) +
  labs(title = "Frequency Distribution of G1 Result by Family Extra Educational Support",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Family_Extra_EduSup)) +
  labs(title = "Frequency Distribution of G2 Result by Family Extra Educational Support",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Family_Extra_EduSup)) +
  labs(title = "Frequency Distribution of G3 Result by Family Extra Educational Support",
       x = "G3",
       y = "Number of Students")

# Paid_Extra_Class
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Paid_Extra_Class)) +
  labs(title = "Frequency Distribution of G1 Result by Paid Extra Class",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Paid_Extra_Class)) +
  labs(title = "Frequency Distribution of G2 Result by Paid Extra Class",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Paid_Extra_Class)) +
  labs(title = "Frequency Distribution of G3 Result by Paid Extra Class",
       x = "G3",
       y = "Number of Students")

# Attended_Nursery_School
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Attended_Nursery_School)) +
  labs(title = "Frequency Distribution of G1 Result by Attended Nursery School",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Attended_Nursery_School)) +
  labs(title = "Frequency Distribution of G2 Result by Attended Nursery School",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Attended_Nursery_School)) +
  labs(title = "Frequency Distribution of G3 Result by Attended Nursery School",
       x = "G3",
       y = "Number of Students")


# ----------------------------- Data Manipulation -----------------------------
Question5Data = students %>%
  mutate(Final_Result = round((G1+G2+G3)/60*100, digits = 2)) %>%
  select(Sex, School_Extra_EduSup, Family_Extra_EduSup, 
         Paid_Extra_Class, Attended_Nursery_School, Final_Result, 
         Study_Time, Health_Status) %>%
  arrange(Final_Result)
# Arrange columns name
Question5Data = Question5Data %>%
  select(order(colnames(Question5Data)))
  
View(Question5Data)
str(Question5Data)
summary(Question5Data)


# ----------------------------- Visualization -----------------------------
# ----------------------------- Analysis 1 -----------------------------
# Determine the relationship between Attended Nursery School, Final Result and Study Time 

#Boxplot
ggplot(Question5Data, aes(x = Attended_Nursery_School, y = Final_Result)) +
  geom_boxplot(aes(group = Attended_Nursery_School)) +
  labs(title = "Average of Final Result for Attended Nursery School",
       x = "Attended Nursery School",
       y = "Final Result") +
  theme(text=element_text(size = 16))
  # -students who attended nursery school have slightly better performance.

#Count plot
ggplot(Question5Data, aes(x = Attended_Nursery_School, y = Study_Time)) +
  geom_count() +
  labs(title = "Average of Study Time for Attended Nursery School",
       x = "Attended Nursery School",
       y = "Study Time") +
  theme(text=element_text(size = 16))
# -students who attended nursery school will put more time on study.


# ----------------------------- Analysis 2 -----------------------------
# Determine the relationship between Family and School Extra Educational Support with Final Result

# Heat map
ggplot(Question5Data, aes(x = Family_Extra_EduSup, y = School_Extra_EduSup)) +
  geom_tile(aes(fill = Final_Result)) +
  labs(title = "Average Final Result with a Combination of Family and School Extra Educational Support",
       x = "Family Extra Educational Support",
       y = "School Extra Educational Support") +
  theme(text=element_text(size = 16))
# -Not having both extra educational support from family and school will have 
#  better performance.


# ----------------------------- Analysis 3 -----------------------------
# Determine the relationship between Paid Extra Class, Final Result and Health Status

# Boxplot
ggplot(Question5Data, aes(x = Paid_Extra_Class, y = Final_Result)) +
  geom_boxplot(aes(group = Paid_Extra_Class)) +
  labs(title = "Average of Final Result for Paid Extra Class",
       x = "Paid Extra Class",
       y = "Final Result") +
  theme(text=element_text(size = 16))
# -Apply for paid extra class only can shrink the average possible performance 
#  range, so the student have higher chance to pass the exam but some there is 
#  also some exception to it(outlier).


# Conclusion:
# Fundamental and extra education is not a must for student because it will not 
# change a student's performance so much but by having them will help some 
# student on their study.


# ======================= Question 6 ====================================
# How family aspect related to student's performance?
# =======================================================================
# ----------------------------- Exploration -----------------------------
# "Mother_Education", "Father_Education", "Mother_Job_Type",  "Father_Job_Type", 
# "Guardian"

# Mother_Education
ggplot(students, aes(x = G1, y = Mother_Education)) +
  geom_boxplot(aes(group = Mother_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Mother Education",
       x = "G1",
       y = "Mother Education")
ggplot(students, aes(x = G2, y = Mother_Education)) +
  geom_boxplot(aes(group = Mother_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Mother Education",
       x = "G2",
       y = "Mother Education")
ggplot(students, aes(x = G3, y = Mother_Education)) +
  geom_boxplot(aes(group = Mother_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Mother Education",
       x = "G3",
       y = "Mother Education")

# Father_Education
ggplot(students, aes(x = G1, y = Father_Education)) +
  geom_boxplot(aes(group = Father_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Father Education",
       x = "G1",
       y = "Father Education")
ggplot(students, aes(x = G2, y = Father_Education)) +
  geom_boxplot(aes(group = Father_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Father Education",
       x = "G2",
       y = "Father Education")
ggplot(students, aes(x = G3, y = Father_Education)) +
  geom_boxplot(aes(group = Father_Education)) +
  labs(title = "Frequency Distribution of G3 Result by Father Education",
       x = "G3",
       y = "Father Education")

# Mother_Job_Type
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Mother_Job_Type)) +
  labs(title = "Frequency Distribution of G3 Result by Mother Job Type",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Mother_Job_Type)) +
  labs(title = "Frequency Distribution of G3 Result by Mother Job Type",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Mother_Job_Type)) +
  labs(title = "Frequency Distribution of G3 Result by Mother Job Type",
       x = "G3",
       y = "Number of Students")

# Father_Job_Type
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Father_Job_Type)) +
  labs(title = "Frequency Distribution of G3 Result by Father Job Type",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Father_Job_Type)) +
  labs(title = "Frequency Distribution of G3 Result by Father Job Type",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Father_Job_Type)) +
  labs(title = "Frequency Distribution of G3 Result by Father Job Type",
       x = "G3",
       y = "Number of Students")

# Guardian
ggplot(students, aes(x = G1)) +
  geom_histogram(binwidth = 5, aes(fill = Guardian)) +
  labs(title = "Frequency Distribution of G3 Result by Guardian",
       x = "G1",
       y = "Number of Students")
ggplot(students, aes(x = G2)) +
  geom_histogram(binwidth = 5, aes(fill = Guardian)) +
  labs(title = "Frequency Distribution of G3 Result by Guardian",
       x = "G2",
       y = "Number of Students")
ggplot(students, aes(x = G3)) +
  geom_histogram(binwidth = 5, aes(fill = Guardian)) +
  labs(title = "Frequency Distribution of G3 Result by Guardian",
       x = "G3",
       y = "Number of Students")


# ----------------------------- Data Manipulation -----------------------------
# Main data sets
Question6Data = students %>%
  mutate(Final_Result = round((G1+G2+G3)/60*100, digits = 2),
         Parent_Education = round((Mother_Education + Father_Education)/2), digits = 0)%>%
  select(Parent_Education, Mother_Education, Father_Education, 
         Mother_Job_Type,  Father_Job_Type, 
         Guardian, Final_Result) %>%
  arrange(Final_Result)
# Arrange columns name
Question6Data = Question6Data %>%
  select(order(colnames(Question6Data)))

View(Question6Data)
str(Question6Data)
summary(Question6Data)

# Focus on student with mother as guardian data sets
students_mother = Question6Data %>%
  filter(Guardian == "mother")

View(students_mother)
summary(students_mother)

# Focus on student with father as guardian data sets
students_father = Question6Data %>%
  filter(Guardian == "father")

View(students_father)
summary(students_father)

# ----------------------------- Analysis 1 -----------------------------
# Determine the relationship between Parent Education and final Result

# Count plot and Regression line
ggplot(Question6Data, aes(x = Parent_Education, y = Final_Result)) +
  geom_count() +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relationship between Parent Education and Final Result",
       x = "Parent Education",
       y = "Final Result") +
  scale_x_continuous(labels = c("None", "4th Grade", "5th-9th Grade", "Secondary", "Higher"),
                     breaks = 0:4) +
  theme(text=element_text(size = 16))
# -the higher the parents education is, the higher the student performance is.
# -it can be due to genetic or young education.


# ----------------------------- Analysis 2 -----------------------------
# Determine the relationship between Mother Education and final Result

# Count plot and Regression line
ggplot(students_mother,aes(x = Mother_Education, y = Final_Result)) +
  geom_count() +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relationship between Mother Education and Final Result",
       x = "Mother Education",
       y = "Final Result") +
  scale_x_continuous(labels = c("None", "4th Grade", "5th-9th Grade", "Secondary", "Higher"),
                     breaks = 0:4) +
  theme(text=element_text(size = 16))
# -The higher the mother education is, the higher the student's performance.

# Stacked Bar Graph
ggplot(students_mother,aes(x =Mother_Education )) +
  geom_bar(aes(fill = Mother_Job_Type)) +
  labs(title = "Distribution of Mother Job Type in Different Mother Education",
       x = "Mother Education",
       y = "Number of Mothers") +
  scale_x_continuous(labels = c("None", "4th Grade", "5th-9th Grade", "Secondary", "Higher"),
                     breaks = 0:4) +
  theme(text=element_text(size = 16))
# -Civil Services mostly is secondary
# -Health Care increasing
# -Other Mostly 5th-9th grade and secondary
# -Teacher increasing
# -Work At Home decreasing


# ----------------------------- Analysis 3 -----------------------------
# Determine the relationship between Father Education and final Result

# Count plot and Regression line
ggplot(students_father,aes(x = Father_Education, y = Final_Result)) +
  geom_count() +
  geom_smooth(method = "lm", formula = y ~ x) +
  labs(title = "Relationship between Father Education and Final Result",
       x = "Father Education",
       y = "Final Result") +
  scale_x_continuous(labels = c("None", "4th Grade", "5th-9th Grade", "Secondary", "Higher"),
                     breaks = 0:4) +
  theme(text=element_text(size = 16))
# -The higher the father education is, the higher the student's performance.

# Stacked Bar Graph
ggplot(students_father,aes(x =Father_Education )) +
  geom_bar(aes(fill = Father_Job_Type)) +
  labs(title = "Distribution of Father Job Type in Different Father Education",
       x = "Father Education",
       y = "Number of Fathers") +
  scale_x_continuous(labels = c("None", "4th Grade", "5th-9th Grade", "Secondary", "Higher"),
                     breaks = 0:4) +
  theme(text=element_text(size = 16))
# -Civil Services mostly is secondary
# -Health Care increasing
# -Other Mostly secondary
# -Teacher only in Higher Education
# -Work At Home increasing

# Conclusion:
# Parent Education will be making changes on student's performance, it could be 
# genetic or young education such as the parent will give the student mindset of
# how important education is in the society. When father is the guardian with 
# high education, the performance is more shrink compared to mother guardian 
# with high education.


# =======================================================================
#                             Additional Features
# =======================================================================
# ----------------------------- gsub() -----------------------------
# Create a character vector 
a = c("a1", "2a", "a3a","aaa4", "5aa")
class(Sampledf)

# Remove unnecessary character and convert it to numeric and put in a data frame
Modified_a = gsub("a", "", Sampledf)
SampleTable = read.table(text = Modifieddf)
str(SampleTable)


# ----------------------------- plot_grid() -----------------------------
# Create sample data frame
df_a = data.frame(sample_row = c(1,2,1,1,2))
df_b = data.frame(sample_row = c(2,1,2,2,1))

# Require library "cowplot" & "ggplot2"
# Display both graph in desired dimension
plot_grid(ggplot(df_a, aes(x = sample_row)) +
            geom_bar(),
          ggplot(df_b, aes(x = sample_row)) +
            geom_bar(),
          nrow = 2,
          ncol = 1)


# ----------------------------- geom_density2d() -----------------------------
# Create data frame from diamonds dataset
a = diamonds

# Require library "ggplot2"
ggplot(a, aes(x = price, y = carat)) +
  geom_density2d()


# ----------------------------- geom_tile() -----------------------------
# Create data frame from diamonds dataset
a = diamonds

# Require library "ggplot2"
ggplot(a, aes(x = cut, y = clarity)) +
  geom_tile(aes(fill = depth))


# ----------------------------- facet_grid() -----------------------------
# Create data frame from diamonds dataset
a = diamonds

# Require library "ggplot2"
ggplot(a, aes(x = carat, y = price)) +
  geom_point() +
  facet_grid(rows = vars(cut), cols = vars(clarity))
