\name{ggfluctuation2}
\alias{ggfluctuation2}
\title{Fluctuation plot...}
\usage{ggfluctuation2(table, floor=0,
    ceiling=max(table$freq, na.rm
    = TRUE))}
\description{Fluctuation plot
Create a fluctuation plot.}
\details{A fluctutation diagram is a graphical representation of a contingency table. This fuction currently only supports 2D contingency tabless but extension to more should be relatively straightforward.}
\author{Barret Schloerke \email{bigbear@iastate.edu}, Haesung Kim \email{hae0510@iastate.edu}, Di Cook \email{dicook@iastate.edu} and Heike Hofmann \email{hofmann@iastate.edu}}
\keyword{hplot}
\arguments{\item{table}{a table of values, or a data frame with three columns, the last column being frequency}
\item{floor}{don't display cells smaller than this value}
\item{ceiling}{max value to compare to}}
\examples{ggfluctuation(table(movies$Action, movies$Comedy))
ggfluctuation(table(movies$Action, movies$mpaa))
ggfluctuation(table(movies$Action, movies$Comedy), type="colour")
ggfluctuation(table(warpbreaks$breaks, warpbreaks$tension))}