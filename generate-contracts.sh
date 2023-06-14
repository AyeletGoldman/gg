#!/bin/sh

#  generate-contracts.sh
#  Hublot Clienteling
#
#  Created by Yona Harel on 13/11/2022.
#
echo "input path to template.yml"
read template
maisonkit-gen generate "./Clienteling/Networking/api.json" -d "./Clienteling/Networking/Generated" -t $template -c
