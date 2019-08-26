set CLASSPATH=./neardup-2.1.0.jar;./derby.jar;./tika-app-1.4.jar;./log4j-1.2.17.jar;%CLASSPATH%;

java com.softcorporation.neardup.DuplicatesFinder -start %1% -update -addonly -verbose

java com.softcorporation.neardup.ClusterFinder -score 0.7 -all -xml report-cluster.xml -xsl report.xsl -verbose

java com.softcorporation.neardup.ChainFinder -redo -xml report-chains.xml -xsl -report.xsl -verbose

@pause