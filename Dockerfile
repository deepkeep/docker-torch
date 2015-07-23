FROM ubuntu:trusty
MAINTAINER deepkeep.co

# readd update
RUN apt-get install -y curl
RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash

ENV TORCH /usr/local/torch
RUN git clone https://github.com/torch/distro.git $TORCH --recursive

WORKDIR $TORCH
RUN ./install.sh

ENV TORCH_PREFIX      $TORCH/install
ENV PATH              $TORCH_PREFIX/bin:$PATH
ENV LD_LIBRARY_PATH   $PREFIX/lib:$LD_LIBRARY_PATH
ENV DYLD_LIBRARY_PATH $PREFIX/lib:$DYLD_LIBRARY_PATH

CMD ["./bin/th"];
