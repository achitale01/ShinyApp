shinyUI(pageWithSidebar(
  headerPanel("Predict child's height using Galton's data"),
  sidebarPanel( 
    h2('Description'),
    p('This application uses the tabulated data set by Galton in 1885 to study the relationship between parent\'s height and their childrens. Please refer to the documentation for details.'),
    sliderInput("heightFather", label = h4("Father's height in inches"),
                        min = 55, max = 80, , step = .5, value = 70),
    sliderInput("heightMother", label = h4("Mother's height in inches"),
                       min = 55, max = 80, , step = .5, value = 60),
    textInput("childName", label = h4("Name of child"), 
              value = "")
  ),
  mainPanel(
    h3('Prediction text'),
    fluidRow(
    column( 3,
            actionButton( "goButton", "Update Prediction text now!")),
    column( 9,
            h4(textOutput('result')))
    ),
    h3('Prediction plot'),
    p('Note: Prediction plot actively refreshes based on slider selection'),
    plotOutput('galtonPlot')
  )
))