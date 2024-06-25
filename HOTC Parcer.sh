#!/bin/bash

# Assurez-vous que l'URL est spécifiée en argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Utilisation de curl pour récupérer le contenu de l'URL
content=$(curl -s "$1")

# Utilisation de grep pour capturer le texte entre "Card No.:" et "Rarity:"
regex='Card No\.: \([A-Z0-9\/-]*\).*Rarity:'

# Utilisation de sed pour extraire le texte correspondant au regex et arrêter après le numéro de carte
numeros_cartes=$(echo "$content" | sed -n "s/.*$regex\([A-Z0-9\/-]*\).*/\1/p")

# Afficher les numéros de carte extraits
echo "$numeros_cartes"
