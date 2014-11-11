
if (which go &> /dev/null) then
  export GOROOT=`brew --prefix go`/libexec
  export GOPATH=~/Development/GoDev
  export PATH=$PATH:$GOPATH/bin
fi
