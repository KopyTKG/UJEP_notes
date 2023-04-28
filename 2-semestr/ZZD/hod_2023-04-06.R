rm(list=ls()) # smaz vsechny promenne

pole <- c(1,2,3)
pole2 <- c(4,5,6)

pole3 <- pole*pole2

# skalarni soucin
print(sum(pole3))


# skalarni soucin pomoci for cyklu
src <- 0
for(index in 1:length(pole)) {
   src <- src + pole[index] * pole2[index]
}

i <- 0

while (i < 10) {
  tmp <- paste(i+1, "Ahoj")
  #print(tmp)
  i <- i + 1
}

newPole <- c(1,2,3,4,5,6,7)
names(newPole) <- c("Po","Ut","Str","Ct","Pa","So","Ne")

print(newPole)


# matice

matice <- matrix(1:9, nrow=3, ncol=3, byrow=TRUE)

print(matice)
print(matice[1,]) # select first row
print(matice[,1]) # select first column
print(matice[1,1]) # select cell
print(matice[,-2]) # all but this one

rows <- c("r1","r2","r3")
collums <- c("c1","c2","c3")

rownames(matice) <- rows
colnames(matice) <- collums

print(matice)

print(matice["r1","c3"])

r4 <- 25:27
c4 <- 21:23

matice <- rbind(matice, r4)
matice <- cbind(matice, c4)

print(matice)

ss <- airquality
