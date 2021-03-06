% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{flights_missing}
\alias{flights_missing}
\title{Missing Airline Delays (US)}
\format{
A data frame with columns:
\describe{
\item{airport_code}{The variable is character. Airport Code}
\item{airport_name}{The variable is character. }
\item{month}{The variable is character. }
\item{year}{The variable is integer. }
\item{num_of_flights_total}{The variable is integer. }
\item{num_of_delays_carrier}{The variable is character. }
\item{num_of_delays_late_aircraft}{The variable is integer. }
\item{num_of_delays_nas}{The variable is integer. }
\item{num_of_delays_security}{The variable is integer. }
\item{num_of_delays_weather}{The variable is integer. }
\item{num_of_delays_total}{The variable is integer. }
\item{minutes_delayed_carrier}{The variable is integer. }
\item{minutes_delayed_late_aircraft}{The variable is integer. }
\item{minutes_delayed_nas}{The variable is integer. }
\item{minutes_delayed_security}{The variable is integer. }
\item{minutes_delayed_weather}{The variable is integer. }
\item{minutes_delayed_total}{The variable is integer. }
}
}
\source{
\url{https://think.cs.vt.edu/corgis/datasets/json/airlines/airlines.json}
}
\usage{
flights_missing
}
\description{
Monthly Airline Delays by Airport for US Flights, 2003-2016
}
\examples{
\dontrun{
flights_missing
}
}
\keyword{datasets}
