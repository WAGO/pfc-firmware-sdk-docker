FROM scratch as base
ARG SOURCE_DIR=V03.09.07_21
ADD src/${SOURCE_DIR}/ptxproj/platform-wago-pfcXXX/images/root.tgz /
RUN rm -r /boot 
RUN rm -r /usr/lib/modules
RUN rm -r /usr/share/licenses

FROM scratch as final
COPY --from=base / /
LABEL maintainer="sergei.ikkert@wago.com, dirk.meihoefer@wago.com"
LABEL description="WAGO Kontakttechnik firmware base image"
CMD ["/bin/bash"]