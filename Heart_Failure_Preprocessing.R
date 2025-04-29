getwd()
setwd("C:\\Users\\user\\OneDrive\\문서\\R_data")
dir()

#데이터 불러오기
d1 <- read.csv("heart_failure_clinical_records_dataset.csv")

#데이터 변환
d1$DEATH_EVENT <- as.factor(d1$DEATH_EVENT)
d1$anaemia <- as.factor(d1$anaemia)
d1$diabetes <- as.factor(d1$diabetes)
d1$High_blood_pressure <- as.factor(d1$high_blood_pressure)
d1$platelets <- as.numeric(d1$platelets)

#변수 변환
d1 <- d1 %>% mutate(CPK_gr = ifelse(creatinine_phosphokinase>=20 & creatinine_phosphokinase <= 270,0,
                                   ifelse(creatinine_phosphokinase<20 | creatinine_phosphokinase >270,1, NA)))
freq(d1$CPK_gr)
d1 <- d1 %>% mutate(Plt_gr = ifelse(platelets>=150000 & platelets<= 450000,0,
                                    ifelse(platelets<150000 | platelets>450000,1,NA)))
freq(d1$Plt_gr)
d1 <- d1 %>% mutate(ct_gr = ifelse(serum_creatinine>=0.50 & serum_creatinine<=1.4,0,
                                   ifelse(serum_creatinine<0.5 | serum_creatinine>1.2,1,NA)))
freq(d1$ct_gr)
d1 <- d1 %>% mutate(sd_gr=ifelse(serum_sodium>=135 & serum_sodium<=145,0,
                                 ifelse(serum_sodium<135 | serum_sodium>145,1,NA )))
freq(d1$sd_gr)
d1 <- d1 %>% mutate(EF_gr=ifelse(ejection_fraction<=40,0,
                                 ifelse(ejection_fraction>40 & ejection_fraction<50,1,
                                        ifelse(ejection_fraction>=50,2,NA)))) 
freq(d1$EF_gr)

#필요한 라이브러리
library(dplyr)
library(descr)
library(psych)

# 자료 분석
freq(d1$DEATH_EVENT)

#age
shapiro.test(d1$age)
wilcox.test(age ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(age, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(age, na.rm = T))

#Anaemia
CrossTable(d1$anaemia, d1$DEATH_EVENT)
chisq.test(d1$anaemia, d1$DEATH_EVENT)

#creatinine_phosphokinase
shapiro.test(d1$creatinine_phosphokinase)
wilcox.test(creatinine_phosphokinase ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(creatinine_phosphokinase, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(creatinine_phosphokinase, na.rm = T))

#diabetes
CrossTable(d1$diabetes, d1$DEATH_EVENT)
chisq.test(d1$diabetes, d1$DEATH_EVENT)

#ejection_fraction
shapiro.test(d1$ejection_fraction)
wilcox.test(ejection_fraction ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(ejection_fraction, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(ejection_fraction, na.rm = T))

#High_blood_pressure
CrossTable(d1$High_blood_pressure, d1$DEATH_EVENT)
chisq.test(d1$High_blood_pressure, d1$DEATH_EVENT)

#Platelets
shapiro.test(d1$platelets)
wilcox.test(platelets ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(platelets, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(platelets, na.rm = T))

#Serum_creatinine
shapiro.test(d1$serum_creatinine)
wilcox.test(serum_creatinine ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(serum_creatinine, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(serum_creatinine, na.rm = T))

#Serum_sodium
shapiro.test(d1$serum_sodium)
wilcox.test(serum_sodium ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(serum_sodium, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(serum_sodium, na.rm = T))

#Sex
CrossTable(d1$sex, d1$DEATH_EVENT)
chisq.test(d1$sex, d1$DEATH_EVENT)

#Smoking
CrossTable(d1$smoking, d1$DEATH_EVENT)
chisq.test(d1$smoking, d1$DEATH_EVENT)

#time
shapiro.test(d1$time)
wilcox.test(time ~ DEATH_EVENT, data = d1)
d1 %>% filter(DEATH_EVENT==0) %>% summarize(quantile(time, na.rm = T))
d1 %>% filter(DEATH_EVENT==1) %>% summarize(quantile(time, na.rm = T))

#creatinine_phosphokinase group
CrossTable(d1$CPK_gr, d1$DEATH_EVENT)
chisq.test(d1$CPK_gr, d1$DEATH_EVENT)

#platelets group
CrossTable(d1$Plt_gr, d1$DEATH_EVENT)
chisq.test(d1$Plt_gr, d1$DEATH_EVENT)

#Serum_creatinine group
CrossTable(d1$ct_gr, d1$DEATH_EVENT)
chisq.test(d1$ct_gr, d1$DEATH_EVENT)

#serum_sodium group
CrossTable(d1$sd_gr, d1$DEATH_EVENT)
chisq.test(d1$sd_gr, d1$DEATH_EVENT)

#ejection_fraction
CrossTable(d1$EF_gr, d1$DEATH_EVENT)
chisq.test(d1$EF_gr, d1$DEATH_EVENT)

#자료 저장
d2 <- subset(d1, select = c(CPK_gr, Plt_gr, ct_gr, sd_gr,EF_gr, age,ejection_fraction,serum_creatinine,serum_sodium,time,DEATH_EVENT))
write.csv(d2,"heart_failure.csv", row.names = F)

d3 <- d1 %>% select(-c(CPK_gr, Plt_gr, sd_gr,EF_gr))
write.csv(d3,"heart_failure_clean.csv", row.names = F)
