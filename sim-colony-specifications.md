# Spécifications du projet **Sim-Colony**

## 1. Présentation générale
**Sim-Colony** est un jeu de simulation en vue du dessus développé avec **Godot Engine 4.x**.  
Le projet est hébergé sur **GitHub** et édité via **VS Code**.

L’objectif est de créer un simulateur de colonie capable de gérer un très grand nombre d’unités mobiles en temps réel.  
Le jeu débute sur une vaste plaine de **2 km x 2 km**, avec une capitale servant de point de départ.

---

## 2. Objectifs de la première version (MVP1)
- Générer une **plaine en vue du dessus** (zone de 2000 m x 2000 m).  
- Positionner la **capitale au centre** de la plaine (50 m x 50 m).  
- La capitale :  
  - stocke les ressources,  
  - forme de nouvelles unités (bâtisseurs dans un premier temps).  

### 2.1 Cycle du bâtisseur
1. Un **bâtisseur** quitte la capitale et explore la plaine.  
2. Il cherche un emplacement où construire une **cité** :  
   - Interdiction de construire dans la **zone d’influence** de la capitale.  
   - Il doit s’éloigner pour trouver un emplacement valide.  
3. Quand la cité est construite :  
   - Sa **zone d’influence** s’ajoute à celle de la capitale.  
   - Un prochain bâtisseur devra aller encore plus loin.  
4. Le bâtisseur retourne ensuite à la capitale en **construisant une route** reliant la cité et la capitale.  
5. Une fois arrivé à la capitale, le bâtisseur **disparaît**.  
6. Un **habitant** quitte alors la capitale, emprunte la route, et **occupe la cité**.  

---

## 3. Spécifications techniques

### 3.1 Environnement de développement
- **Moteur** : Godot 4.x (GDScript, option C# ou GDNative pour optimisation).  
- **IDE** : VS Code avec extensions Godot.  
- **Versioning** : GitHub (repo `sim-colony`).  
- **Fichiers à corriger** : `.gitignore` doit être celui de Godot, et non Python.  

### 3.2 Monde
- **Dimensions** : 2000 m x 2000 m.  
- **Représentation** : Tilemap 2D (taille à définir, ex. 1 tile = 1 mètre).  
- **Types de terrain** : pour l’instant, uniquement plaine.  
- **Système d’unités de mesure** : toutes les positions exprimées en mètres.  

### 3.3 Capitales et cités
- **Capitale** (50 m x 50 m) :  
  - Point central de départ.  
  - Zone d’influence circulaire (rayon à définir, ex. 250 m).  
  - Génère des bâtisseurs.  
- **Cité** :  
  - Construction uniquement hors zone d’influence de la capitale et autres cités.  
  - Ajoute sa propre zone d’influence.  
  - Reliée à la capitale par une route.  

### 3.4 Unités
- **Bâtisseur** :  
  - Spawn dans la capitale.  
  - Explore (logique aléatoire dirigée ou pathfinding simple).  
  - Cherche emplacement valide.  
  - Construit cité.  
  - Trace une route en revenant.  
  - Se supprime une fois arrivé à la capitale.  
- **Habitant** :  
  - Spawn après la disparition du bâtisseur.  
  - Suit la route.  
  - Termine son cycle en occupant la cité.  

### 3.5 Routes et zones d’influence
- **Routes** :  
  - Chemin reliant la capitale et la cité.  
  - Stockées comme polylignes (suite de points).  
- **Zones d’influence** :  
  - Calculées comme des cercles autour des villes (capitale + cités).  
  - Utilisées pour interdire la construction à proximité.  

---

## 4. Architecture logicielle

### 4.1 Arborescence du projet
```
sim-colony/
├─ project.godot
├─ scenes/
│  ├─ Main.tscn
│  ├─ Capital.tscn
│  ├─ City.tscn
│  └─ Builder.tscn
├─ scripts/
│  ├─ main.gd
│  ├─ capital.gd
│  ├─ city.gd
│  ├─ builder.gd
│  ├─ inhabitant.gd
│  └─ systems/
│     ├─ influence.gd
│     └─ roads.gd
├─ assets/
│  ├─ tiles/
│  └─ sprites/
└─ docs/
   └─ specifications.md
```

### 4.2 Systèmes
- **Système d’influence** (`influence.gd`) : gère les zones circulaires.  
- **Système de routes** (`roads.gd`) : gère les polylignes reliant cités et capitale.  
- **Système de simulation** (`main.gd`) : boucle principale, gestion du temps.  

---

## 5. Extensions futures
- Types d’unités supplémentaires (soldats, explorateurs, artisans, etc.).  
- Gestion des ressources (bois, pierre, nourriture).  
- Construction de bâtiments (fermes, mines, ateliers).  
- Création d’objets et commerce.  
- Gestion de la guerre (zones de conflit, armées).  
- Optimisation pour gérer des milliers d’unités (ECS, pooling, multi-threading).  

---

## 6. Règles de contribution
- Style de code GDScript conforme aux guidelines Godot.  
- Commits : convention `type(scope): message` (ex: `feat(builder): add road construction`).  
- Documentation dans `docs/`.  
- Issues/PR sur GitHub avec template.  

---

## 7. Roadmap

### MVP1 (objectif court terme)
- Générer la plaine.  
- Implémenter capitale + zone d’influence.  
- Faire apparaître un bâtisseur et exécuter le cycle complet (exploration → cité → retour → route → disparition → habitant).  

### MVP2
- Plusieurs bâtisseurs.  
- Multiples cités et routes.  
- Visualisation des zones d’influence.  

### MVP3
- Ajout des ressources et bâtiments.  
- Gestion simple de l’économie.  

### Long terme
- Développement complet du système de colonie.  
- Guerre, diplomatie, commerce.  
- Simulation massive (10k+ unités).  

---

## 8. Licence
Projet sous licence **MIT**.  

---

## 9. Auteur
- Développeur principal : Pierre  
- Année de création : 2025  
