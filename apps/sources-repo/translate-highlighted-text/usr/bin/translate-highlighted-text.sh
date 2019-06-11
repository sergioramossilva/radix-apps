#!/usr/bin/env bash
text="$(xsel -o)"
translate="$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=pt-br&dt=t&q=$(echo $text | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}')"
echo -e "Original text:" "$text"'\n' > /tmp/notitrans
echo "Translation:" "$translate" >> /tmp/notitrans
zenity --text-info \
	   --title=Tradução \
	   --filename=/tmp/notitrans \
	   --ok-label=Fechar \
	   --cancel-label=Copiar
case $? in
0)
exit
;;
1)
echo "$translate" | xclip -selection clipboard
notify-send --icon=clipboard "$text" "$translate"
;;
esac