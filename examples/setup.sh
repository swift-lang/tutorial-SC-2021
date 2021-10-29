cd $HOME
mkdir swift-t
cd swift-t

export SWIFT_ROOT=$HOME/ve
export PATH=$SWIFT_ROOT/stc/bin:$PATH
git clone https://github.com/swift-lang/swift-t.git
pushd swift-t/dev/build
# cp -v swift-t-settings.sh.template swift-t-settings.sh
./init-settings.sh
# Set the installation directory location
sed -i "/SWIFT_T_PREFIX=/s@=.*@=$SWIFT_ROOT@" swift-t-settings.sh
# Enable the Python interoperability:
sed -i "/ENABLE_PYTHON=/s@=.*@1@" swift-t-settings.sh
sed -i "/PYTHON_EXE=/s@=.*@=python3@" swift-t-settings.sh
./build-swift-t.sh
popd
