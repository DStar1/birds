#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gen_gitignore.sh                                   :+:      :+:    :+:    #
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
# Copies all these shits into a .gitignore file.
else
    DIRECTORY=$1
    {
        echo "# Specifies intentionally untracked files to ignore below\n" > \
        $DIRECTORY/.gitignore
        echo "*.DS_Store" >> $DIRECTORY/.gitignore
        echo ".AppleDouble" >> $DIRECTORY/.gitignore
        echo ".LSOverride" >> $DIRECTORY/.gitignore
        echo "a.out" >> $DIRECTORY/.gitignore
        echo "._*" >> $DIRECTORY/.gitignore
        echo ".DocumentRevisions-V100" >> $DIRECTORY/.gitignore
        echo ".fseventsd" >> $DIRECTORY/.gitignore
        echo ".Spotlight-V100" >> $DIRECTORY/.gitignore
        echo ".TemporaryItems" >> $DIRECTORY/.gitignore
        echo ".Trashes" >> $DIRECTORY/.gitignore
        echo ".VolumeIcon.icns" >> $DIRECTORY/.gitignore
        echo ".com.apple.timemachine.donotpresent" >> $DIRECTORY/.gitignore
        echo ".AppleDB" >> $DIRECTORY/.gitignore
        echo ".AppleDesktop" >> $DIRECTORY/.gitignore
        echo ".apdisk" >> $DIRECTORY/.gitignore

    } &> /dev/null
fi
    exit 0
