rankhospital <- function(state, type, num = "best") {
  ## Read outcome data
  outcomeState <- subset(outcome, outcome$State==state)
  if(nrow(outcomeState)==0){
    stop("invalid state")
  }
  ## Check that state and outcome are valid
  typeCode <- NULL
  if(type=="heart attack"){
    typeCode <- 11
  }else if(type=="heart failure"){
    typeCode <- 17
  }else if(type=="pneumonia"){
    typeCode <- 23
  }else{
    stop("invalid outcome")
  }
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outcomeState[,typeCode] <- as.numeric(outcomeState[,typeCode])
  outcomeState <- outcomeState[order(outcomeState[, typeCode], outcomeState[, 2]), ]
  outcomeState[1,2]
}