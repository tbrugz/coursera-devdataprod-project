
shinyUI(pageWithSidebar(
    headerPanel("Guess the slope and intercept for a regression line"),
    sidebarPanel(
        # http://www.mathwarehouse.com/algebra/linear_equation/slope-intercept-form.php
        p("Select the slope ad intercept for the regression line shown in the right and try to minimize the mean square error (",strong("MSE"),")."),
        p("You can check the ", strong("MSE Diff"), " field to see how close you are from the best fit."),
        
        sliderInput('a', 'Guess the slope (a)', value = 1, min = -1, max = 2, step = 0.02),
        sliderInput('b', 'Guess the intercept (b)', value = 0, min = -1, max = 2, step = 0.02),
        
        p("A ", strong("MSE Diff"), " of ",code("0.002")," or less is pretty good ;)")
    ),
    mainPanel(
        code('Petal.Width ~ Petal.Length, data=iris'),
        plotOutput(outputId = "plot"),
        fluidRow(
            column(6,
                h4("Mean Square Error (",strong("MSE"),"):"),
                verbatimTextOutput("mse")
            ),
            column(6,
                h4(strong("MSE Diff")," (MSE - fitted MSE):"),
                verbatimTextOutput("mseDiff")
            )
        )
    )
))
