library(tidyverse)
library("politeness")
library("spacyr")
spacy_initialize()
stackOverflowData <- read.csv(file = "D:/Trinity_DS/Dissertations/201907/politness/final.csv", header = TRUE, sep =",")
df_polite_train <- politeness(stackOverflowData$Request, drop_blank = FALSE)
amazonData <- read.csv(file = "D:/Trinity_DS/Dissertations/201901/Datasets/Kaggle/1429_1_v2.csv")
df_polite_holdout <- politeness(amazonData$reviews.text, drop_blank = FALSE)
project <- politenessProjection(df_polite_train, stackOverflowData$Normalized.Score, df_polite_holdout)
project$test_proj
help(cbind)
final_df <- cbind(amazonData,text_politness_scale=project$test_proj)
final_df
write.csv(x = final_df,file = "D:/Trinity_DS/Dissertations/201907/politness/politness_predicted/amazon_polite.csv")
##########################################################################

yelpData <- read.csv(file = "D:/Trinity_DS/Dissertations/201907/dataset_v2/Review_Toronto_Restaurant.csv")

df_yelp_polite_holdout <- politeness(yelpData$text, drop_blank = FALSE)
project_yelp <- politenessProjection(df_polite_train, stackOverflowData$Normalized.Score, df_yelp_polite_holdout)
project_yelp$test_proj
help(cbind)
yelp_polite_df <- cbind(yelpData,text_politness_scale=project_yelp$test_proj)
yelp_polite_df['1']
names(yelp_polite_df)[names(yelp_polite_df) == "1"] <- "politness"
names(yelp_polite_df)
write.csv(x = yelp_polite_df,row.names=FALSE,file = "D:/Trinity_DS/Dissertations/201907/politness/politness_predicted/yelp_polite.csv")
