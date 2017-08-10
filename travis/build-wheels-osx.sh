#!/bin/bash
set +e
echo 'Begin build-wheel OSX ...'

export PYTHON_VERSION=${MB_PYTHON_VERSION/./}
echo 'MB_PYTHON_VERSION: ' $MB_PYTHON_VERSION
echo 'PYTHON_VERSION: '$PYTHON_VERSION

echo 'PIP and brew installs'

pip install $BUILD_DEPENDS

cd opencv

echo "Apply patch"

git apply --ignore-space-change --ignore-whitespace ../travis/disable_i386.patch

echo 'Config make'

mkdir build
cd build

if [[ $PYTHON_VERSION == 2* ]] && [[ $ENABLE_CONTRIB == 0 ]]; then
  echo 'Config for Py2'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake \
    -D BUILD_opencv_python3=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON2_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
  	-D PYTHON2_LIBRARY=/usr/local/Cellar/python/2.7.10/Frameworks/Python.framework/Versions/2.7/bin \
  	-D PYTHON2_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7 \
  	-D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
  	-D BUILD_EXAMPLES=OFF ..
fi

if [[ $PYTHON_VERSION == 34 ]] && [[ $ENABLE_CONTRIB == 0 ]]; then
  echo 'Config for Py34'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake \
    -D BUILD_opencv_python2=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON3_LIBRARY=/usr/local/Cellar/python3/3.4.2_1/Frameworks/Python.framework/Versions/3.4/bin \
    -D PYTHON3_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/3.4/include/python3.4m \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi

if [[ $PYTHON_VERSION == 35 ]] && [[ $ENABLE_CONTRIB == 0 ]]; then
  echo 'Config for Py35'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake \
    -D BUILD_opencv_python2=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON3_LIBRARY=/usr/local/Cellar/python3/3.5.1/Frameworks/Python.framework/Versions/3.5/bin \
    -D PYTHON3_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/3.5/include/python3.5m \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi

if [[ $PYTHON_VERSION == 36 ]] && [[ $ENABLE_CONTRIB == 0 ]]; then
  echo 'Config for Py36'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake \
    -D BUILD_opencv_python2=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON3_LIBRARY=/usr/local/Cellar/python3/3.6.0/Frameworks/Python.framework/Versions/3.6/bin \
    -D PYTHON3_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/3.6/include/python3.6m \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi


if [[ $PYTHON_VERSION == 2* ]] && [[ $ENABLE_CONTRIB == 1 ]]; then
  echo 'Config for Py2'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D BUILD_opencv_python3=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON2_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON2_LIBRARY=/usr/local/Cellar/python/2.7.10/Frameworks/Python.framework/Versions/2.7/bin \
    -D PYTHON2_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/2.7/include/python2.7 \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi

if [[ $PYTHON_VERSION == 34 ]] && [[ $ENABLE_CONTRIB == 1 ]]; then
  echo 'Config for Py34'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D BUILD_opencv_python2=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON3_LIBRARY=/usr/local/Cellar/python3/3.4.2_1/Frameworks/Python.framework/Versions/3.4/bin \
    -D PYTHON3_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/3.4/include/python3.4m \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi

if [[ $PYTHON_VERSION == 35 ]] && [[ $ENABLE_CONTRIB == 1 ]]; then
  echo 'Config for Py35'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D BUILD_opencv_python2=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON3_LIBRARY=/usr/local/Cellar/python3/3.5.1/Frameworks/Python.framework/Versions/3.5/bin \
    -D PYTHON3_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/3.5/include/python3.5m \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi

if [[ $PYTHON_VERSION == 36 ]] && [[ $ENABLE_CONTRIB == 1 ]]; then
  echo 'Config for Py36'
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D CMAKE_TOOLCHAIN_FILE=../../travis/toolchain_macos.cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D BUILD_opencv_python2=OFF -D BUILD_opencv_java=OFF -D BUILD_SHARED_LIBS=OFF -D WITH_LAPACK=OFF \
    -D PYTHON3_PACKAGES_PATH=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -D PYTHON3_LIBRARY=/usr/local/Cellar/python3/3.6.0/Frameworks/Python.framework/Versions/3.6/bin \
    -D PYTHON3_INCLUDE_DIR=/Library/Frameworks/Python.framework/Versions/3.6/include/python3.6m \
    -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF ..
fi


echo 'Begin build'
make -j8

# Moving back to opencv-python
cd ../..

if [[ $PYTHON_VERSION == 2* ]]; then
  echo 'Copying *.so for Py2'
  cp opencv/build/lib/cv2.so cv2/
fi

if [[ $PYTHON_VERSION == 3* ]]; then
  echo 'Copying *.so for Py3'
  cp opencv/build/lib/python3/*.so cv2/
fi

echo 'Build wheel'

