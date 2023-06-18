# Henri Potier mais en flutter

C'est Henri Potier mais cette fois en Flutter et en reprenant le principe de Tinder pour le fun et en plus on essaie d'implémenter (au moins en partie) la Clean Architecture

# Étudiants:
  Guillaume GRIMAULT
  Noé MORVILLERS
  Romain BAROU

# Ce qui a été fait:

## Features principales:
  - Page principale permettant d'accéder à tous les livres exposés sur l'API
  - Possibilité d'ajouter un livre à son panier ou de le "rejeter"
  - Fait à la manière d'un "Tinder like", pour ajouter ou rejeter un livre, possibilité de swiper vers la droite ou la gauche, ou bien de directement cliquer sur les boutons sous la carte
  - Possibilité d'afficher le synopsis (scrollable) sur une fenêtre modale d'un livre en cliquant sur le bouton "i" sur la carte des livres 
  - Possibilité de faire disparaître la fenêtre modale en cliquant sur "Adava Kadabra" (pour faire comme les vrais sorciers)
  - Possibilité d'accéder au panier via le bouton en haut à droite de l'appli (il affiche également le nombre d'éléments déjà dans le panier)
  - Dans le panier, tous les livres précédements rajoutés sont visibles, ainsi que leur prix (prix unitaire * quantité du livre)
  - Possibilité de modifier la quantité d'un livre dans le panier via des boutons (suppressions du livre dans le panier si sa quantité passe à 0)
  - Calcul du prix total du panier sans réduction
  - Calcul de la réduction totale appliquée au panier (basée sur la meilleure offre)
  - Calcul du prix final (prix total - réduction totale)
  - Possibilité de revenir à la page précédente

## Features secondaires
  - Utilisation d'assets et fonts customisées
  - Possibilité de revenir sur le précédent livre swipé via le bouton central en bas 
  - Affichage d'une pub lors d'un retour arrière (pour être 100% fidèle à Tinder)
  - Ajout d'une animation "papier brulée" à l'arrivée sur la première page (c'était surtout pour voir comment les animations fonctionnaient en flutter, le code provient majoritairement de : https://www.flutterclutter.dev/flutter/tutorials/burning-paper-effect/2020/1354/ )
  - Quelques tests pour s'assurer que le calcul du meilleur prix fonctionne correctement
  - Un peu de GitHub Actions pour avoir un début de CI/CD (build, execute les tests et check le format du code utilisé) 
  - Persistance des données dans le panier à la fermeture de l'application via une BDD locale 

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
