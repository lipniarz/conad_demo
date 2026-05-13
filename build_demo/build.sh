mkdir build
cd build

cmake .. -G Ninja \
  -DCMAKE_CXX_COMPILER=clang++

ninja

mkdir -p $PREFIX/bin
cp ../output/demo $PREFIX/bin/