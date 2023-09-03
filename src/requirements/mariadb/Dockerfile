FROM debian:bookworm


#REMOVE LATER
# ENV MYSQL_DATABASE=DB
# ENV MYSQL_ROOT_PASSWORD=Vty_QB80+yvm
# ENV MYSQL_USER=inception
# ENV MYSQL_PASSWORD=ku9>qu>0sVnM
#REMOVE LATER



RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server -y


# my zsh & nvim conf 

RUN apt install curl  -y &&\
    apt install zsh  -y &&\
    apt install git -y &&\
    apt install neovim -y &&\
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone https://github.com/jrayoub/nvim_config ~/.config/nvim

# end of my zsh & nvim conf 

COPY ./conf/50-server.cnf  /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh  /bin/init.sh
RUN chmod +x /bin/init.sh
# ENTRYPOINT [ "zsh" ]
ENTRYPOINT [ "sh", "/bin/init.sh" ]