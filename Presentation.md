Predict child's height using Galton's data
========================================================
author: Coursera Project
date: 06/22/2015
transition: rotate

About the data
========================================================

Galton's height data for parents and children was tabulated in 1885 to study the relationship between parent's height and their childrens. 

The midparent's height is an average of the fathers height and 1.08 times the mother's. In the data there are 205 different parents and 928 children. 

More details on the data set can be found at: http://www.inside-r.org/packages/cran/HistData/docs/Galton

This application has used the data to build a linear regression model to predict a child's height. 

Inputs
========================================================

This application has two Required inputs (in inches) with the slider bar:

- **Father's Height** in the range of 55-80 inches
- **Mother's Height** in the range of 55-80 inches

It also accepts an Optional text input: **Name of child**. If provided a value, the prediction text output will use this value. Else the value can be left blank.

The **Update Prediction text now!** action button refreshes the text line with the child's predicted height value.

Model and Outputs
========================================================

<small>The application consists of the following steps:

- Load the data for 'Galton' and build a linear regression model using lm() with the parent's height as predictor and the child's height as the response.


```r
library( HistData)
data( Galton)
trainFit<- lm( child~parent, data=Galton)
# Display some data
head(Galton, 2)
```

```
  parent child
1   70.5  61.7
2   68.5  61.7
```

- With the inputs, compute the mid-parent (mean) height after applying a factor of 1.08 to the mother's height
</small>

Model and Outputs [continued]
========================================================

<small>The child's height is predicted using the linear model


```r
heightChild<- reactive({predict( trainFit, data.frame(parent=heightMean()))})
```

<h4>Outputs</h4>
- **Prediction text** displays the prediction text ONLY when the <I>Update Prediction text now!</I> button is clicked for the first time. If a child's name is specified, the name will be displayed in the text.

The text will display/update ONLY IF the action but is clicked. 

- **Prediction plot** displays a plot of Galton's data set (dots), the linear regression model (thin blue line), and the Predicted Height of the child (horizontal blue line with mark). 

The plot will ALWAYS reflect the current predicted value based on the parent's heights.

</small>
