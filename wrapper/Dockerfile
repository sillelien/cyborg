FROM sillelien:base-robovm
VOLUME /build
WORKDIR /build
COPY wrap.sh /wrap.sh
RUN chmod 755 /wrap.sh
ENTRYPOINT ["/wrap.sh"]
