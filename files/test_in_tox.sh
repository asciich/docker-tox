#!/usr/bin/env sh

set -e

TOX_SUBDIRECTOY="${1}"
if [ "${TOX_SUBDIRECTOY}" == "" ] ; then
    echo "Usage:"
    echo "    ${0} TOX_SUBDIRECTORY"
    echo "         TOX_SUBDRIECTORY is relative to /test/"
    exit 1
fi

TMP_TEST_DIR="/temp_test"
MAIN_PWD=$(pwd)

echo "clear temporary directory '${TMP_TEST_DIR}'"
rm -rf ${TMP_TEST_DIR}
mkdir ${TMP_TEST_DIR}

echo "copy testdata to temporary directory '${TMP_TEST_DIR}'"
cp -r /test/* ${TMP_TEST_DIR}

echo "cleanup __pycache__ directories"
cd ${TMP_TEST_DIR}
if find __pycache__ &> /dev/null ; then
    for CACHE in $(find __pycache__) ; do
        rm -rf ${CACHE}
    done
fi

if [ "${1}" != "" ] ; then
    cd ${1}
fi

echo "Start Tox in $(pwd)"
tox
