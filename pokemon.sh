#!/bin/bash

path=~/pokemons/images
pokemons=()

for dir in $(ls $path)
do
    pokemons+=("$path/$dir")
done

randomPokeNum=$((1 + $RANDOM % ${#pokemons[@]}))
selectedPokemon="${pokemons[randomPokeNum]}"

catimg -r2 $selectedPokemon

pathCount=0
for i in $(echo $selectedPokemon | tr "/" "\n")
do
    pathCount=$(expr $pathCount + 1)
    if [ $pathCount = 5 ]; then
        echo -e "\033[1;96m$(echo ${i^} | tr "-" " " | cut -d '.' -f 1)"
    fi
done

echo -e "\033[0m"

