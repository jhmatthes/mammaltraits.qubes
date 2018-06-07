library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Fantastic Beasts: Visualization of the PanTHERIA dataset"),
  
  sidebarLayout(
    
    sidebarPanel(    
      
      #Header
      selectInput("xvar",label="1. Select the x-variable",
                  choices= c("Mass"=7, "Metabolic Rate"=56, 
                             "Gestation Duration"=16,"Home Range"=18,"Litter Size"=21,
                             "Max Longevity"=23,"Neonate Mass"=24,"Population density"=26,
                             "Social group size"=29,"Sexual maturity age"=28,"Weaning age"=33,
                             "Mean annual precipitation"=52,"Mean annual temperature"=53),
                  selected=7),
      
      selectInput("yvar",label="2. Select the y-variable",
                  choices= c("Mass"=7, "Metabolic Rate"=56, 
                             "Gestational Duration"=16,"Home Range"=18,"Litter Size"=21,
                             "Max Longevity"=23,"Neonate Mass"=24,"Population density"=26,
                             "Social group size"=29,"Sexual maturity age"=28,"Weaning age"=33,
                             "Mean annual precipitation"=52,"Mean annual temperature"=53),
                  selected = 56),
      
      selectInput("order",label="3. Select the Order",
                  choices = as.factor(c("All",as.character(order.names)))),
      
      selectInput("fitdata",label="4. Fit a Model to the Data",
                  choices = as.factor(c("None","Linear")))
      , width = 3),
    #Output functions
    mainPanel(
      p("This is a visualization of the ", 
        a("PanTHERIA dataset ", href="http://esapubs.org/Archive/ecol/E090/184/default.htm", target="_blank"),
        ", which is described in the journal article ",
        a("Jones, et. al., 2009", href="http://onlinelibrary.wiley.com/doi/10.1890/08-1494.1/abstract", target="_blank"),
        ". These values represent species-level data on physiology and life history traits for all 
        living and recently extinct mammals."),
      p("To start, pick x- and y-variables to plot. Each point on the graph shows data for one species. You can either plot All orders, 
        in which case the colors of the data points indicate different orders, or you can select
        an individual order, in which case the colors indicate different families."),
      plotOutput("myplot", brush = "plot_brush"),
      h5("The linear model fit to the log-transformed data is:"),
      htmlOutput("equation"),
      tags$hr(),
      h5("Click & drag to draw a box around points on the graph above to see more detailed info about the Order and Species of those data here:"),
      verbatimTextOutput("info"),
      
      tags$hr(),
      tags$footer("Shiny app developed by: "),
      tags$footer(p(a("Jackie Hatala Matthes", href="http://matthesecolab.com", target="_blank"),
                    ", Assistant Professor of Biological Sciences, Wellesley College (2018) "),
                  p("App source code available on ",a("GitHub",href = "https://github.com/jhmatthes/mammal-traits")),
                  p(" "),
                  tags$img(alt="Creative Commons License", style="border-width:0", src="https://i.creativecommons.org/l/by/4.0/88x31.png"),
                  tags$body("This work is licensed under a", a("Creative Commons Attribution 4.0 International License", href="http://creativecommons.org/licenses/by/4.0/"),".")))
      )
  
  
  
)
)