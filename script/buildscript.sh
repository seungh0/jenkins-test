#!/bin/bash
export BUILD_ID=dontKillMe

CURRENT_PID=$(pgrep -f jenkins-test)

if [ -z $CURRENT_PID ]; then  # -z : (null or lenth =0)
	echo "구동중인 서버 없음"
else
	echo "서버 kill"
    kill -9 $CURRENT_PID  # process kill
fi

chmod +x ./gradlew

./gradlew build -x test # gradle build

nohup java -jar build/libs/*.jar &