unset CP_TESTS
for jar in `pwd`/../lib/*.jar ../ext/*.jar;
do
  if [ x = "x$CP_TESTS" ]; then
    CP_TESTS=$jar
  else
    CP_TESTS=$CP_TESTS:$jar
  fi
done

if [ "x`uname -s | grep WIN`" != "x" ] ; then
  CP_TESTS=`cygpath -wp $CP_TESTS`
fi

export CP_TESTS

