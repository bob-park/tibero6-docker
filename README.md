# Tibero 6 를 Docker 로 올려버리기
이 Repository 는 Tibero 6 를 Docker 로 올릴 수 있도록 만든 Rpository 이다.


## Spec
* Ubuntu 18.04
* Java 1.8
* Tibero 6


## Docker 로 tibero 6 올리기

### `docker-compose.yml`

```yml
services:
  tibero-db:
    container_name: tibero-db
    image: ghcr.io/bob-park/tibero6
    hostname: hostname # hostname 으로 license 를 발급받아야함
    ports:
      - 8629:8629
    volumes:
      - ./tibero/database:/home/tibero/tibero6/database # db files
      - ./tibero/license:/home/tibero/tibero6/license # license
```

