simdata <- list()

simdata[["drive"]] <- c("Electric", "Internal combustion", "Hybrid")

simdata[["age"]] <- c("0-5 years", "5 years +", "Brand new")

simdata[["colour"]] <- c("Yellow", "Blue", "Green", "Black")

simdata[["type"]] <- c("Sport", "Sedan", "Supermini")

simdata["price"] <- c("Premium", "Mid-range", "Budget")

simdata[["date"]] <-
  as.Date(
    c(
      "2016-03-31",
      "2016-04-30",
      "2016-05-31",
      "2016-06-30",
      "2016-07-31",
      "2016-08-31",
      "2016-09-30",
      "2016-10-31",
      "2016-11-30",
      "2016-12-31",
      "2017-01-31",
      "2017-02-28",
      "2017-03-31"
    )
  )


get_all_combinations <- function(simdata) {

  make_df <- function(value, key) {
    # If value's not already a tibble, make it one
    if (("data.frame" %in% class(value))) {
      df <- value
    } else {
      df <- tibble::data_frame(value)
      names(df) <- key
    }
    df[["join_temp"]] <- 1
    df
  }

  dfs <- purrr::imap(simdata, make_df)
  all_combinations <- purrr::reduce(dfs, dplyr::full_join)
  all_combinations <- dplyr::select(all_combinations, -join_temp)
  all_combinations
}


df <- get_all_combinations(simdata)
df["value"] <- rnorm(nrow(df))

readr::write_csv(df, 'inst/extdata/synthetic_data.csv')

text_col <- c("text1", "text2")
date_col <- as.Date(c("2017-01-01", "2017-02-01"))
datetime_col <- c(Sys.time(), Sys.time())
int_col <- c(1L,2L)
f1_col <- c(0.001, 0.002)
f2_col <- c(1.1, 1.2)
f3_col <- c(1e8, 2e10)

df <- data.frame(text_col, date_col, datetime_col, int_col, f1_col, f2_col, f3_col)
lapply(df, class)
saveRDS(df, 'inst/extdata/test_number_types.rds')
