library(shiny)
suppressWarnings(library(ggplot2))
library(HistData)
data(Galton)

# create linear model for predictions
trainFit<- lm(child~parent, data=Galton)

shinyServer(
  function(input, output) {
    heightFather<- reactive( {as.numeric(input$heightFather)})
    heightMother<- reactive( {as.numeric(input$heightMother)})
    childName<- reactive( {(input$childName)})
    heightMean<- reactive({mean(c(heightFather(), heightMother()*1.08))})
    heightChild<- reactive({predict( trainFit, data.frame(parent=heightMean()))})
    
    output$result <- renderText({
      if (input$goButton == 0)
        return()
      isolate({
      paste( if(childName()==''){
                'The child'
                }
                else{
                  childName()
                }, 
                             " is predicted to be ",
                             round(heightChild(),2),
                             " inches tall.")
        })
    })

    output$galtonPlot <- renderPlot({
      predictPoint<- reactive({ data.frame( heightMean(), heightChild())})
      
      # plot Galton's data, and predicted height
      g<- qplot(parent, child, data=Galton, geom=c("point", "smooth"), 
                method="lm", formula=y~x, 
                main="Galton's height data for parents and children", 
                xlab="Height of midparent", ylab="Child height")
      g<- g + 
        theme(panel.background = element_blank()) +
        geom_point(data=predictPoint(), aes(x=as.numeric(heightMean()), y=as.numeric(heightChild())), pch=13, 
                   color="blue", size=5) +
        geom_text(data=predictPoint(), aes(x=as.numeric(heightMean()),y=as.numeric(heightChild()), label = 
                                             round(heightChild(),2), vjust = -2))  +
        geom_hline(yintercept=as.numeric(heightChild()), color = 'blue', size = 1, style=3)
      geom_hline(yintercept=as.numeric(heightChild()), color = 'blue', size = 1, style=3)
      
      g
    })
    
    }
)