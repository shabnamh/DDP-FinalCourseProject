library(shiny)
library(ggplot2)
library(dplyr)

d <- diamonds[,c(1:4,7)]

shinyServer(function(input, output) {
    
        model1 <- lm(price ~ .  , data = d)
         
         model1pred <- reactive({
            carInput <- input$sliderCa
            cutInput <- input$cu
            colorInput <- input$co
            clarInput <- input$clar
            predict(model1, newdata = data.frame(carat = carInput, cut = cutInput, color = colorInput, clarity = clarInput))
         })
         
         
        output$plot1 <- renderPlot({
            carInput <- input$sliderCa
            cutInput <- input$cu
            colorInput <- input$co
            clarInput <- input$clar
            
           
            g <- ggplot(data = d, aes(x = carat, y = price)) +
                geom_point(aes(color = clarity), alpha = 0.3) + 
                geom_smooth(method = "lm")+
                geom_vline(xintercept = carInput, color = "orange")
            g
             
        })
        
         output$pred1 <- renderText({
             model1pred()
         })
        
        
    })