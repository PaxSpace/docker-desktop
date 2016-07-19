from scratch

RUN apt-get update
RUN apt-get -qq -y install xorg gdm gnome build-essential vim sudo

CMD ["gnome-session"]