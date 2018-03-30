#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gen_author.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hasmith <hasmith@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/30 13:56:24 by hasmith           #+#    #+#              #
#    Updated: 2018/03/30 13:56:24 by hasmith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 1 ] ; then
    echo "usage: sh $0 directory_path"
else
    DIRECTORY=$1
    echo $USER > $DIRECTORY/author
fi
    exit 0
