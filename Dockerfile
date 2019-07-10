FROM ubuntu:12.04
MAINTAINER Vivian Lim <vivvnlim at gmail dot com>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install lib32gcc1 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32asound2 curl p7zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV USER tf2
ENV HOME /home/$USER
ENV SERVER $HOME/hlserver

RUN useradd $USER && mkdir $HOME && chown $USER:$USER $HOME

USER $USER
RUN mkdir $SERVER && curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz
ADD ./scripts/tf2v_ds.txt $SERVER/tf2v_ds.txt
ADD ./scripts/update.sh $SERVER/update.sh
ADD ./scripts/tf.sh $SERVER/tf.sh
RUN $SERVER/update.sh
WORKDIR $SERVER/source2013dedi

ARG TF2V_FULL_URL
RUN curl ${TF2V_FULL_URL} -o tf2v.7z && 7zr x tf2v.7z && rm tf2v.7z
RUN cd bin && ln -s soundemittersystem_srv.so soundemittersystem.so && ln -s scenefilecache_srv.so scenefilecache.so && cd ..
RUN mv tf2vintage/cfg tf2vintage/cfg_base && mkdir tf2vintage/cfg

EXPOSE 27015
EXPOSE 27015/udp

WORKDIR /home/$USER/hlserver
ENTRYPOINT ["./tf.sh"]
CMD ["+map", "ctf_2fort", "+maxplayers", "24", "-console", "-insecure", "-high"]
