#!/bin/sh

cd build
make
cd ..

cd bin/Linux/Debug
# directory, where the executable file is located, may differ if compiling in Release mode 
# or Debug mode, also depends on OS
./OpenGL-Template
cd ..
