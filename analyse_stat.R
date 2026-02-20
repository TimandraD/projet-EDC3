title: "Analyse Statistique"
author: "Roman Delbare et Timandra Dhenry"
date: "2026-02-17"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Installation des packages
```{r}
install.packages("readxl")
install.packages("ggplot")
```

# Chargement des packages
```{r}
library(readxl)
library(ggplot2)
```

# Importation des données
```{r}
df = read_xlsx("df_finale.xltx")
```

# Création de graphiques pour les stats desc 
Les stats liées sont déjà produites, voir le code SAS 

## Age
```{r}
ggplot(df, aes(x = factor(age_moy,
                          levels = 1:6,
                          labels = c("< 30 ans",
                                     "30-39 ans",
                                     "40-49 ans",
                                     "50-59 ans",
                                     "60-69 ans",
                                     "≥ 70 ans")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  labs(x = "Âge moyen dans le quartier",
       y = "Proportions d'assurés concernés", 
       title = "         Plus de 70% des assurés vivent dans un quartier ou l'âge moyen \n         dépasse les 40 ans") +
  theme_minimal()

```
# Nb personne dans le foyer 

```{r}
ggplot(df, aes(x = factor(nb_foy,
                          levels = 1:4,
                          labels = c("1 (l'assuré vit seul)",
                                     "2",
                                     "3",
                                     "4 ou +"
                                     
                                     )))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  labs(x = "Nombre d'individus vivant dans le même logement que l'assuré",
       y = "Proportions d'assurés concernés", 
       title = "                           La majorité des assurés ne vivent pas seuls") +
  theme_minimal()
```

## Celibataire

```{r}
table(df$celib)
summary(df$celib)
```
```{r}
ggplot(df, aes(x = factor(celib,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 62%",
                                     "76-88%",
                                     "89-99%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de célibataires dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "Répartition des assurés selon la part de célibataires dans leur zone de résidence") +
  theme_minimal()

```

## Marie 

```{r}
ggplot(df, aes(x = factor(concu,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "Plus de 36%",
                                     "50-62%",
                                     "Plus de 62%",
                                     "76-88%",
                                     "89-99%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes en concubinage dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "       Le concubinage reste une situation relativement peu représenté") +
  theme_minimal()

```

## Autre relations

```{r}
ggplot(df, aes(x = factor(autre_rela,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "Plus de 50%",
                                     "Plus de 62%",
                                     "76-88%",
                                     "89-99%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part d'autres relations déclarées dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "Seul 10% des assurés vivent dans un quartier ou plus de la moitié des individus \nsont engagés dans un autre type de relation") +
  theme_minimal()
```


# ACP 

## Installation des packages 

```{r}
install.packages("FactoMineR")
install.packages("Factoshiny")
```

## Chargement des packages 

```{r}
library(FactoMineR)
library(Factoshiny)
```

## Lancement de l'ACP

On a pas besoin de l'id de l'assuré 

```{r}
ds = df[,-1]
```

On fait une ACP pour rester en adéquation avec les consignes 

```{r}
ACP = PCA(ds)
```

Rentrons dans le détail :

```{r}
Factoshiny(ds)
```

```{r}
res.PCA<-PCA(ds,graph=FALSE)
res.HCPC<-HCPC(res.PCA,nb.clust=4,consol=FALSE,graph=FALSE)
plot.HCPC(res.HCPC,choice='tree',title='Arbre hiérarchique')
plot.HCPC(res.HCPC,choice='map',draw.tree=FALSE,title='Projection des clusters sur le premier plan factoriel')
plot.HCPC(res.HCPC,choice='3D.map',ind.names=FALSE,centers.plot=FALSE,angle=60,title='Arbre hiérarchique sur le plan factoriel')
```

Détail sur le premier découpage : 

```{r}
res.HCPC2<-HCPC(res.PCA,nb.clust=4,consol=FALSE,graph=FALSE)
table(res.HCPC2$data.clust$clust)
```

Récuperation des clusters 

```{r}
clusters=res.HCPC2$data.clust
```

```{r}
library(dplyr)
```

```{r}
clust1 = filter(clusters, clust == 1)
```

```{r}
clust2 = filter(clusters, clust == 2)
```

```{r}
clust3 = filter(clusters, clust == 3)
```

```{r}
clust4 = filter(clusters, clust == 4)
```

```{r}
summary(clust4)
```

Récupération des BDD finales :

```{r}
write.csv(clust1, "cluster1.csv", row.names = FALSE)

write.csv(clust2, "cluster2.csv", row.names = FALSE)

write.csv(clust3, "cluster3.csv", row.names = FALSE)

write.csv(clust4, "cluster4.csv", row.names = FALSE)
```

