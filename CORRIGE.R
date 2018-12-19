#### Instruction ####
#
# Le script est un tutoriel pour découvrir ggplot avec R
# Le script se présente comme un tutoriel où il y aura 
#
# Pour l'ensemble du script remplacer les ___ par la fonction ou la valeur attendu

#### Instalation du TP ####

# INDIQUEZ LE CHEMIN DU Data SET

# exemple setwd( 'C:/mondossierA/mondossierB')

setwd("F:/COURS/")

# importation du jeu de données

Data <- read.csv('pc08extrait-simp.csv')

#### Installation et Chargement des packages ####



install.packages('tidyverse')
library(ggplot2)

#### Préparation des données ####

## A EXECUTER AVANT LA SUITE DU TUTORIEL
## NE PAS OUBLIER LA PARTIE SECTION ONE

# Les données sont préparées pour l'affichage on modifie les valeurs manquantes
# Elles sont remplacées pas données manquantes

Data["jours_semaine"][is.na(Data["jours_semaine"])] <- -1
Data["nombre_livres"][is.na(Data["nombre_livres"])] <- mean(Data$nombre_livres, na.rm = TRUE)
Data$nombre_livres <- as.integer(Data$nombre_livres)

# Section One -----------------------------------------------------------
Data[is.na(Data["employeur"]),1] <- "non renseigné"
Data$employeur <- factor(Data$employeur, levels = c(levels(Data$employeur),"non renseigné"))
Data$employeur[is.na(Data$employeur)] <- "non renseigné"

Data[is.na(Data["profession"]),1] <- "non renseigné"
Data$profession <- factor(Data$profession, levels = c(levels(Data$profession),"non renseigné"))
Data$profession[is.na(Data$profession)] <- "non renseigné"

Data[is.na(Data["diplÃ.me"]),1] <- "non renseigné"
Data$diplÃ.me <- factor(Data$diplÃ.me, levels = c(levels(Data$diplÃ.me),"non renseigné"))
Data$diplÃ.me[is.na(Data$diplÃ.me)] <- "non renseigné"

Data[is.na(Data["contrat"]),1] <- "non renseigné"
Data$contrat <- factor(Data$contrat, levels = c(levels(Data$contrat),"non renseigné"))
Data$contrat[is.na(Data$contrat)] <- "non renseigné"

Data[is.na(Data["CSP_mere"]),1] <- "non renseigné"
Data$CSP_mere <- factor(Data$CSP_mere, levels = c(levels(Data$CSP_mere),"non renseigné"))
Data$CSP_mere[is.na(Data$CSP_mere)] <- "non renseigné"

Data[is.na(Data["CSP_pere"]),1] <- "non renseigné"
Data$CSP_pere <- factor(Data$CSP_pere, levels = c(levels(Data$CSP_pere),"non renseigné"))
Data$CSP_pere[is.na(Data$CSP_pere)] <- "non renseigné"

Data[is.na(Data["act_preferee"]),1] <- "non renseigné"
Data$act_preferee <- factor(Data$act_preferee, levels = c(levels(Data$act_preferee),"non renseigné"))
Data$act_preferee[is.na(Data$act_preferee)] <- "non renseigné"

Data[is.na(Data["sorties_soir"]),1] <- "non renseigné"
Data$sorties_soir <- factor(Data$sorties_soir, levels = c(levels(Data$sorties_soir),"non renseigné"))
Data$sorties_soir[is.na(Data$sorties_soir)] <- "non renseigné"

Data[is.na(Data["nombre_ordi"]),1] <- "non renseigné"
Data$nombre_ordi <- factor(Data$nombre_ordi, levels = c(levels(Data$nombre_ordi),"non renseigné"))
Data$nombre_ordi[is.na(Data$nombre_ordi)] <- "non renseigné"

Data[is.na(Data["jeux_video"]),1] <- "non renseigné"
Data$jeux_video <- factor(Data$jeux_video, levels = c(levels(Data$jeux_video),"non renseigné"))
Data$jeux_video[is.na(Data$jeux_video)] <- "non renseigné"

Data[is.na(Data["utilisation_ordi"]),1] <- "non renseigné"
Data$utilisation_ordi <- factor(Data$utilisation_ordi, levels = c(levels(Data$utilisation_ordi),"non renseigné"))
Data$utilisation_ordi[is.na(Data$utilisation_ordi)] <- "non renseigné"

