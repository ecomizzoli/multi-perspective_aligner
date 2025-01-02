all:
	mvn install;
	java -cp src/main/resources/lib/LTL2Automaton.jar:target/MultiPerspectiveAligner-1.0-SNAPSHOT-launcher.jar Runner;
