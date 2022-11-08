#!/usr/bin/env bash


jeu()
{
display_jeu
until [[ $word_guess = $word ]] || [ $nb_error -ge 7 ]
do
        read -n1 -p "Lettre que vous voulez essayer: " letter
        letter=$(echo $letter | tr [:upper:] [:lower:])
        index=$(echo $word | grep -iaob $letter | grep -oE '[0-9]+')
        #echo
        #echo index $index
        if [ ! -z "$index" ]
        then
                for i in $index 
                do
                        display_word_guess=$(echo $display_word_guess | sed "s/.[[:blank:]]/$letter /$(($i+1))")
                        #echo mot $display_word_guess
                done
        else
                ((nb_error+=1))
        fi
        tested_letters+="$letter "
        word_guess=$(echo $display_word_guess | sed 's/ //g' | sed 's/.$//g')

        display_jeu
done
if [[ $word_guess = $word ]]
then
	display_win
fi
#cat <<EOF
#
#mot: $word
#Longueur du mot: $word_lenght
#Mot à trouver : $word_guess
#Lettre déjà essayé : $tested_letters
#Nb erreur: $nb_error
#EOF

}
