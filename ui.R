# ui.R

library(shiny)

shinyUI(navbarPage("Coursera Capstone Project - Text prediction",
                   tabPanel("Application",
                            headerPanel("Text Prediction"),
                            sidebarPanel(
                                
                                radioButtons("level", "N-Gram level:",
                                             c("Bigram" = "bingram",
                                               "Trigram" = "trigram",
                                               "Quadgram" = "quadgram",
                                               "All (backoff strategy)" = "all"),
                                             selected="all"),
                                br(),
                                p("Select a strategy above and enter your text."),
                                p("Please allow some time initially to load the data structures."),
                                p("When the word 'Prediction:' appears below the text box, you're good to go!"),
                                p("Thanks!")
                            ),
                            mainPanel(
                                h3("Text prediction tool"),
                                textInput("textInput", "Text Input"),
                                textOutput("textOutput")
                            )
                   ),
                   tabPanel("Documentation",
                            p("This Shiny app implements a text prediction algorithm that tries to predict the next word given an input string."),
                            p("The application makes use of N-Gram data structures of size 2, 3, and 4. Using the previous 1, 2, or 3 words to predict the next one."),
                            p("A fallback strategy is used when 'All' is selected. It first tries the 4-gram, and if the result is empty, it tries the next lowest n-gram."),
                            p("The source of the corpus data can be found at "),
                            a("Data Link", href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"),
                            br(),
                            br(),
                            p("To use this application:"),
                            tags$div(
                                tags$ul(
                                    tags$li("Select the strategy using the radio buttons."),
                                    tags$li("Enter the text in the text box."),
                                    tags$li("The predicted word is shown below the input box.")
                                )
                            )
                   )
))