Data[is.na(Data["utilisation_internet"]),1] <- "non renseigné"
Data$utilisation_internet <- factor(Data$utilisation_internet, levels = c(levels(Data$utilisation_internet),"non renseigné"))
Data$utilisation_internet[is.na(Data$utilisation_internet)] <- "non renseigné"

Data[is.na(Data["genre_musique"]),1] <- "non renseigné"
Data$genre_musique <- factor(Data$genre_musique, levels = c(levels(Data$genre_musique),"non renseigné"))
Data$genre_musique[is.na(Data$genre_musique)] <- "non renseigné"

Data[is.na(Data["genre_livre"]),1] <- "non renseigné"
Data$genre_livre <- factor(Data$genre_livre, levels = c(levels(Data$genre_livre),"non renseigné"))
Data$genre_livre[is.na(Data$genre_livre)] <- "non renseigné"

Data[is.na(Data["sorties_match"]),1] <- "non renseigné"
Data$sorties_match <- factor(Data$sorties_match, levels = c(levels(Data$sorties_match),"non renseigné"))
Data$sorties_match[is.na(Data$sorties_match)] <- "non renseigné"

Data[is.na(Data["sorties_boite"]),1] <- "non renseigné"
Data$sorties_boite <- factor(Data$sorties_boite, levels = c(levels(Data$sorties_boite),"non renseigné"))
Data$sorties_boite[is.na(Data$sorties_boite)] <- "non renseigné"

Data[is.na(Data["sorties_cinema"]),1] <- "non renseigné"
Data$sorties_cinema <- factor(Data$sorties_cinema, levels = c(levels(Data$sorties_cinema),"non renseigné"))
Data$sorties_cinema[is.na(Data$sorties_cinema)] <- "non renseigné"

Data[is.na(Data["hobby"]),1] <- "non renseigné"
Data$hobby <- factor(Data$hobby, levels = c(levels(Data$hobby),"non renseigné"))
Data$hobby[is.na(Data$hobby)] <- "non renseigné"

Data[is.na(Data["tele_manque"]),1] <- "non renseigné"
Data$tele_manque <- factor(Data$tele_manque, levels = c(levels(Data$tele_manque),"non renseigné"))
Data$tele_manque[is.na(Data$tele_manque)] <- "non renseigné"


#### 1. GEOM POINT + asset graphiques####

# Pour commencer avec ggplot, on va commencer par les nuages de points 

# Afficher une variable selon l'age

ggplot(Data , aes( x = age, y = nombre_personnes_logement)) + 
  geom_point() ## geom_point correspond à un nuage de point

ggplot(Data ) + ## Il n'est pas obligatoire d'introduire le mapping  
  geom_point(aes( x = age, y = nombre_personnes_logement)) ## geom_point correspond à un nuage de point

# Ajout des légendes 

## 
ggplot(Data , aes( x = age, y = nombre_personnes_logement)) +
  geom_point() +
  labs( title = "TITRE",
        subtitle = "sous_titre",
        x= "AXE X",
        y = "AXE Y"
        )

# gestion des thèmes

## GGPLOT fournit un ensemble de thèmes pour les affichages

plot <- ggplot(Data,  aes( x = age, y = nombre_personnes_logement)) +
  geom_point() 

plot + theme_light()

plot + theme_linedraw()

plot + theme_dark()

# Ajout du paramètre sur la taille
# size

## utiliser un entier
ggplot(Data, aes(x = age, y = nombre_personnes_logement, size = 5)) +
  geom_point() 

## utiliser une variable numérique du Dataset
ggplot(Data, aes(x = age, y = nombre_personnes_logement, size = nombre_livres)) +
  geom_point() 

## tiliser une variable catégorielle du Dataset
ggplot(Data, aes(x = age, y = nombre_personnes_logement, size = sexe)) + ## A NE PAS FAIRE CAR PEUT PRETER CONFUSION
  geom_point() 
# une variable catégorielle n'est pas cohérent pour une taille

## SHAPE

# la forme des points et objets à afficher
# Il faut que la variable y soit catégorielles


