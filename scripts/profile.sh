#!/user/bin/env bash

# 대기 중인 profile 탐색: real1 유후 상태라면 real2 사용. 또는 그 반대.
function find_idle_profile() {
  RESPONSE_CODE=$(curl -s - o /dev/null -w "%{http_code}" http://localhost/profile)
  if [ ${RESPONSE_CODE} -ge 400 ] # 400보다 크면(40x/ 50x 에러를 전부 포함함)
  then
    CURRENT_PROFILE=real2
  else
    CURRENT_PROFILE=$(curl -s http://localhost/profile)
  fi

  if [ ${CURRENT_PROFILE} == real1 ]
  then
    IDLE_PROFILE=real2
  else
    IDLE_PROFILE=real1
  fi

  echo "${IDLE_PROFILE}"
}

# 유후 상태 profile의 port 탐색
function find_idle_port() {
  IDLE_PROFILE=$(find_idle_profile)

  if [ ${IDLE_PROFILE} == real1 ]
  then
    echo "8081"
  else
    echo "8082"
  fi
}