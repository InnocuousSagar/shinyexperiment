# UI for app
library(shiny)
shinyUI(fluidPage(theme = "bootstrap.min.css",

	headerPanel("",windowTitle = "Unified Haggard"),
	h2(strong("Unikrn Skill Rating / Odds"), align = "left"),

	fluidRow(

		column(3,
			sidebarPanel(width = '100%',
							selectInput("title", "Game Title",
					            c("Counter Strike:GO" = "csgo",
					              "DOTA2" = "d2",
					              "League Of Legends" = "lol")),
							# numericInput('box', 'Best Of', 1, min = 1, max = 7, step = 1),
							sliderInput('box', 'Best Of', min = 1, max = 7, value = 3, step = 1, ticks = F),
							numericInput('id1', 'Team 1 ID', value = 0, min = 0),
							numericInput('id2', 'Team 2 ID', value = 0, min = 0),
							checkboxGroupInput("chk1", "Purpose",
								c("Trueskill Comparison" = "1",
								"Unikrn Odds" = "2")),
							dateInput("date", "Match Date", max = Sys.Date() + 1),
							actionButton("calci", "Calculate", width = '100%')
						)
			),
		
		column(9,
			mainPanel(width = '100%',
						h4(strong(textOutput("otitle")), align = "center"),
						hr(),
						fluidRow(
							column(6,
								strong(textOutput("oteam1"), align = "center"),
								strong(textOutput('owager1'), align = "center")
							),
							column(6,
								strong(textOutput("oteam2"), align = "center"),
								strong(textOutput("owager2"), align = "center")
							)
						)
					)
			)
	)
))