## Il y a 25 formes différentes classé par un entier entre 1 et 25
ggplot(Data, aes(x = age, y = nombre_personnes_logement)) +
  geom_point(shape = 12) 

## utilisé une variable catégorielle du Dataset
ggplot(Data, aes(x = age, y = nombre_personnes_logement, color = sexe)) +
  geom_point(shape = Data$sexe)


## COLOUR

# col, color, colour sont le même paramètre

ggplot(Data, aes(x = age, y = nombre_personnes_logement)) +
  geom_point(colour = 'darkblue') 


ggplot(Data, aes(x = age, y = nombre_personnes_logement, col = sexe)) +
  geom_point() 

# le paramètre Alpha

ggplot(Data, aes(x = age, y = nombre_personnes_logement, colour = employeur)) + # valeur comprise entre 0 et 1
  geom_point(alpha = 0.5) 


# les palettes

## elles definissent les couleurs utilisées par ggplot, elles peuvent être entrée manuellement
ggplot(Data, aes(x = age, y = nombre_personnes_logement, colour = employeur)) +
  geom_point() +
  scale_color_brewer(palette="Set1") ## pour les ligne et point


ggplot(Data, aes(x = age, y = nombre_personnes_logement, colour = employeur)) +
  geom_point() +
  scale_color_brewer(palette="Spectral") ## pour les ligne et point

## Pour d'autre palette , chercher sur internet 

## Le paramètre facet grid

# cette fonction permet de faire plusieurs graphiques selon une variable du data set afin de comparer cette dernière

ggplot(Data, aes(x = contrat, y = age, colour =  employeur)) +
  geom_point() +
  facet_grid(. ~ sexe)

## on observe que la légende de l'axe x est ilisible
## on peut modifier l'orientation grace au thème 

