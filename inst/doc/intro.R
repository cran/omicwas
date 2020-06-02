## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("fumi-github/omicwas")

## ---- eval = FALSE------------------------------------------------------------
#  if (!requireNamespace("BiocManager", quietly = TRUE))
#     install.packages("BiocManager")
#  BiocManager::install("sva")

## ----setup--------------------------------------------------------------------
library(omicwas)

## -----------------------------------------------------------------------------
?ctassoc

## -----------------------------------------------------------------------------
data(GSE42861small)
X = GSE42861small$X
W = GSE42861small$W
Y = GSE42861small$Y
Y = Y[seq(1, 20), ] # for brevity
C = GSE42861small$C

## -----------------------------------------------------------------------------
?GSE42861small

## -----------------------------------------------------------------------------
result = ctassoc(X, W, Y, C = C,
                 test = "full")
result$coefficients

## -----------------------------------------------------------------------------
result = ctassoc(X, W, Y, C = C,
                 test = "nls.logit",
                 regularize = TRUE)
print(result$coefficients, n = 20)

## -----------------------------------------------------------------------------
data(GTExsmall)
X = GTExsmall$X
W = GTExsmall$W
Y = GTExsmall$Y + 1
Y = Y[seq(1, 20), ] # for brevity
C = GTExsmall$C

## -----------------------------------------------------------------------------
?GTExsmall

## -----------------------------------------------------------------------------
result = ctassoc(X, W, Y, C = C,
                 test = "full")
result$coefficients

## -----------------------------------------------------------------------------
result = ctassoc(X, W, Y, C = C,
                 test = "nls.log",
                 regularize = TRUE)
print(result$coefficients, n = 15)

## -----------------------------------------------------------------------------
?ctcisQTL

## -----------------------------------------------------------------------------
data(GSE79262small)
X    = GSE79262small$X
Xpos = GSE79262small$Xpos
W    = GSE79262small$W
Y    = GSE79262small$Y
Ypos = GSE79262small$Ypos
C    = GSE79262small$C
X    = X[seq(1, 3001, 100), ] # for brevity
Xpos = Xpos[seq(1, 3001, 100)]
Y    = Y[seq(1, 501, 100), ]
Ypos = Ypos[seq(1, 501, 100)]

## -----------------------------------------------------------------------------
?GSE79262small

## -----------------------------------------------------------------------------
ctcisQTL(X, Xpos, W, Y, Ypos, C = C)

## -----------------------------------------------------------------------------
head(
  read.table(file.path(tempdir(), "ctcisQTL.out.txt"),
             header = TRUE,
             sep ="\t"))

