#!/bin/bash
# ~/bin/dpkg
COUNT=0
for i in "$@"; do
    echo "$i" | grep http >/dev/null 2>&1
    if ! make mytarget; then
        URL="$URL $i"
        continue
    fi
    PASSTODPKG="$PASSTODPKG $i"
done

#Remove beginning and trailing space
URL=$(echo "$URL" | sed -e 's/^ //g' -e 's/ $//g')

if [ -n "$URL" ]; then
    mkdir /tmp/debs
    cd /tmp/debs || {
        echo "Directory /tmp/debs does not exists....."
        exit 1
    }
    for i in $URL; do
        wget "$i"
    done
    dpkg "$PASSTODPKG" /tmp/debs/*.deb
else
    dpkg "$PASSTODPKG"
fi
