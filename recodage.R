---
title: "Analyse Stat"
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

## Nb personne dans le foyer 

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

## Niveau d'études
### haute étude

```{r}
table(df$H_stud)
summary(df$H_stud)
```
```{r}
ggplot(df, aes(x = factor(H_stud,
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
  labs(x = "Part de personnes ayant fait des hautes études dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "            La majorité des gens dans le quartier de l'assuré \n            n'ont pas fait de hautes études ") +
  theme_minimal()
```

### Etude moyenne

```{r}
ggplot(df, aes(x = factor(M_stud,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 63%",
                                     "76-88%",
                                     "89-99%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes ayant fait des études d'un niveau moyen dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "       Répartition des personnes dans le quartier qui ont fait des \n      études d'un niveau intermédiaire") +
  theme_minimal()
```

### Peu d'étude

```{r}
ggplot(df, aes(x = factor(L_stud,
                          levels = 0:9,
                          labels = c("moins de 10%",
                                     "moins de 10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "63-75%",
                                     "76-88%",
                                     "Plus de 89%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes ayant des études relativement basse dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "       Répartition des personnes ayant fait des études relativement basse \n     dans le quartier de l'assuré") +
  theme_minimal()
```

## La possession de voiture

### 0 voiture

```{r}
ggplot(df, aes(x = factor(voit0,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "Plus de 50%",
                                     "63-75%",
                                     "76-88%",
                                     "Plus de 89%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part ded personnes n'ayant pas de voiture dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "          Répartition des personnes qui n'ont pas de voiture \n      dans le quartier de l'assuré") +
  theme_minimal()
```

### 1 voiture

```{r}
ggplot(df, aes(x = factor(voit1,
                          levels = 0:9,
                          labels = c("36% ou moins",
                                     "36% ou moins",
                                     "36% ou moins",
                                     "36% ou moins",
                                     "37-49%",
                                     "50-62%",
                                     "63-75%",
                                     "76-88%",
                                     "Plus de 89%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes ayant une voiture dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "          Répartition des personnes qui ont une voiture dans \n          le quartier de l'assuré") +
  theme_minimal()
```

### 2 voitures

```{r}
ggplot(df, aes(x = factor(voit2,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "Plus de 37%",
                                     "Plus de 50%",
                                     "63-75%",
                                     "76-88%",
                                     "plus de 89%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes ayant deux voitures dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "          Répartition des personnes vivant dans le quartier de \n          l'assuré ayant deux voitures") +
  theme_minimal()
```

## Avoir des enfants
### Sans enfants 

```{r}
ggplot(df, aes(x = factor(sans_enf,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 63%",
                                     "76-88%",
                                     "plus de 89%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes n'ayant pas d'enfants dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                Répartition des assurés qui n'ont pas d'enfants") +
  theme_minimal()
```

### Avec enfants

```{r}
ggplot(df, aes(x = factor(avec_enfant,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 63%",
                                     "76-88%",
                                     "plus de 89%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part de personnes ayant des enfants dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                Part des personnes ayant des enfants dans le quartier des assurés") +
  theme_minimal()
```

## Partie PCS
### PCS Cadre

```{r}
ggplot(df, aes(x = factor(PCS_CADRE,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des PCS niveau cadre dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                La majorité des personnes dans le quartier de l'assuré \n                ne sont pas cadre") +
  theme_minimal()
```

### PCS agriculteur

```{r}
ggplot(df, aes(x = factor(PCS_AGRI,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "Plus de 24%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "100%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant une PCS niveau agriculteur dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                La majorité des personnes dans le quartier de l'assuré \n                ne sont pas agriculteur") +
  theme_minimal()
```

### PCS intermédiaire

```{r}
ggplot(df, aes(x = factor(PCS_INTER,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "63-75%",
                                     "Plus de 76%",
                                     "Plus de 76%",
                                     "Plus de 76%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des PCS niveau intermédiaire dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                La majorité des personnes vivant dans le quartier de l'assuré \n               ont une PCS de niveau intermédiaire") +
  theme_minimal()
```

### PCS ouvrier qualifié

```{r}
ggplot(df, aes(x = factor(PCS_OUVQUAL,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 63%",
                                     "Plus de 63%",
                                     "Plus de 63%",
                                     "Plus de 63%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des PCS de niveau ouvrier qualifié dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                 Part des ouvriers qualifiés dans le quartier de l'assuré") +
  theme_minimal()
```

### PCS TOP

```{r}
ggplot(df, aes(x = factor(PCS_TOP,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 63%",
                                     "Plus de 63%",
                                     "Plus de 63%",
                                     "Plus de 63%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant une PCS niveau 'supérieur' dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "           Structure des PCS de niveau supérieur dans le quartier de l'assuré") +
  theme_minimal()
```

## Partie revenu
### Revenu 1 
Tranche de revenu la plus basse
```{r}
ggplot(df, aes(x = factor(REV1,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "63-75%",
                                     "Plus de 76%",
                                     "Plus de 76%",
                                     "Plus de 76%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant qui ont des revenus dit faible dans le quartier de l'assuré",
       y = "Proportion d'assurés concernés",
       title = "                Les personnes de très faible revenu sont minoritaires \n                dans le quartier de l'assuré") +
  theme_minimal()
```

### Revenu 2

```{r}
ggplot(df, aes(x = factor(REV2,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "63-75%",
                                     "Plus de 76%",
                                     "Plus de 76%",
                                     "Plus de 76%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des revenus faible dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                Revenu 2 dans le quartier") +
  theme_minimal()
```

###  Revenu 3

```{r}
ggplot(df, aes(x = factor(REV3,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "37-49%",
                                     "50-62%",
                                     "Plus de 63%",
                                     "Plus de 63%",
                                     "Plus de 63%",
                                     "Plus de 63%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des revenus intermédiaire dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                La majorité des assurés vivent dans \n               des quartiers au revenu intermédiaire ") +
  theme_minimal()
```

### Revenu 4

```{r}
ggplot(df, aes(x = factor(REV4,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "11-23%",
                                     "24-36%",
                                     "plus de 37%",
                                     "plus de 37%",
                                     "Plus de 37%",
                                     "Plus de 37%",
                                     "Plus de 37%",
                                     "Plus de 37%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des revenus élevés dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                Les assurés vivant dans un quartier ou \n             les revenus sont  très élevés est minoritaire") +
  theme_minimal()
```

### Revenu 5
Tranche de revenu la plus élevé
```{r}
ggplot(df, aes(x = factor(REV5,
                          levels = 0:9,
                          labels = c("0%",
                                     "1-10%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "plus de 11%",
                                     "plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%",
                                     "Plus de 11%")))) +
  geom_bar(aes(y = after_stat(prop), group = 1),
           fill = "steelblue") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(x = "Part des personnes ayant des revenus élevés dans le quartier",
       y = "Proportion d'assurés concernés",
       title = "                La majorité des assurés ne vivent pas dans un quartier où \n                on observe beaucoup de personne a très fort revenu") +
  theme_minimal()
```
