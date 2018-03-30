#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    generate_header.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hasmith <hasmith@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/30 13:56:24 by hasmith           #+#    #+#              #
#    Updated: 2018/03/30 13:56:24 by hasmith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Usage message if number of arguments are invalid.
if [ "$#" -ne 3 ] ; then
    echo "usage: sh $0 <project_nameoname> <file_path> <language_type>"

# For C files
elif [ "$3" == "c" ] ; then
    NAME=$1
    FILE=$2
    echo "/* ************************************************************************** */" >> $FILE
    echo "/*                                                                            */" >> $FILE
    echo "/*                                                        :::      ::::::::   */" >> $FILE
    echo "/*   $(printf "%-50s %s" $NAME):+:      :+:    :+:   */" >> $FILE
    echo "/*                                                    +:+ +:+         +:+     */" >> $FILE
    echo "/*   By: $(printf "%-41s %s " "$USER <$USER@student.42.us.org>" )+#+  +:+       +#+        */" >> $FILE
    echo "/*                                                +#+#+#+#+#+   +#+           */" >> $FILE
    echo "/*   Created: $( echo "$(date +'%Y/%m/%d %T')" ) by $(printf "%-17s %s" $USER)#+#    #+#             */" >> $FILE
    echo "/*   Updated: $( echo "$(date +'%Y/%m/%d %T')" ) by $(printf "%-16s %s" $USER)###   ########.fr       */" >> $FILE
    echo "/*                                                                            */" >> $FILE
    echo "/* ************************************************************************** */" >> $FILE
    echo "" >> $FILE

# For Makefiles, shell, python, ruby, etc...
elif [ "$3" == "script" ] ; then
    NAME=$1
    FILE=$2
    echo "# **************************************************************************** #" >> $FILE
    echo "#                                                                              #" >> $FILE
    echo "#                                                         :::      ::::::::    #" >> $FILE
    echo "#    $(printf "%-50s %s" $NAME):+:      :+:    :+:    #" >> $FILE
    echo "#                                                     +:+ +:+         +:+      #" >> $FILE
    echo "#    By: $(printf "%-41s %s " "$USER <$USER@student.42.us.org>" )+#+  +:+       +#+         #" >> $FILE
    echo "#                                                 +#+#+#+#+#+   +#+            #" >> $FILE
    echo "#    Created: $( echo "$(date +'%Y/%m/%d %T')" ) by $(printf "%-17s %s" $USER)#+#    #+#              #" >> $FILE
    echo "#    Updated: $( echo "$(date +'%Y/%m/%d %T')" ) by $(printf "%-16s %s" $USER)###   ########.fr        #" >> $FILE
    echo "#                                                                              #" >> $FILE
    echo "# **************************************************************************** #" >> $FILE
	echo "" >> $FILE
fi
    exit 0
