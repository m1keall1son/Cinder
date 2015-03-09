#!/bin/sh
SAVED_DIR=`pwd`
NUM_PROCS=4
ARCH=mips64
ARCH_DIR=$ARCH

API_LEVEL=21

PLATFORM=android-$API_LEVEL
BUILD_TYPE=Debug
cd $SAVED_DIR

rm -rf ./build/$ARCH_DIR/$PLATFORM/$BUILD_TYPE
mkdir -p ./build/$ARCH_DIR/$PLATFORM/$BUILD_TYPE
cd ./build/$ARCH_DIR/$PLATFORM/$BUILD_TYPE
cmake ../../../.. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DNDK_ARCH=$ARCH -DNDK_PLATFORM=$API_LEVEL
make -j $NUM_PROCS

PLATFORM=android-$API_LEVEL
BUILD_TYPE=Release
cd $SAVED_DIR
rm -rf ./build/$ARCH_DIR/$PLATFORM/$BUILD_TYPE
mkdir -p ./build/$ARCH_DIR/$PLATFORM/$BUILD_TYPE
cd ./build/$ARCH_DIR/$PLATFORM/$BUILD_TYPE
cmake ../../../.. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DNDK_ARCH=$ARCH -DNDK_PLATFORM=$API_LEVEL
make -j $NUM_PROCS