ggplot(Data, aes(x = revenu_brut, y = age, col = instrument)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

## ajouter plusieurs variable pour le fact_grid
ggplot(Data, aes(x = employeur, y = age, col = instrument)) +
  geom_jitter() +
  facet_grid(vacances ~ sexe) +
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

## Le geom_jitter

# le geom point peut parfois être un mauvais affichage pour si on déclare une variable catégorielle en x
# le jitter permet de données une meilleur visualisation d'un nuage de point

ggplot(Data, aes(x = employeur, y = age, colour = sexe)) +
  geom_jitter() + # utiliser le jitter à la place du geom_point
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# Faire des statistiques directement avec GGPLOT

## réaliser la moyenne du nombre de livres avec GGPLOT
ggplot(data = Data, aes(x = age, y = nombre_livres, colour = sexe)) +
  stat_summary(fun.y = mean, geom = "point",fun.ymin=mean, fun.ymax=mean) # préciser la fonction (ici la moyenne)à utiliser sur les valeurs d'entrées et le geom à utiliser


## préparer des données avec dplyr.
# stat summary est parfois assez couteux et manque de souplesse. Dplyr permet plus facilement de faire pré traitement
# Le but est de groupé des données selon des varibles puis de creer des colonnes selon les données voulues (moyenne)

# %>% est un opérateur R de tidyverse Data %>% function(a,b) = function(Data, a,b)

## Groupez les données selon deux varibles puis affichez les dans un graphique

library(tidyverse)
data_summarise <- Data %>% group_by(age, employeur) %>% summarise(count = n(), mean_logement = mean(nombre_personnes_logement)) # n() permet de compter le nombre de ligne et mean() de faire une moyenne

ggplot(data_summarise, aes (x = age, y = mean_logement ,col = employeur)) +
  geom_point()

ggplot(data_summarise, aes (x = age, y = mean_logement )) +
  facet_grid(employeur ~ .) +
  geom_point( color = 'blue')


#### REALISER LE GRPAHIQUE 1 SUR LE DRIVE ####

  data_mean <- Data %>% group_by(age, employeur) %>% summarise(mean_log = mean(nombre_personnes_logement), mean_enfant = mean(nombre_enfants_logement), mean_livre = mean(nombre_livres))


ggplot(data_mean, aes (x = age, y = mean_log, size = mean_livre, col = mean_enfant )) +
  facet_grid(employeur ~ .) +
  geom_point( )


##### 2. geom_line et geom_smooth  ####

# Creer un graphique sur l'évolution moyenne du POIDS de chaque individu par age
## on souhaite afficher l'évolution moyenne d'une valeur numérique sous la forme d'une ligne (geom_line)
ggplot(Data, aes(x = age, y = nombre_livres))+
  stat_summary(fun.y = mean, geom = "line",fun.ymin=mean, fun.ymax=mean, size = 2)

# Afficher plusieurs graphiques sur un même graphique 
##fun.ymin et fun.y.max permettent de limiter la fenètre d'affichage
ggplot(Data)+
  stat_summary(aes(x = age, y = nombre_enfants_logement), fun.y = mean, geom = "line",fun.ymin=mean, fun.ymax=mean, color = "darkblue", size = 2)+
  stat_summary(aes(x = age, y = nombre_personnes_logement), fun.y = mean, geom = "line",fun.ymin=mean, fun.ymax=mean, color = "darkgreen", size = 2)

# Réaliser le graphique précedant avec group_by et summarise

data_mean <- Data %>% group_by(age) %>% summarise(mean_n = mean(nombre_enfants_logement), mean_m = mean(nombre_personnes_logement))
ggplot(data = data_mean)+
  geom_line( aes(age,mean_n), colour = 'green')+
  geom_line( aes(age,mean_m), color  = 'blue' )


# Utiliser geom_smooth et geom_point
ggplot(Data, aes(x = age, y = nombre_enfants_logement))+ ## attention utilisez des varaibles numériques
  geom_smooth()+
  geom_point()

# geom_smooth comme on peut le noter, permet de creer des courbes de tendances sans avoir besoin de préparer les données
# par défault ggplot utilise la méthode des moindres carrés

ggplot(Data, aes(x = age, y = nombre_enfants_logement))+
  geom_point()+
  geom_smooth(se = TRUE, method = "lm")

## les valeurs de couleurs peuvent être utiliser pour faire plusieurs courbes selon la population ciblée
ggplot(Data, aes(x = age, y = nombre_enfants_logement, color= sexe)) +
  geom_smooth(se =TRUE)

## pour enelever la variance repésenté par l'aplat gris on met à False le paramètre se
ggplot(Data, aes(x = age, y = nombre_enfants_logement, color= revenu_brut)) +
  geom_smooth(se =FALSE)

## On peut également placer d'autre élément graphique pour rajouter des élements non présent dans les données

# Utiliser le geom_rect pour faire des rectangle pour décrire des zone dans le graphique
# utiliser le geom_text pour ajouter du text sur le graphique (annotation  fait la même chose)

mean_data  <- Data %>% group_by(age) %>% summarise(mean_POIDS = mean(POIDS)) ## cette methode est plus rapide et efficace que la fonction stat_summary

ggplot(mean_data , aes(x = age, y = mean_POIDS)) +
  geom_rect(map = aes(xmin = 25, xmax = 50, ymin = -Inf, ymax = +Inf),
            inherit.aes = FALSE, fill = "red", alpha = 0.01) +
  geom_text( x = 35 ,y = 1.5,label = 'actif',inherit.aes = FALSE,
             size = 5, vjust = 0, hjust = 0)+ ## ces paramètre joue sur l'ajustement du taxt
  geom_line(size = 1.4) + ## a mettre en dernier pour être mis au premier plan
  theme_minimal()

#### 3. BOXPLOT ET VARIANTE ####

# le geom_violin et boxplot permettent d'avoir une visualisation statistiques des données du Dataset

## le geom boxplot permet d'observer les statistiques d'une variables
ggplot(Data, aes(x = vacances, y = age, color= vacances)) +
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

ggplot(Data, aes(x = vacances, y = age, color= sexe)) +
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))


## le geom violin permet d'oberver la distribution d'une variable
ggplot(Data, aes(x = employeur, y = age, fill= employeur, color = employeur)) +
  geom_violin()+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))


#### GRPAHIQUE 2 ####

# Réaliser le graphique 2 disponible sur le git hub

ggplot(Data)+
  geom_violin(aes(x = employeur, y = age, fill= employeur, color = employeur))+
  geom_boxplot(aes(x = employeur, y = age, color= employeur), width = 0.2)+
  theme_classic()+
  coord_flip()

  
  
  
#### graphique de corrélation ####
  
## dans cette partie, on va essayer de réaliser un graphique de corrélation
## ggplot ne permet de faire simplement un graphique de corrélation mais on peut le faire simplement avec le package ggcorrplot

