sudo apt-get update
sudo apt-get install -y git zip xauth
# 1. mininet (with openflow, open-vswitch)
git config --global url.https://github.com/.insteadOf git://github.com/
git clone https://github.com/mininet/mininet
cd mininet
git checkout -b mininet-2.3.0 2.3.0
cd ..
mininet/util/install.sh -a

# 2. onos
# 2-1. install bazel
sudo apt install -y apt-transport-https curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install -y bazel-3.7.2
sudo ln -s /usr/bin/bazel-3.7.2 /usr/bin/bazel
# 2-2. onos source and run script
git clone https://gerrit.onosproject.org/onos
cd onos
cat << EOF >> ~/.bash_profile
export ONOS_ROOT="`pwd`"
source `pwd`/tools/dev/bash_profile
EOF
. ~/.bash_profile
cd $ONOS_ROOT
bazel build onos