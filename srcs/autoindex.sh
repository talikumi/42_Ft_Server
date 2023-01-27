
if [[ $1 == "off" ]]
then
	sed -i 's/autoindex on/ autoindex off/g' /etc/nginx/sites-available/default
	nginx -s reload
	echo "AUTOINDEX OFF"
elif [[ $1 == "on" ]]
then
	sed -i 's/autoindex off/ autoindex on/g' /etc/nginx/sites-available/default
	nginx -s reload
	echo "AUTOINDEX ON"
else
	echo "NOTHING_HAPPENED_TRY_USING_ON_&&_OFF"
fi