## INSTALLER LE PACKAGE ggcorrplot

install.packages('ggcorrplot')
library(ggcorrplot)

## pour réaliser lle graphique, il faut selectionner uniquement les valeurs numériques du tableau ou transformer les valeurs catégorielles en numérique

## on utilise la fonction subset et select et passant une liste des noms des colonne à garder pour la corrélation
## subset peut également être utiliser pour selectionner des données selon un critère
data_numerique <- cor(subset(Data, select = c(nombre_ordi, age, nombre_personnes_logement, nombre_enfants_logement, nombre_livres)))

## graphique basique
ggcorrplot(data_numerique)

# graphique avec des rond
ggcorrplot(data_numerique, method = "circle") 

## graphique trié
ggcorrplot(data_numerique, hc.order = TRUE, outline.col = "white")

## graphique avec uniquement le graphique du bas
ggcorrplot(data_numerique, hc.order = TRUE, type = "lower", ## upper peut être utiliser pour le graphque opposé
           outline.col = "white")

## graphiqe  en supprimant les valeurs insignifiantes et afficher les valeurs 
ggcorrplot(data_numerique, hc.order = TRUE, type = "lower", ## upper peut être utiliser pour le graphque opposé
           outline.col = "white", insig = "blank", lab = TRUE)


## exemple d'un autre 
install.packages("GGally")
library(GGally)
## permet plus de souplesse pour les méthodes utilisés mais plus dure à prendre en main
ggcorr(Data, nbreaks = 4,label = TRUE, label_size = 3, label_color = "white",palette = "RdGy")





#### Bar plot et histogramme

## Pour trouver les geom correspondant cherhcer dans le help de R studio pour avoir la liste des geom

# Faire un histogramme 
ggplot(Data, aes(age)) +
  geom_histogram()

# Utiliser dodge et alpha pou avoir un histogramme plus lisible
ggplot(Data, aes(age, fill = sexe)) +
  geom_histogram(bins = 40,position = 'dodge', alpha = 0.5)

## faire un graphique de densité 
ggplot(Data, aes(age, fill = employeur, col = employeur)) +
  geom_density( alpha = 0.5)

## retirer les non renseigné

ggplot(subset(Data, employeur != 'non rensigné'), aes(age, fill = employeur, col = employeur)) +
  geom_density( alpha = 0.5)

## faire graphique avec l'aire sous la courbe

data_to_area = Data %>% group_by(age, contrat) %>% summarise(n = n()) ## grouper les données et compter le nombre d'individu ou une moyenne
ggplot(data_to_area, aes(age,n, fill = contrat, col = contrat)) + 
  geom_area() ## utiliser le geom area

### Stream graph sont de meillurs représentation

## afficher un bar plot avec le geom _bar
ggplot(Data, aes(x = contrat)) + ## il ne faut selement un unique paramètre
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))


## pour renversé le graphiqe on flip les coordonées avec coord_flip
ggplot(Data, aes(x = contrat)) + 
  geom_bar()+
  coord_flip()+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))


# Pour ajouter la couleur dans un barplot, utilisez le paramètre fill à la place de colour 

ggplot(Data, aes(x = contrat, fill = employeur)) + 
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# utilisations d'une palette de couleurs 
ggplot(Data, aes(x = contrat, fill = employeur)) +
  geom_bar() +
  scale_fill_brewer(palette = "Greens")+ ## la fonction est différentes que pour les ligne et points
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# Représenté le bar plot non pas en comptant le nobre d'élément mais en montrant leur proportion dans chaque catégorie

ggplot(Data, aes(x = contrat, fill = employeur)) + 
  geom_bar(position = "fill")+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# Faire basculer le graphique

ggplot(Data, aes(x = contrat, fill = employeur)) + 
  geom_bar(position = "fill")+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))+
  coord_flip()


# le paramètre dodge, il permet que chaque bar soit décaler les une par rapport au autre

ggplot(Data, aes(x = contrat, fill = vacances)) + 
  geom_bar(position = 'dodge')+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

#  On peut définir un ratio pour garder la surperposition partielle des bars
posn_d <- position_dodge(0.4)

