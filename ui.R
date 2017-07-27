library(shiny)
library(ggplot2)

data(diamonds, package = "ggplot2" )

shinyUI(fluidPage(
   
    titlePanel("Predicting Price of the Diamond "),
      
      sidebarLayout(
          sidebarPanel(
              h4("Please select the characteristics of the diamond:"),
              sliderInput("sliderCa", h4("Diamond's size"), 0.1, 10, step = 0.01, value = 1),
              
              selectInput("cu", label = h4("Diamond's Cut"), choices = list ("Fair" = "Fair",
                                                    "Good" = "Good" , "Very Good" = "Very Good",
                                                    "Premium" = "Premium", "Ideal"= "Ideal")), 
        
                                                                                                    
              selectInput("co", label = h4("Diamond's Color"), choices = list ("D"= "D", "E"="E",
                                                        "F"="F","G" = "G", "H"="H", "I"="I","J"="J")), 
                                                       
              selectInput("clar", label = h4("Diamond's Clarity"), choices = list("I1" = "I1", "SI2" = "SI2",
                                                       "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                                   "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
              submitButton("Submit") 
          ),
          
          mainPanel(
              plotOutput("plot1"),
              h3("Predicted Price of This Diamond:"),
              textOutput("pred1")
              
          )
      )
))
