#!/bin/sh -e

str()
{
    awk '{
            gsub("^\\.\\./", "");

            x = $0; gsub("^modules/", "", x);
            gsub("^broker/go/", "", x);
            gsub("^broker/pysrc/", "", x);
            gsub("^broker_net/", "", x);
            gsub(".*/include/", "", x);

            gsub("_", "\\_", x);
            print "\\lstinputlisting[title="x"]{"$0"}";
        }'
}

gen()
{
    for i
    do
        find "../modules/$i" -type f -name '*.hpp' -o -name '*.py' -o -name '*.proto' -o -name '*.cs' -o -name '*.go' | \
            grep -v /detail/ | \
            grep -v /web/ | \
            grep -v /compatibility/ | \
            grep -v /mock/ | \
            grep -v '_test\.go' | \
            egrep -v '/none_dcs\.py$' | \
            egrep -v '/common\.hpp$' | \
            egrep -v '/pb/convert\.hpp$' | \
            egrep -v '/problem/split\.hpp$' | \
            egrep -v '/error\.hpp$' | \
            egrep -v '/config\.hpp$' | \
            str
    done
}

genp()
{
    gen "$1/include"
}

secraw()
{
    cmd="$1"
    section="$2"
    shift 2

    echo '\section{'"$(echo "$section" | sed -r 's|_|\\_|g')"'}'
    echo
    "$cmd" "$@"
    echo
}

sec()
{
    secraw gen "$@"
}

secp()
{
    secraw genp "$@"
}

echo '\chapter{Исходный код}'
echo

sec "Реализация на языке программирования Go" broker/go
sec "Реализация на языке программирования Python" broker/pysrc
sec "Реализация на языке программирования C\#" broker_net
#sec bunsan::worker bunsan/broker
#secp bunsan::pm bunsan/pm
