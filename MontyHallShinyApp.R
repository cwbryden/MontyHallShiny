#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Monty Hall Win Probability with Switching"),

    # Sidebar with a slider input for number of trials 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "num",
                        label = "Choose Desired Number of Trials",
                        value = 30, 
                        min = 1,
                        max = 100000),
            
            selectInput(inputId = "switch",
                        label = "Would you like to switch always or never?",
                        choices = c("Always", "Never"))),
        

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput(outputId = "probPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$ProbPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


# monty_hall <- function(switch = logical()){
#     doors <- c(1, 2, 3)
#     names(doors) <- sample(c("Lose", "Lose", "Win"))
#     winner <- which(names(doors) == "Win")
#     guess <- sample(doors, 1)
#     if(guess == winner){
#         reveal <- sample(doors[doors != winner], 1)
#     } else {
#         reveal <- doors[doors != winner & doors != guess]
#     }
#     if (switch == TRUE) {
#         switched_door <- doors[doors != guess & doors != reveal]
#         return(winner == switched_door)
#     } else {
#         return(winner == guess)}}

