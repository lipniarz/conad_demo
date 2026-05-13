mkdir build
cd build

cmake .. -G Ninja ^
  -DCMAKE_CXX_COMPILER=clang++

if errorlevel 1 exit 1

ninja

if errorlevel 1 exit 1

mkdir %PREFIX%\bin
copy ..\output\demo.exe %PREFIX%\bin\