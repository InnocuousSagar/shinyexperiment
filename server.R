# Server for app
library(shiny)
odds1 <- function(t1id, t2id, game, bo) {
	# unified predict code here
	return(t1id)
}
odds2 <- function(odd1) {
	return(1 / (1 - (1 / odd1)))
}
shinyServer(
	function(input, output) {
		output$otitle = renderText(c("Game Title : ", {input$title}, " | Match Date : ", {as.character(input$date)}, " | Best of : ", {input$box}))
		output$oteam1 = renderText(c("Team 1 ID : ", {input$id1}))
		output$oteam2 = renderText(c("Team 2 ID : ", {input$id2}))
		#odd1 <- ({
		#	input$calc
		#	isolate(odds1(input$id1, input$id2, input$title, input$box))
		#	})
		shit1 <- reactive({
			if(input$calci == 0)
			{
				return()
			}

			isolate({
				input$calci
				odd1 <<- odds1(input$id1, input$id2, input$title, input$box)
				c("Team 1 Odds : ", odd1)
				})
		})
		shit2 <- reactive({
			if(input$calci == 0)
			{
				return()
			}

			isolate({
				input$calci
				c("Team 2 Odds : ", odds2(odd1))
				})
		})
		output$owager1 <- renderText({shit1()})
		output$owager2 <- renderText({shit2()})
	}
)
