\name{ggpairs}
\alias{ggpairs}
\title{ggpairs - A GGplot2 Matrix}
\usage{
  ggpairs(data, columns = 1:ncol(data), title = "",
    upper = list(), lower = list(), diag = list(),
    params = NULL, ..., axisLabels = "internal",
    legends = FALSE, verbose = FALSE)
}
\arguments{
  \item{data}{data set using.  Can have both numerical and
  categorical data.}

  \item{columns}{which columns are used to make plots.
  Defaults to all columns.}

  \item{title}{title for the graph}

  \item{upper}{see Details}

  \item{lower}{see Details}

  \item{diag}{see Details}

  \item{params}{vector of parameters to be applied to
  geoms.  Each value must have a corresponding name, such
  as \code{c(binwidth = 0.1)}.}

  \item{...}{other parameters being supplied to geom's aes,
  such as color}

  \item{axisLabels}{either "internal" for labels in the
  diagonal plots, "none" for no axis labels, or "show" to
  display axisLabels}

  \item{legends}{boolean to determine the printing of the
  legend in each plot. Not recommended.}

  \item{verbose}{boolean to determine the printing of "Plot
  #1, Plot #2...."}
}
\value{
  ggpair object that if called, will print
}
\description{
  Make a matrix of plots with a given data set
}
\details{
  upper and lower are lists that may contain the variables
  'continuous', 'combo' and 'discrete'. Each element of the
  list is a string implementing the following options:
  continuous = exactly one of ('points', 'smooth',
  'density', 'cor', 'blank'); combo = exactly one of
  ('box', 'dot', 'facethist', 'facetdensity', 'denstrip',
  'blank'); discrete = exactly one of ('facetbar','ratio',
  'blank').

  diag is a list that may only contain the variables
  'continuous' and 'discrete'. Each element of the diag
  list is a string implmenting the following options:
  continuous = exactly one of ('density', 'bar', 'blank');
  discrete = exactly one of ('bar', 'blank').

  If a list option it will be set to the function default.
  If 'blank' is ever chosen as an option, then ggpairs will
  produce a blank plot, as if nothing was printed there.
}
\examples{
# plotting is reduced to the first couple of examples.
# Feel free to print the ggpair objects created in the examples

data(tips, package="reshape")
pm <- ggpairs(tips[,1:3])
# pm
pm <- ggpairs(tips)
# pm
pm <- ggpairs(tips, upper = "blank")
# pm


# Custom Example
pm <- ggpairs(
  tips[,1:4],
  upper = list(continuous = "density", combo = "box"),
  lower = list(continuous = "points", combo = "dot")
)
# pm

# Use sample of the diamonds data
data(diamonds, package="ggplot2")
diamonds.samp <- diamonds[sample(1:dim(diamonds)[1],200),]

# Custom Example
pm <- ggpairs(
 diamonds.samp[,1:3],
 upper = list(continuous = "density", combo = "box"),
 lower = list(continuous = "points", combo = "dot"),
 color = "cut",
 title = "Diamonds"
)
# pm

# Will plot four "Incorrect Plots"
bad_plots <- ggpairs(
  tips[,1:3],
  upper = list(continuous = "wrongType1", combo = "wrongType2"),
  lower = list(continuous = "IDK1", combo = "IDK2", discrete = "mosaic"),
)
# bad_plots

# Labels on the outside, grids won't line up
pm <- ggpairs(tips[,1:3], axisLabels="none")
# pm

# Custom Examples
custom_car <- ggpairs(mtcars[,c("mpg","wt","cyl")], upper = "blank", title = "Custom Example")
# ggplot example taken from example(geom_text)
  plot <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars)))
  plot <- plot + geom_text(aes(colour=factor(cyl)), size = 3) + scale_colour_discrete(l=40)
custom_car <- putPlot(custom_car, plot, 1, 2)
personal_plot <- ggally_text(
  "ggpairs allows you\\nto put in your\\nown plot.\\nLike that one.\\n <---"
)
custom_car <- putPlot(custom_car, personal_plot, 1, 3)
# custom_car
}
\author{
  Barret Schloerke \email{schloerke@gmail.com}, Jason
  Crowley \email{crowley.jason.s@gmail.com}, Di Cook
  \email{dicook@iastate.edu}, Heike Hofmann
  \email{hofmann@iastate.edu}, Hadley Wickham
  \email{h.wickham@gmail.com}
}
\keyword{hplot}

