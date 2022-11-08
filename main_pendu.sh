#!/usr/bin/env bash

source $(dirname "$0")/init_pendu.sh
source $(dirname "$0")/display_pendu.sh
source $(dirname "$0")/jeu_pendu.sh

display_intro
mot=""
options=("Jouer avec un mot aléatoire " "Sélectionner un mot " "Jouer avec le mot dernierement sélectionné " "Quitter ")
PS3="Que voulez vous faire ? "
while true ; do
	select opt in "${options[@]}"; do 
        	case "$REPLY" in 
	                1) init; jeu ;;
                	2) read -p "Choisissez le mot que vous désirez: " mot ;;
        	        3) init $mot; jeu;;
	                4) echo "Au revoir !"; break 2 ;;
	                *) echo "Option inconnue. Reessayer."; continue;;
	        esac
		read -p "Press [Enter] key to continue..."
		clear
		display_intro
		break
	done
done
