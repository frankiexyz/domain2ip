#!/bin/sh
domain=`echo $1 | sed -e 's/http:\/\///g' | sed -e 's/https:\/\///g' |sed -e 's/\/.*//g'`
ip=`dig $domain +short`
if [[ -z "$ip" ]]; then
    echo "No such domain!"
else
    echo $ip
    whois -h whois.cymru.com -v $ip
fi
