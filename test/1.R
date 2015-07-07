library("quantmod")

begin.date <- "2015-06-01"

CMB <- getSymbols("600036.ss",
                  from=begin.date,
                  to=Sys.Date(),
                  src="yahoo",
                  auto.assign=F)

getSplits("600036.ss")


getFinancials("600036.ss", auto.assign=F)

library(tseries)
get.hist.quote(instrument='601398.ss',start='2008-05-10',end='2010-03-20')
