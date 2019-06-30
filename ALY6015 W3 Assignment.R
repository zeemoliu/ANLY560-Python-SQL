#1a
library(MASS)
library(readxl)

set.seed(12345)
row.number <- sample(nrow(assignment3),size=0.75*nrow(assignment3))
train = assignment3[row.number,]
test = assignment3[-row.number,]
dim(train)
dim(test)
head(train)
head(test)

#1b
predictionmodel<-lm(EP~.,data=train)
summary(predictionmodel)
predictionmodel1<-lm(EP~pressure,data = train)
summary(predictionmodel1)  
anova(predictionmodel1,predictionmodel)
predict(predictionmodel,test)
predict(predictionmodel1,test)
predicted_ys <- predict(predictionmodel, test)
observed_ys <- test$EP
SSE <- sum((observed_ys - predicted_ys)^2)
SST <- sum((observed_ys - mean(observed_ys))^2)
r2 <- 1 - SSE/SST
rmse <- sqrt(mean((predicted_ys - observed_ys)^2))
predicted_ys1<-predict(predictionmodel1,test)
observed_ys <- test$EP
SSE1 <- sum((observed_ys - predicted_ys1) ^ 2)
SST1 <- sum((observed_ys - mean(observed_ys)) ^ 2)
r21 <- 1 - SSE1/SST1
rmse1 <- sqrt(mean((predicted_ys1 - observed_ys)^2))
#1c
library(MASS)
stepAIC(predictionmodel)

#2a
library(glmnet)
set.seed(12345)
row.number = sample(x=1:nrow(assignment3), size=0.75*nrow(assignment3))
train = assignment3[row.number,]
test = assignment3[-row.number,]
x = model.matrix(EP~., train)[,-1]
y = train$EP
head(x, 8)
head(y, 8)

#2b
lasso.mod = glmnet(x, y, alpha=1, nlambda=100, lambda.min.ratio=0.0001)
set.seed(12345)
cv.out = cv.glmnet(x, y, alpha=1, nlambda=100, lambda.min.ratio=0.0001)
plot(cv.out)
best.lambda = cv.out$lambda.min
best.lambda
x_test = model.matrix(EP~., test)[,-1]
y_test = test$EP
y_predicted = predict(lasso.mod, s = best.lambda, newx = x_test)
y_predicted
y_test

#2c
sst = sum(y_test^2)
sse = sum((y_predicted - y_test)^2)
rsq = 1 - sse / sst
rsq

#3a
install.packages("pls")
library(pls)
set.seed(1)
number <- sample(x=1:nrow(assignment3),size = 0.75*nrow(assignment3))
train = assignment3[number,]
pcr_model <- pcr(EP~., data = train, scale= TRUE, validation = "CV")
validationplot(pcr_model, val.type = c("RMSEP"))
validationplot(pcr_model, val.type = c("MSEP"))
validationplot(pcr_model, val.type = c("R2"))
summary(pcr_model)

#3b
set.seed(1)
test = assignment3[-number,]
pcr_predict <- predict(pcr_model, test, ncomp = 4)
set.seed(1)
test = assignment3[-number,]
pcr_predict <- predict(pcr_model, test, ncomp = 4)
observed_pcr = test$EP
SSE_pcr <- sum((observed_pcr - pcr_predict)^2)
SST_prc <- sum((observed_pcr - mean(observed_pcr))^2)
r2_pcr <- 1 - SSE_pcr/SST_prc
r2_pcr


