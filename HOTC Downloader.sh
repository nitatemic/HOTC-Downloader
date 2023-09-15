#!/bin/bash

# Vérifie si le fichier d'entrée est spécifié
if [ $# -ne 1 ]; then
    echo "Usage: $0 fichier_identifiants.txt"
    exit 1
fi

# Assurez-vous que le dossier de destination existe
destination_folder="images"
mkdir -p "$destination_folder"

# Lire le fichier d'identifiants ligne par ligne
input_file="$1"
while IFS= read -r identifier; do
    # Adapter l'identifiant au format de l'URL
    formatted_identifier=$(echo "$identifier" | tr / -)

    # Construire l'URL de téléchargement à partir de l'identifiant formaté
    url="https://heartofthecards.com/images/cards/ws/$formatted_identifier.png"

    # Télécharger l'image
    wget -q -P "$destination_folder" "$url"

    # Vérifier si le téléchargement a réussi
    if [ $? -eq 0 ]; then
        echo "Téléchargé: $url"
    else
        echo "Échec du téléchargement: $url"
    fi
done < "$input_file"

echo "Téléchargement terminé."