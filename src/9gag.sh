curl -s "https://9gag.com" | grep "href" | egrep -o "/gag/[[:alnum:]]+" | shuf | head -n 1
