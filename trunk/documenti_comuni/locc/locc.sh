if [ -z $javabin ];
then
	javabin=java
fi

pdir=$(dirname $0)

$javabin -classpath "$pdir/locc.jar:$pdir/rules.jar" -Dlocc.rules=$pdir/rules.lst locc.Locc "$@"
