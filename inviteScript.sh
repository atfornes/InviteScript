#!/bin/bash
# Input file <emails.txt> should have an email address per line 
# do: cat emails.txt | xargs -L1 ./inviteScript.sh
email=$1
do="add"
name="admin_login_name"
pass="PASWORD"
url="wikiaddress.net" # example: "https://en.wikipedia.org"

if [ ! -e cookies.txt ]
then
    # Mediawiki uses a login token, and we must have it for this to work.
    WP_LOGIN_TOKEN=$(wget  --cookies=on -q -O - --save-cookies cookies.txt --keep-session-cookies --no-check-certificate \
        ${url}/index.php/Special:UserLogin \
        | grep wpLoginToken | grep -o '[a-z0-9]\{32\}')


    wget --cookies=on --load-cookies cookies.txt --save-cookies cookies1.txt --keep-session-cookies --no-check-certificate \
        --post-data "wpName=${name}&wpPassword=${pass}\
&wpRemember=1&wpLoginattempt=Log%20in&wpLoginToken=${WP_LOGIN_TOKEN}" \
        "${url}/index.php?title=Special:UserLogin&action=submitlogin&type=login"
fi

WP_TOKEN=$(wget  --cookies=on -q -O - --load-cookies cookies1.txt --save-cookies cookies2.txt --keep-session-cookies --no-check-certificate \
    ${url}/Especial:InviteSignup \
    | grep post | grep -o '[a-z0-9]\{32\}+\\' |head -n 1 |grep -o '[a-z0-9]\{32\}')

echo "token:"
echo ${WP_TOKEN}

wget  --load-cookies cookies2.txt --save-cookies cookies3.txt --keep-session-cookies --no-check-certificate \
 -S --post-data "email=$email&title=Especial%3AInviteSignup&token=$WP_TOKEN%2B%5C&do=add" "${url}/Especial%3AInviteSignup"
