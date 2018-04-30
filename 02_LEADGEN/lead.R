library(MASS)
library(neuralnet)
lead_data <- read.csv('https://raw.githubusercontent.com/kulwadeesom/int492_256002/master/exercise01/lead_gen.csv')
samplesize = 0.60 * nrow(lead_data)
set.seed(80)
index <- sample( seq_len ( nrow ( lead_data ) ), size = samplesize )
datatrain <- lead_data[ index, ]
datatest <- lead_data[ -index, ]
max <- apply(lead_data , 2 , max)
min <- apply(lead_data, 2 , min)
set.seed(2)
NN = neuralnet(lead ~ source+returning+mobile+country+pages_viewed, datatrain, hidden = 3 , linear.output = T )
plot(NN)