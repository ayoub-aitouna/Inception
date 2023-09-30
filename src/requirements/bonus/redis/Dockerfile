FROM debian:bookworm

RUN     apt-get update -y
RUN     apt-get upgrade -y
RUN     apt-get install redis-server -y

RUN service redis-server restart


######################## REMOVE ########################
RUN     apt-get install zsh -y 
RUN     apt-get install git -y 
RUN     apt-get install curl -y
RUN     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
##########################################################

CMD ["redis-server", "--bind", "0.0.0.0"]