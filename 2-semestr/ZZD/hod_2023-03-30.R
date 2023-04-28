# def
a <- 5
b <- 3
c <- 2
print(a %% b == c)
print(b > a | c < b)
print((b != a & (c <= a -b)) | b %% c < c)

const <- 3/2 * pi
x <- 2
print(cos(x + const))
x <- 4
print(cos(x + const))

text <- "copak zlaTOvláska ale JMELí!"
print(text)
text <- tolower(text)
lenght <- nchar(text)
s <- toupper(substring(text,1,1))
f <- substring(text, 2,6)
u <- toupper(substring(text,7,7))
l <- substring(text, 8, lenght)
text <- paste0(s,f,u,l)

print(text)