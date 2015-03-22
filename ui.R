library(shiny)

shinyUI(
  navbarPage("MTCars Data Analysis",
             tabPanel("Introduction",
                      p("This app allows the user to explore the data from the 'mtcars' dataset in R."),
                      p("To begin exploring, select one of the tabs on the top navigation bar."),
                      hr(),
                      h2("Table of Contents"),
                      hr(),
                      h3("1. Dataset overview"),
                      p("In this section, more information is provided on the variables included in the dataset."),
                      p("A visual correlation matrix is also included to highlight the correlation of variables."),
                      h3("2. Analysis"),
                      p("In this section, the user can select and view the relationships between variables, along with the regression models"),
                      h3("3. Source Code"),
                      p("Reference to the source code can be found under this tab.")
                    
             ),
             tabPanel("Dataset Overview",
                      tabsetPanel(type = "tabs", 
                                  tabPanel("Summary of Variables",
                                           h2("Motor Trend Car Road Tests"),
                                           hr(),
                                           h3("Description"),
                                           helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                                                    " and comprises fuel consumption and 10 aspects of automobile design and performance",
                                                    " for 32 automobiles (1973-74 models)."),
                                           h3("Format"),
                                           p("A data frame with 32 observations on 11 variables."),
                                           
                                           p("  1.   Mileage/miles per gallon (mpg)"),
                                           p("  2.	 Number of cylinders (cyl)"),
                                           p("  3.	 Displacement in cubic inches (disp)"),
                                           p("  4.	 Gross horsepower (hp)"),
                                           p("  5.	 Rear axle ratio (drat)	 "),
                                           p("  6.	 Weight in lb/1000 (wt)"),
                                           p("  7.	 ACceleration or 1/4 mile time (qsec)"),
                                           p("  8.	 V/S (vs)"),
                                           p("  9.	 Transmission (am, where 0 = automatic, 1 = manual)"),
                                           p("  10.	 Number of forward gears (gear)"),
                                           p("  11.  Number of carburetors (carb)"),
                                           
                                           h3("Source"),
                                           
                                           p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")),
                                  
                                  tabPanel("Overview of Variables",
                                           h2("Visual Correlation Matrix of Variables"),
                                           plotOutput("corrmatrix"))
                                                                                                  
                      )),
             
             
                      
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("Factors affecting perfomance of a motor car"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable1", "Variable 1:",
                                        c("Mileage" = "mpg",
                                          "Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            selectInput("variable2", "Variable 2:",
                                      c("Mileage" = "mpg",
                                        "Number of cylinders" = "cyl",
                                        "Displacement (cu.in.)" = "disp",
                                        "Gross horsepower" = "hp",
                                        "Rear axle ratio" = "drat",
                                        "Weight (lb/1000)" = "wt",
                                        "1/4 mile time" = "qsec",
                                        "V/S" = "vs",
                                        "Transmission" = "am",
                                        "Number of forward gears" = "gear",
                                        "Number of carburetors" = "carb"
                                      ))),  
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Scatter Plot", plotOutput("mtcarsPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mtcarsPlot2"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Source Code",
                      p("The source code for this shiny app can be found at:"),
                      a("https://github.com/xtrios")
             )
  )
)
