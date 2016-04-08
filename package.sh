#!/bin/bash -e
BUILD=./package/BUILD
DEST=./package
usage() {
  echo "Create Debian package"
  echo "[Usage] ./package.sh"
}


while [ ! -z "$1" ] ; do
  case $1 in
  -h|--help)
    usage
    exit -1
    ;;
  esac
  shift
done

source version.sh
sed -i "s/Version:.*/Version: ${FULL_VERSION}/" package/control
cat package/control

TEMP_PACKAGE_DIR=${BUILD}/${FULL_VERSION}
if [ -d ${TEMP_PACKAGE_DIR} ] ; then rm -rf ${TEMP_PACKAGE_DIR} ; fi
mkdir -p ${TEMP_PACKAGE_DIR}

BIN_DIR=${TEMP_PACKAGE_DIR}/usr/bin
mkdir -p ${BIN_DIR}

cp ./src/sushihof ${BIN_DIR}


CONTROL_DIR=${TEMP_PACKAGE_DIR}/DEBIAN
mkdir -p ${CONTROL_DIR}

cp -r -a  package/control ${CONTROL_DIR}/

if [ ! -d ${BUILDPATH} ] ; then
  mkdir -p ${BUILDPATH}
fi

dpkg-deb --build ${TEMP_PACKAGE_DIR} ${DEST}