# introduire posn_d
ggplot(Data, aes(x = contrat, fill = vacances)) + 
  geom_bar(position = posn_d)+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# utiliser alpha pour donner plus de visibilité
ggplot(Data, aes(x = contrat, fill = vacances)) + 
  geom_bar(position = posn_d, alpha = 0.5)+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# changer de couleurs
ggplot(Data, aes(x = contrat, fill = vacances)) + 
  geom_bar(position = posn_d, alpha = 0.8)+
  scale_fill_brewer(palette = "Set1")+
  theme(axis.text.x = element_text(angle = 45, size=10, hjust = 1))

# Faire un graphique avec une seule colonne
ggplot(Data, aes(x = "", fill = contrat)) +
  geom_bar(position = "fill")

# Le convertr avec coord_polar en pie chart (graphique camenbert)
ggplot(Data, aes(x = "", fill = employeur)) +
  geom_bar(position = "fill", width = 1, colour = "white") +
  coord_polar(theta = "y") + ## il faut déclarer quel axe doit tourner
  theme_void()


#### Graphique avancé #####


### Le pyramid chart

## le but du pyramid chart est d'avoir la part de population selon un varibles binaire et l'age 
## homme femme et age par exemple
ggplot(Data) +
  geom_bar(stat = "identity", aes(x = age, fill = sexe, 
                                  y = ifelse(sexe == "Homme", 
                                             -1, 1))) +
  scale_fill_brewer(palette = "Set1")+
  labs(y = "Population") +
  ylim(c(-100,100))+
  coord_flip()


## radial chart

## il est similaire au pie chart mais dans un autre format

dat_to_radial <- Data %>% group_by(contrat) %>% summarise(count = n())
dat_to_radial <- dat_to_radial[order(dat_to_radial$count),] ## ordonner les veleur dans l'order décroissant

dat_to_radial$contrat <- factor(dat_to_radial$contrat, levels = dat_to_radial$contrat[order(dat_to_radial$count)])


ggplot(dat_to_radial, aes(x = contrat, y = count,  fill = contrat)) +
  geom_bar(stat = 'identity',width = 0.5) +
  coord_polar(theta = "y") +
  ylim(c(0,sum(dat_to_radial$count))) +
  
  
  geom_text( hjust = 1, size = 3, aes(x = contrat, y = 0, label = contrat)) + ## ajout des labels
  theme(legend.position = "none" , axis.text.y = element_blank() , axis.ticks = element_blank()) ## ajout d'un thème personalisé


# pie chart avedc text
data_with_percent <- Data %>% 
  group_by(revenu_brut) %>% 
  summarise(count = n())
total = sum(data_with_percent$count)
label = paste0( round(100*data_with_percent$count/total,1), " %")

ggplot(data_with_percent)+
  geom_bar(aes(x="", y=count, fill=revenu_brut), stat="identity", width = 1)+
  coord_polar("y", start=0)+
  theme_void()+
  geom_text(aes(x=1.2, y = cumsum(count) - count/3, label = label))


## Hightingale Rose Chart 
ggplot(Data, aes(x = revenu_brut, fill = contrat)) +
  geom_bar(width=1,colour="black",size=0.1) +
  scale_fill_brewer(palette = "Greens")+
  coord_polar('x')


# heat map
ggplot(Data, aes(x = age, y = nombre_livres )) +
  geom_bin2d()  ## trouver avec help le bon geom
# heat map
ggplot(Data, aes(x = age, y = contrat )) +
  geom_bin2d()  ## trouver avec help le bon geom


## radar plot

## le radial chart est fait en ggplot mais il existe un package comme pour la coorélation plus efficace mais il faut préparer le données au préalable

#theme personalisé pour ggplot

coord_radar <- function (theta = "x", start = 0, direction = 1) {
  theta <- match.arg(theta, c("x", "y"))
  r <- if (theta == "x") "y" else "x"
  ggproto("CordRadar", CoordPolar, theta = theta, r = r, start = start, 
          direction = sign(direction),
          is_linear = function(coord) TRUE)
}


Data_ans <- Data %>% group_by(contrat, revenu_brut)  %>% summarise(count = mean(nombre_livres))
ggplot(Data_ans, aes(x = revenu_brut, y = count, group = contrat, fill = contrat, color =contrat ))+
  geom_area()+
  coord_radar()


