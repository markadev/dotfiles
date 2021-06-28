# Print the date

if test -t 1; then
	DAY=`date +%-d`
	cal | grep "\<${DAY}\>" | sed -e "s/\<${DAY}\>/[01;33m&[0m/"
	unset DAY
fi
