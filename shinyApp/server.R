library(ggplot2)

shinyServer(
    function(input, output) {
        g <- ggplot(data=iris, aes(x = Petal.Length, y=Petal.Width)) +
            geom_point() #+ ggtitle("Petal.Width ~ Petal.Length, data=iris") +
            expand_limits(x = 0, y = 0)
        fit<-lm(Petal.Width ~ Petal.Length, data=iris)
        fitMse <- mean(fit$residuals^2)
        
        output$plot <- reactivePlot(function() {
            g + geom_abline(intercept = input$b, slope = input$a, colour = "red", size = 2)
        })
        
        mse <- reactive({
            iris$est.Petal.Width <- input$b + iris$Petal.Length * input$a
            mse2 <- mean((iris$est.Petal.Width - iris$Petal.Width)^2)
            mse2
        })
        output$mse <- renderText({mse()})
        output$mseDiff <- renderText({mse()-fitMse})
    }
)
