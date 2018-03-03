#! /bin/bash

SOURCE_FILES=(`find . -name "*.[ch]"`)
TMP_EXTENSION="indenttmp"

EXIT_RES=0

for FILE in "${SOURCE_FILES[@]}"
  do
    RES=`indent $FILE -o $FILE.$TMP_EXTENSION > /dev/null`
    if [ "$?" -ne "0" ]; then
      echo "Indent failed on file $FILE"
      EXIT_RES=1
      break
    fi

    RES=`diff -q $FILE $FILE.$TMP_EXTENSION > /dev/null`
    if [ "$?" -ne "0" ]; then
      echo "File $FILE was not formatted correctly"
      EXIT_RES=1
      break
    fi
  done

find . -name "*.$TMP_EXTENSION" -exec rm {} \;
exit $EXIT_RES 
