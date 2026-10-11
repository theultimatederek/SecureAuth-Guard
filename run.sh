#!/usr/bin/env bash
set -euo pipefail
mkdir -p out
javac -encoding UTF-8 -d out src/main/java/com/secureauth/Main.java
java -cp out com.secureauth.Main
