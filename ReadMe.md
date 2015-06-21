---
title: "Predict child's height using Galton's data"
output: html_document
date: "Sunday, June 21, 2015"
---

#About the data

Galton's height data for parents and children was tabulated in 1885 to study the relationship between parent's height and their childrens. 

The midparent's height is an average of the fathers height and 1.08 times the mother's. In the data there are 205 different parents and 928 children. 

More details on the data set can be found at: <http://www.inside-r.org/packages/cran/HistData/docs/Galton>

This application has used the data to build a linear regression model to predict a child's height. 

#About the application

##Inputs

###Required Inputs:
This application has two Required inputs (in inches) with the slider bar:

- **Father's Height** in the range of 55-80 inches

- **Mother's Height** in the range of 55-80 inches

###Optional Input:

- **Name of child** is an Optional text input. If provided a value, the prediction text output will use this value. Else the value can be left blank.

###Action Button:
- **Update Prediction text now!** action button refreshes the text line with the child's predicted height value.

##Processing

The processing consists of the following steps:

- Load the data for 'Galton'

- Build a linear regression model using lm() with the parent's height as predictor and the child's height as the response.

- With the inputs, compute the mid-parent (mean) height after applying a factor of 1.08 to the mother's height

- Predict the child's height with the linear model

- Display the predicted height as text and plot the data and the prediction value

##Output

- **Prediction text** 
Displays the prediction text for the first time ONLY when the <I>Update Prediction text now!</I> button is clicked. Thereafter, the text will display/update ONLY IF the action but is clicked. 

Without a child's name entered in the text box, the following text will be displayed:

`The child is predicted to be [value] inches tall.`

If a child's name is specified, the name will be displayed in the text as:

`[Child's name] is predicted to be [value] inches tall.`


- **Prediction plot** 
Displays a plot of Galton's data set (dots), the linear regression model (thin blue line), and the Predicted Height of the child (horizontal blue line with mark). 

The plot will ALWAYS reflect the current predicted value based on the parent's heights. The plot will auto-zoom to display the data and the predicted value.
