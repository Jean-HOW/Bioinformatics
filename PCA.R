# PCA plot

pcs12 <- read.table("merge_v3_PCA20.eigenvec")
head(pcs12)
colnames(pcs12) <- c("Populations", "ID", "PC1", "PC2")
head(pcs12)
pcs12 <- pcs12[,1:4]
pcs12$Population <- as.factor(pcs12$Population)

pcs12$BiggerPop <- pcs12$Populations
pcs12$BiggerPop <- gsub("CHB|JPT|CHS|CDX|KHV", "EAS", pcs12$BiggerPop)
pcs12$BiggerPop <- gsub("CEU|TSI|FIN|GBR|IBS", "EUR", pcs12$BiggerPop)
pcs12$BiggerPop <- gsub("YRI|LWK|GWD|MSL|ESN|ASW|ACB", "AFR", pcs12$BiggerPop)
pcs12$BiggerPop <- gsub("MXL|PUR|CLM|PEL", "AMR", pcs12$BiggerPop)
pcs12$BiggerPop <- gsub("GIH|PJL|BEB|STU|ITU", "SAS", pcs12$BiggerPop)

ggplot(pcs12,
       aes(x = PC1 , y = PC2, group = BiggerPop)) +
  geom_point(aes(colour = BiggerPop)) +
  labs (x = "PC1 (51.4%)", y = "PC2 (25.5%)") +
  theme_grey()

ColourCode <- c("GWD" =
                  "#f0e442" ,
                "MSL" = "#EEE12A" ,
                "ESN" = "#F2E75A" ,
                "YRI" = "#ECDD13" ,
                "LWK" = "#F4EB71" ,
                "ASW" = "#ECDD13" ,
                "ACB" = "#f0e442" ,
                "MXL" = "#cc79a7" ,
                "CLM" = "#C5679B" ,
                "PEL" = "#d38bb3" ,
                "PUR" = "#cc79a7" ,
                "TSI" = "#009e73" ,
                "IBS" = "#00B886" ,
                "GBR" = "#009e73" ,
                "CEU" = "#006B4E" ,
                "FIN" = "#00B886" ,
                "BEB" = "#56b4e9" ,
                "GIH" = "#3faae6" ,
                "ITU" = "#9ad2f2" ,
                "PJL" = "#1C93D7" ,
                "STU" = "#83C8EF" ,
                "CDX" = "#e69f00" ,
                "CHS" = "#FFB000" ,
                "CHB" = "#CD8D00" ,
                "JPT" = "#FFB81A" ,
                "KHV" = "#FFB000",
                "90HC" = "#d55e00",
                "SSIP" = "#0072b2",
                "SSMP" = "#404040")

Shape <- c("90HC" = 19,
           "SSIP" = 19,
           "SSMP" = 19,
           "GWD" = 0 ,
           "MSL" = 1 ,
           "ESN" = 2 ,
           "YRI" = 3 ,
           "LWK" = 4 ,
           "ASW" = 5 ,
           "ACB" = 6 ,
           "MXL" = 0 ,
           "CLM" = 1 ,
           "PEL" = 2 ,
           "PUR" = 3 ,
           "TSI" = 0 ,
           "IBS" = 1 ,
           "GBR" = 2 ,
           "CEU" = 3 ,
           "FIN" = 4 ,
           "BEB" = 0 ,
           "GIH" = 1 ,
           "ITU" = 2 ,
           "PJL" = 3 ,
           "STU" = 4 ,
           "CDX" = 0 ,
           "CHS" = 1 ,
           "CHB" = 2 ,
           "JPT" = 3 ,
           "KHV" = 4)

Order <- c("90HC" ,
           "SSIP" ,
           "SSMP" ,
           "GWD" ,
           "MSL" ,
           "ESN" ,
           "YRI" ,
           "LWK" ,
           "ASW" ,
           "ACB" ,
           "MXL" ,
           "CLM" ,
           "PEL" ,
           "PUR" ,
           "TSI" ,
           "IBS" ,
           "GBR" ,
           "CEU" ,
           "FIN" ,
           "BEB" ,
           "GIH" ,
           "ITU" ,
           "PJL" ,
           "STU" ,
           "CDX" ,
           "CHS" ,
           "CHB" ,
           "JPT" ,
           "KHV" )

pcs12$Populations <- factor(pcs12$Populations, levels = Order)

png("merge_v3_PCA20_big.png", units="in", width=18, height=13, res=600)

pcs12 <- pcs12 %>% arrange(Populations)

ggplot(pcs12,
       aes(x = PC1 ,
           y = PC2,
           stroke = 1.5,
           shape = Populations, 
           colour = Populations,
           order = Populations)) +
  geom_point() +
  theme_gray() +
  scale_color_manual(values = ColourCode) +
  scale_shape_manual(values = Shape) +
  labs (x = "PC1 (51.4%)", y = "PC2 (25.5%)") +
  guides(shape = guide_legend(override.aes = list( stroke = 1.5)))
