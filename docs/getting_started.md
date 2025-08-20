# Guide de démarrage rapide

## Structure du dépôt
- `scenes/` : contient les scènes principales du jeu – la scène d’entrée `Main.tscn` et les scènes spécifiques `Capital.tscn`, `City.tscn` et `Builder.tscn`.
- `scripts/` : regroupe les scripts GDScript associés (`main.gd`, `capital.gd`, `city.gd`, `builder.gd`, `inhabitant.gd`) ainsi qu’un sous-dossier `systems/` pour les systèmes d’influence et de routes.
- `assets/` : héberge les ressources graphiques avec des sous‑dossiers pour les tuiles et les sprites.

## Ouvrir le projet avec Godot 4 et lancer la simulation depuis VS Code
1. Installer **Godot 4** et l’extension **Godot Tools** dans VS Code.
2. Ouvrir le dossier du dépôt dans VS Code.
3. Via la palette de commandes de l’extension, choisir **Godot: Open Godot Editor** pour ouvrir `project.godot`, dont la scène principale est `scenes/Main.tscn`.
4. Dans l’éditeur Godot ou directement depuis VS Code (commande **Godot: Run** ou touche `F5` si configurée), lancer la scène principale pour démarrer la simulation.

## Cycle bâtisseur / habitant (MVP1)
1. Un bâtisseur sort de la capitale et explore la plaine.
2. Il cherche un emplacement hors de la zone d’influence pour y construire une cité.
3. Une fois la cité érigée, sa zone d’influence s’ajoute à celle de la capitale.
4. Le bâtisseur retourne à la capitale en traçant une route entre la cité et la capitale.
5. À son arrivée, il disparaît, puis un habitant part de la capitale, suit la route et vient occuper la cité.
