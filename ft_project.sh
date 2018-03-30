#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_project.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hasmith <hasmith@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/30 13:56:24 by hasmith           #+#    #+#              #
#    Updated: 2018/03/30 13:56:24 by hasmith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# HILFE! :D
if [[ ("$1" == "-h" || "$1" == "--help") && $# == 1 ]] ; then
    sh ./assets/help.sh
# Install this script so it can be used anywhere! :D
elif [[ ("$1" == "-i" || "$1" == "--install") && $# == 1 ]] ; then
    sh ./assets/install.sh
# Create a project! :D
elif [[ ("$1" == "-c" || "$1" == "--create") && $# == 2 ]] ; then

	# Intro screen
	clear
	echo "███████╗████████╗     ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗"
	echo "██╔════╝╚══██╔══╝     ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝"
	echo "█████╗     ██║        ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║"
	echo "██╔══╝     ██║        ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║"
	echo "██║        ██║███████╗██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║"
	echo "╚═╝        ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝"
	echo ""

    # Convert the project name to lowercase.
    PROJECT=$( echo "$2" | tr '[:upper:]' '[:lower:]' )
    echo "Name of project: $PROJECT"

    # 1. Create directory with project name.
    DIRECTORY=./$PROJECT$sp$n
    {
        # If folder exists, add a number after its name.
        while ! mkdir $DIRECTORY
        do
            sp="_"
            n=$(printf "%03d" $(( 10#$n + 1 )) )
            DIRECTORY=./$PROJECT$sp$n
        done
    } &> /dev/null
    echo "Path of project: ${PWD/#$HOME/~}"/$PROJECT

    # 2. Asks for programming language (force C language... lel)
    read -p "Language: " LANG
    LANG=$( echo "$LANG" | tr '[:upper:]'  '[:lower:]' )
    if [[ "$LANG" == "c" ]]; then
        echo "C"
    elif (grep -Fxq "$LANG" ./assets/language-list.txt) ; then
        echo "Only C"
    else
        echo "No $LANG. Only C"
    fi
    sh ./assets/gen_project.sh $DIRECTORY $PROJECT

    # 3. Asks and copy libft folder into project folder.
    while true; do
        read -p "Include libft? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/include_libft.sh $DIRECTORY; LIBFT=1; break;;
            [Nn]* ) LIBFT=0; break;;
            * ) echo "Yes(y) / no(n).";;
        esac
    done

    # 4. Asks for Makefile creation.
    while true; do
        read -p "Makefile? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/gen_makefile.sh $DIRECTORY $PROJECT $LIBFT; break;;
            [Nn]* ) break;;
            * ) echo "Yes(y) / no(n).";;
        esac
    done

    # 5. Asks for author file creation.
    while true; do
        read -p "Author file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/gen_author.sh $DIRECTORY; break;;
            [Nn]* ) break;;
            * ) echo "Yes(y) / no(n).";;
        esac
    done

    # 6. Asks for .gitignore file creation.
    while true; do
        read -p ".gitignore file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/gen_gitignore.sh $DIRECTORY; break;;
            [Nn]* ) break;;
            * ) echo "Yes(y) / no(n).";;
        esac
    done

    # 7. Asks for README.md file creation.
    while true; do
        read -p "README.md file? (y/n): " yn
        case $yn in
            [Yy]* ) sh ./assets/gen_readme.sh $DIRECTORY $PROJECT; break;;
            [Nn]* ) break;;
            * ) echo "Yes(y) / no(n).";;
        esac
    done

    clear
    echo "$PROJECT successfully created"
# Usage message if number of arguments are invalid or invalid flag.
else
    echo "usage: sh $0 [-h | --help] [-c | --create project_name] [--install]"
fi
    exit 0
