FROM ubuntu:18.04

WORKDIR /home/tibero

ENV TZ=Asia/Seoul
ENV TB_HOME=/home/tibero/tibero6
ENV TB_SID=tibero
ENV LD_LIBRARY_PATH=$TB_HOME/lib:$TB_HOME/client/lib
ENV PATH=$PATH:$TB_HOME/bin:$TB_HOME/client/bin

COPY ./tibero6.tar.gz /usr/local/tibero6.tar.gz
COPY ./init.sql init.sql
COPY ./start-tbboot.sh start-tbboot.sh

RUN apt update
RUN apt-get update
RUN apt install -y libaio1 libncurses5

RUN tar -xzvf /usr/local/tibero6.tar.gz
RUN chmod +x /home/tibero/tibero6/bin/tbboot
RUN chmod +x /home/tibero/start-tbboot.sh

CMD ["bash", "start-tbboot.sh"]