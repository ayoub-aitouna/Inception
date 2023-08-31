FROM alpine:3.18.3

RUN apk update && \
    apk add build-base && \
    apk add nginx && \
    apk add curl &&\
    apk add zsh &&\
    apk add git &&\
    apk add neovim &&\
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/jrayoub/nvim_config ~/.config/nvim

ENTRYPOINT ["zsh"]
