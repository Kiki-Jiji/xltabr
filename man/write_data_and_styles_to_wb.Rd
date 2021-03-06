% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/combined.R
\name{write_data_and_styles_to_wb}
\alias{write_data_and_styles_to_wb}
\title{Write the styles and data contained in tab object to the workbook at tab$wb.
This is useful if the user has prepared a tab object, e.g. using auto_crosstab_to_tab
maybe performed some customisation, and now needs to write out to the workbook}
\usage{
write_data_and_styles_to_wb(tab)
}
\arguments{
\item{tab}{a table object}
}
\description{
Write the styles and data contained in tab object to the workbook at tab$wb.
This is useful if the user has prepared a tab object, e.g. using auto_crosstab_to_tab
maybe performed some customisation, and now needs to write out to the workbook
}
\examples{
crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- auto_crosstab_to_tab(crosstab)
tab <- write_data_and_styles_to_wb(tab)
}
