
shinyUI(pageWithSidebar(
    headerPanel("Guess the slope and intercept for a regression line"),
    sidebarPanel(
        # http://www.mathwarehouse.com/algebra/linear_equation/slope-intercept-form.php
        sliderInput('a', 'Guess the slope (a)', value = 1, min = -1, max = 2, step = 0.02),
        sliderInput('b', 'Guess the intercept (b)', value = 0, min = -1, max = 2, step = 0.02)
    ),
    mainPanel(
        code('Petal.Width ~ Petal.Length, data=iris'),
        plotOutput(outputId = "plot"),
        h4("Mean Square Error (mse):"),
        verbatimTextOutput("mse")
    )
))
