library(caret)
library(tidyverse)
library(class)
library(pROC)

F = read.csv(file.choose(), header = TRUE, stringsAsFactors = TRUE)
head(F)

classifications = knn(F[,1:2],F[1:2],F[,3], prob = TRUE, k = 5) # Columns 1 and 2 are EVs, column 3 is the response

table(classifications,F[,3])# classfiications are the predictions and F[,3] are the actuals

CM_F = confusionMatrix(table(classifications,F[,3]), mode = "everything") # Note F1

CM_F

F$Label = relevel(F$Label, ref = "NOTFRAUD")
classifications = knn(F[,1:2],F[1:2],F[,3], prob = TRUE, k = 5)

table(classifications,F[,3])
CM_NF = confusionMatrix(table(classifications,F[,3]), mode = "everything") # Compare F1

CM_NF

Macro_F1 = mean(c(CM_F[4]$byClass["F1"],CM_NF[4]$byClass["F1"]))
Macro_F1


# Look at the attributes (Note that probabiliities are all greater than .5)
classifications # classifcaiton with probabilities
attributes(classifications) # Look at possible attributes
attributes(classifications)$prob # Probability of what was classified for that observation

#Get probs of a FRAUD specifically
probs = ifelse(classifications == "FRAUD",attributes(classifications)$prob, 1- attributes(classifications)$prob)

#New Threshold
summary(F$Label)
45/(200) #33% FRAUD

NewClass = ifelse(probs > .225, "FRAUD", "NOTFRAUD")
table(NewClass,F[,3])
CM_NF = confusionMatrix(table(relevel(as.factor(NewClass), ref = "NOTFRAUD"),F[,3]), mode = "everything") # Reference is FRAUD for F dataframe
CM_NF

CM_F = confusionMatrix(table(relevel(as.factor(NewClass), ref = "FRAUD"),relevel(F[,3],ref = "FRAUD")), mode = "everything")
CM_F

Macro_F1_New_Thresh = mean(c(CM_F[4]$byClass["F1"],CM_NF[4]$byClass["F1"]))
Macro_F1_New_Thresh





#Undersampling
summary(F$Label)
45/(200)

OnlyNF = F %>% filter(Label == "NOTFRAUD")
OnlyNFUnder = OnlyNF[sample(seq(1,155,1),45),]

UnderSamp = rbind(F %>% filter(Label == "FRAUD"), OnlyNFUnder)
dim(UnderSamp)

classifications = knn(UnderSamp[,1:2],F[1:2],UnderSamp[,3], prob = TRUE, k = 5)

table(classifications,F[,3])
CM = confusionMatrix(table(classifications,F[,3]), mode = "everything")
CM


#Oversampling 

summary(F$Label)

OnlyF = F %>% filter(Label == "FRAUD") # Give me all Frauds
OnlyFOver = rbind(OnlyF,OnlyF[sample(seq(1,45,1),(155-45),replace = TRUE),])
dim(OnlyFOver)

OverSamp = rbind(F %>% filter(Label == "NOTFRAUD"), OnlyFOver)
dim(OverSamp)

classifications = knn(OverSamp[,1:2],F[1:2],OverSamp[,3], prob = TRUE, k = 5)

table(classifications,F[,3])
CM = confusionMatrix(table(classifications,F[,3]), mode = "everything")
CM


#Reference
#https://www.geeksforgeeks.org/how-to-calculate-auc-area-under-curve-in-r/
# https://rviews.rstudio.com/2019/03/01/some-r-packages-for-roc-curves/
# https://developers.google.com/machine-learning/crash-course/classification/video-lecture


Example:
install.packages("pROC")
library(pROC)

# sample data frame
df_train <- data.frame( x= c(1,2,3,4,5),
                        y= c(1,5,8,15,26),
                        z=c(0,1,1,0,0))
df_test <- data.frame( x= c(6,7,8),
                       y= c(38,45,72),
                       z=c(0,1,0))


model <- glm(z ~ x+y, data=df_train)

# predicted data
prediction <- predict(model, df_test,
                      type="response")

# create roc curve
roc_object <- roc( df_test$z, prediction)

# calculate area under curve
auc(roc_object)




