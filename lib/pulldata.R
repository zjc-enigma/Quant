library("quantmod")
library("tseries")


# format:
# col1    code
# col2    class
# col3    name
stock.list.file <- "../conf/mystock"



# func name : get.trade.data.func
# param1 : stock.code | 600036.ss
# param2 : begin.date | 2010-03-20
# param3 : end.date | 2011-01-05
# return : trade.data | stock.code \t
get.trade.data.func <- function(stock.code,
                                begin.date,
                                end.date) {

  message("Pulling trade data from internet")
  symbol.data <- getSymbols(symbol.list,
                            from=start.date,
                            to=end.date,
                            src="yahoo",
                            auto.assign=F)

  message("Pulling trade data finished")

  return(list(stock.code, symbol.data))
}


get.split.data.func <- function(stock.code) {
  message("Pulling split data")

  stock.split.data <- getSplits(stock.code.list)

  message("Pulling split data finished")

  return(list(stock.code.list,
              stock.split.data))

}


get.financial.data.func <- function(stock.code) {
  message("Pulling financial data")

  stock.financial.data <- getFinancials(stock.code.list, auto.assign=F)
  message("Pulling financial data finished")
  return(list(stock.code.list,
              stock.financial.data))

}


stock.list <- read.csv(file=stock.list.file,
                       header=T,
                       stringsAsFactors=F,
                       sep="\t")

stock.code <- paste0(stock.list$code, ".", stock.list$class)
