export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-16.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH

jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}

# vim
vj() {
    vim "+TlistAddFilesRecursive . [^_]*java"
}
