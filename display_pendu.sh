#!/usr/bin/env bash

version="Bash             |"

display_intro()
{
cat << EOF
|------------------------------------|
|  Bienvenue dans le jeu du pendu !  |
|           Version $version
|------------------------------------|

EOF
}

display_jeu()
{
        local nb_life=$((7-$nb_error))
        cat << EOF 

|-------------|
|             |
EOF

case $nb_error in
        0)
        cat << EOF 
|             |
|             |
|             |
|             |
|             |
|             |
|             |
|             |
EOF
                ;;
        1)
        cat << EOF 
|             |
|             |
|             |
|             |
|             |
|             |
| -----       |
| |   |       |
EOF
                ;;
        2)
        cat << EOF 
|             |
|   |         |
|   |         |
|   |         |
|   |         |
|   |         |
| -----       |
| |   |       |
EOF
                ;;
        3)
        cat << EOF 
|   ------    |
|   |         |
|   |         |
|   |         |
|   |         |
|   |         |
| -----       |
| |   |       |
EOF
                ;;
        4)
        cat << EOF 
|   ------    |
|   |    |    |
|   |         |
|   |         |
|   |         |
|   |         |
| -----       |
| |   |       |
EOF
                ;;

        5)
        cat << EOF 
|   ------    |
|   |    |    |
|   |    o    |
|   |         |
|   |         |
|   |         |
| -----       |
| |   |       |
EOF
                ;;
        6)
        cat << EOF 
|   ------    |
|   |    |    |
|   |    o    |
|   |   /|\   |
|   |         |
|   |         |
| -----       |
| |   |       |
EOF
                ;;
        *)
        cat << EOF 
|   ------    |
|   |    |    |
|   |    o    |
|   |   /|\   |
|   |   / \   |
|   |         |
| -----       |
| |   |       |
EOF
                ;;

esac

cat <<EOF
|             |
|-------------|
EOF

if [ $nb_error -ge 7 ]
then
        cat <<EOF
   GAME OVER
Le mot était : $word
EOF
else
        cat << EOF

$display_word_guess
Lettre(s) déjà essayée(s) : $tested_letters
$nb_life vies restantes

EOF
fi
}

display_win()
{
        local nb_life=$((7-$nb_error))
	cat <<EOF

!!!!! !!!!!  BRAVO !!!!! !!!!!
Vous avez trouvé le mot $word avec $nb_life vie(s) restante(s).
!!!!! !!!!!  BRAVO !!!!! !!!!!

EOF
}

