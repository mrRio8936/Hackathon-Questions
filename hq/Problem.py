import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
import statsmodels.api as sm


# Load the World Indicators data from "World Indicators.csv"

Word_indicators = read_csv("World Indicators.csv")

'''

Preferably run the below programs in google colab

Make sure to upload the csv file in the directory

Change read csv directory to suitable directory


'''

# Your code starts after this line

import numpy as np
import sklearn
df = pd.read_csv("World Indicators.csv")


# Your code ends before this line

# Create a linear model between year and population in the US

# Your code starts after this line

dataset = pd.DataFrame(df,columns=["Country/Region","Year","Population Total"])
c = dataset.iloc[:,0].values
y = dataset.iloc[:,1].values
p = dataset.iloc[:,2].values
yearl = []
popu = []
for i,j,k in zip(c,y,p):
  if i == "United States":
      yearl.append(j)
      popu.append(k)
data = {"year":yearl,"population":popu}
united = pd.DataFrame(data)
x = united.iloc[:,0:1]
y = united.iloc[:,-1]
from sklearn.model_selection import train_test_split

X_train,X_test,y_train,y_test = train_test_split(
    x,y, test_size=0.30, random_state=42)
from sklearn.linear_model import LinearRegression
#cross validation
from sklearn.model_selection import cross_val_score
regression = LinearRegression()
regression.fit(X_train,y_train)
reg_pred= regression.predict(X_test)
print(regression.score(X_test,y_test)*100)

 
# Your code ends before this line

# Predict the expected population in the US in 2015

# Your code starts after this line

xpred = [[2015.0]]
print(regression.predict(xpred))

# Your code ends before this line

# For the data from Europe
# Create a linear model between Life Expectancy Female and the significant predictors among
#  Birth Rate
#  GDP
#  Health Exp % GDP
#  Infant Mortality Rate
#  Life Expectancy Male

# Summarize your model (only the final one)

# Hint: if you hit an issue with NaNs in the values consider using this: missing='drop'

# Your code starts after this line

dataset = pd.DataFrame(df,columns=["Region","Birth Rate","GDP","Health Exp % GDP","Infant Mortality Rate","Life Expectancy Male","Life Expectancy Female"])
r = dataset.iloc[:,0].values
b = dataset.iloc[:,1].values
g = dataset.iloc[:,2].values
h = dataset.iloc[:,3].values
i = dataset.iloc[:,4].values
m = dataset.iloc[:,5].values
f = dataset.iloc[:,6].values
birth = []
gdp = []
health = []
infant = []
male = []
female = []
for A,B,C,D,E,F,G in zip(r,b,g,h,i,m,f):
  if A == "Europe":
    birth.append(B)
    gdp.append(C)
    health.append(D)
    infant.append(E)
    male.append(F)
    female.append(G)
data = {"Birth Rate":birth,"GDP":gdp,"Health":health,"Infant":infant,"Male":male,"Female":female}
europe = pd.DataFrame(data)
europe = europe.dropna()
x = europe.iloc[:,0:5]
y = europe.iloc[:,-1]
X_train,X_test,y_train,y_test = train_test_split(
    x,y, test_size=0.30, random_state=42)
regression.fit(X_train,y_train)
print(regression.score(X_test,y_test)*100)
reg_pred= regression.predict(X_test)

# Your code ends before this line

# Predict the Expected Life Expectancy Female of a country with this characteristics
#  Birth Rate = 3%
#  GDP = 1 billion
#  Health Exp % GDP = 4%
#  Infant Mortality Rate = 5%
#  Life Expectancy Male = 80
# Round the prediction to two decimal points

# Your code starts after this line

print(regression.predict([[0.003,1e+09,0.004,0.005,80.0]]))

# Your code ends before this line

