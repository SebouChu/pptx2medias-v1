# PPTX2Medias

**DÉPRÉCIÉ : Maintenant, il y a une gem, plus facile à installer : https://github.com/SebouChu/pptx2medias**

Script Ruby qui récupère les medias d'un fichier PPTX pour les mettre dans un dossier à côté.

## Installation

- Mettre le script dans un dossier
- Mettre un alias dans son `bashrc` ou `zshrc`
  ```
  alias pptx2medias="ruby <chemin absolu>/script.rb"
  ```

## Utilisation

```
$ pptx2medias <fichier ou chemin absolu>
```

### Exemple

```
$ pptx2medias /home/sebastiengaya/Diapo\ exemple.pptx
```

*A noter l'échappement de l'espace dans le nom du fichier. Glisser le fichier du Finder vers le Terminal gère automatiquement cette subtilité.*