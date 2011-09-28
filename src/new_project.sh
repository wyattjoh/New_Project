#     Copyright 2011 Wyatt Johnson
#     All Rights Reserved.
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
#!/bin/bash

[[ $# -lt 1 ]] && printf 'Usage: new_project.sh [Project Name] [EXT]\n' && exit
PROJECT_NAME="$1"
EXT="$2"
AUTHOR=${3-"Wyatt Johnson"}
YEAR=$(date +%Y)
PROJECT_PATH=${4-"$(pwd)/${PROJECT_NAME}"}
COPYWRITE="#     Copyright ${YEAR} ${AUTHOR}
#     All Rights Reserved.
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>."

function filetype() {
[[ "$1" == "-bash" ]] && echo -e "${COPYWRITE}\n#!/bin/bash" >> "${2}" && mv "${2}" "${2}.sh" 
}

mkdir -p "${PROJECT_PATH}/src"

for srcfile in makefile
do
	touch "${PROJECT_PATH}/src/${srcfile}"
	[[ -n $EXT ]] && filetype "$2" "${PROJECT_PATH}/src/${srcfile}"
done

for name in readme.txt 
do
	touch "${PROJECT_PATH}/${name}"
	echo -e "${name}: ${PROJECT_NAME} \n \n${AUTHOR} ${YEAR}" >> "${PROJECT_PATH}/${name}"
done
