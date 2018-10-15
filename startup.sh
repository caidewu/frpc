#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
ProgramName="Frpc"

# "/usr/local/frpc"
ProgramPath="./"
NAME=frpc
BIN=${ProgramPath}/${NAME}
CONFIGFILE=${ProgramPath}/frpc.ini
program_version=`${BIN} --version`


fun_check_run(){
    PID=`ps -ef | grep -v grep | grep -i "${BIN}" | awk '{print $2}'`
    if [ ! -z $PID ]; then
        return 0
    else
        return 1
    fi
}

if fun_check_run; then
    echo "${ProgramName} (pid $PID) already running."
    return 0
fi


echo -n "Starting ${ProgramName}(${program_version})..."
${BIN} -c ${CONFIGFILE} >/dev/null 2>&1 &
sleep 1
if ! fun_check_run; then
    echo "start failed"
    return 1
fi
echo " done"
echo "${ProgramName} (pid $PID)is running."
