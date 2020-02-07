# oc-pizza [OCP5] 
OCR - Concevez la solution technique d’un système de gestion de pizzeria

@[UML_src](https://github.com/rvallet/oc-pizza-ocr5/uml/src) : UML source files .puml
@[img](https://github.com/rvallet/oc-pizza-ocr5/uml/img) : UML image files .png

@[Files_src](https://github.com/rvallet/oc-pizza-ocr5/src) : Text, Sheet and Presentation source files
@[Deliverables](https://github.com/rvallet/oc-pizza-ocr5/deliverables) : Deliverables files (.pdf, .odp)

## Conception de l’architecture technique d’une application et Description du domaine fonctionnel

### Objet :
Mise en place d’un nouveau système informatique pour l’ensemble des pizzerias du groupe.

### Contexte :
« OC Pizza » est un jeune groupe de pizzeria en plein essor et spécialisé dans les pizzas livrées ou à emporter. 
Il compte déjà 5 points de vente et prévoit d’en ouvrir au moins 3 de plus d’ici la fin de l’année. 
Un des responsables du groupe a pris contact avec vous afin de mettre en place un système informatique, déployé dans toutes ses pizzerias.

#### Travail demandé :

En tant qu’analyste-programmeur, votre travail consiste, à ce stade, à définir le domaine fonctionnel et à concevoir l’architecture technique de la solution répondant aux besoins du client, c’est-à-dire :

* modéliser les objets du domaine fonctionnel
* identifier les différents éléments composant le système à mettre en place et leurs interactions
* décrire le déploiement des différents composants que vous envisagez
* élaborer le schéma de la ou des bases de données que vous comptez créer

### Livrables attendus :
* Un document (format PDF) de spécifications techniques comprenant :
    * une description du domaine fonctionnel
    * les différents composants du système et les composants externes utilisés par celui-ci et leur interaction
    * la description de l’organisation physique de ces composants (déploiement)
* Le modèle physique de données (MPD) ou modèle relationnel de la base de données au format PDF ou image (PNG)
* Base de données MySQL ou PostgreSQL avec un jeu de données de démo :
    * un fichier ZIP contenant un dump de votre base de données
    * un fichier ZIP contenant l’ensemble des scripts SQL de création de la base de données et du jeu de données de démo

## Built With

* [IntelliJ IDEA](https://www.jetbrains.com/idea/) - IDE (JDK8)
* [Maven](https://maven.apache.org/) - Dependency Management
* [PlantUML](http://plantuml.com/en/) - UML Diagrams
* [StarUML](http://staruml.io/) - UML Diagrams
* [MySQL WorkBench](https://www.mysql.com/) - SGB MySQL, pour la conception du Modèle Physique de Donnée
* [DBeaver](https://dbeaver.io/) - SGBD universelle, pour l'écriture des scripts SQL et des tests MySQL
* [WampServer](http://www.wampserver.com/) - Plateforme Apache, PHP, MySQL (+PHP MyAdmin)

## Authors

* **Rémy VALLET** - *Initial work* - [rvallet](https://github.com/rvallet)

See also the list of [contributors](https://github.com/rvallet/oc-pizza-ocr5/contributors) who participated in this project.

## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/rvallet/oc-pizza-ocr5/blob/master/LICENSE) file for details
