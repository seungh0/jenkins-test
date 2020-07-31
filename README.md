# Docker + Jenkins 을 이용한 CI 구축

#### Jenkins 설치
```
docker volume create jenkins-test-volume
docker volume ls

docker run -d -it --name jenkins-test -p 8080:8080 -p 8000:8000 -v jenkins-test-volume jenkins/jenkins:lts

java -version // openjdk version "1.8.0_242"
```


#### Jenkins build script
```
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
```