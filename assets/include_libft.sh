#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    include_lift.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hasmith <hasmith@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/30 13:56:24 by hasmith           #+#    #+#              #
#    Updated: 2018/03/30 13:56:24 by hasmith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 1 ] ; then
    echo "usage: sh $0 libft_path"
# Make libft directory inside the project directory, and asks the user to input
# the path of libft to copy the content into the new libft directory inside the
# project directory. SUCH A LONG ASS COMMENT! LOL :)
else
    DIRECTORY=$1
    mkdir -p $DIRECTORY/libft
    read -p "Specify libft location: ~/" libft_path
    cp -R ~/$libft_path/* "$DIRECTORY/libft"
fi
    exit 0
