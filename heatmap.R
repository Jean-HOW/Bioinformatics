library(ggplot2)

ANI = read.csv("ANI.csv", header=TRUE, dec = ".")
black.bold.italic.text <- element_text(face = "bold.italic", color = "black", size = "9")
black.bold.italic.text2 <- element_text(face = "bold.italic", color = "black", size = "9")
black.bold.text <- element_text(face = "bold", color = "black", size = "9", angle = 55, vjust=2.5, hjust = 0)
black.bold <- element_text(face = "bold", color = "black", size = 9)
p <- ggplot(data = ANI, aes(Var2, Var1)) + theme_bw() + theme(axis.text.y = black.bold.italic.text2,
                                                              axis.text.x = black.bold.text, axis.title.y = element_blank(), axis.title.x = element_blank(),legend.title =
                                                                black.bold, panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.border =
                                                                element_blank())+ scale_x_discrete(position = "top") + geom_tile(aes(fill = value), colour = "black") +
  geom_text(aes(label = round(value, 4)), size = 3.5) + scale_fill_gradient2(low = "steelblue", high = "skyblue", mid = "white", midpoint = 96)

p + labs(fill = "ANI value (%)")
