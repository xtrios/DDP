library(shiny)
library(datasets)

mtData <- mtcars
mtData$am <- factor(mtData$am, labels = c("Automatic", "Manual"))


shinyServer(function(input, output) {
  

  relation <- reactive({paste(input$variable1,"~",input$variable2)})
 
  fit <- reactive({step(lm(as.formula(relation()), data=mtData,trace=0))})
  
  output$caption <- renderText({relation()})
  
  output$mtcarsPlot <- renderPlot({
    xvariable<- as.vector(mtData[,input$variable1])
    yvariable<- as.vector(mtData[,input$variable2])
        plot(xvariable,yvariable,
         xlab=input$variable1,ylab=input$variable2,pch=19,col=35,cex=1.5)
  })
  
output$corrmatrix<- renderPlot({
  corrplot(cor(mtData),type="lower")},height = 700, width = 700)
  
  
  
  output$fit <- renderPrint({
    if(input$variable1==input$variable2)
    {'No meaningful fit can be obtained - variables selected are identical'}
    else{
    summary(fit())
    }
  })
  
  output$mtcarsPlot2 <- renderPlot({
    with(mtData, {
      plot(as.formula(relation()))
      abline(fit(), col=2)
    })
  })
  
})