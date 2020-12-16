#/usr/bin/bash

set -ue

surname=Surname
name=Name
HW=2

DATA_DIR=./data

packFiles=("file.txt")

archiveName=MADEPY20Q4_"${surname}"_"${name}"_HW"${HW}".zip

TEST_FILENAME=./test_"${surname}"_"${name}"_task.py
TASK_FILENAME=./task_"${surname}"_"${name}"_task.py

if [ -f "$archiveName" ]
then
    rm ./"$archiveName"
fi

pushd "$DATA_DIR"

zip ../"${archiveName}" ${packFiles[@]}

popd

packFiles=("${TASK_FILENAME}" "${TEST_FILENAME}")

zip ./"${archiveName}" ${packFiles[@]}


if [ -d ./test ]
then
    rm -r ./test
fi

mkdir -p ./test

pushd ./test

unzip ../"${archiveName}"

pytest --maxfail=1 --cov

python "${TASK_FILENAME}" --file ./file.txt

popd
