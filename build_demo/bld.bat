call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" amd64

set CC=clang-cl
set CXX=clang-cl
set RC=rc.exe

mkdir build
cd build

cmake .. -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%

cmake --build .

mkdir %PREFIX%\bin
copy "%SRC_DIR%\output\demo.exe" "%PREFIX%\bin\"
if errorlevel 1 exit 1