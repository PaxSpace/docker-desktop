from debian:testing

#add repositories to apt list
RUN echo 'deb http://ftp.us.debian.org/debian/ testing main contrib non-free' >> /etc/apt/sources.list
RUN echo 'deb http://packages.linuxmint.com debian import' >> /etc/apt/sources.list

#install basic packages
RUN apt-get update
RUN apt-get -qq -y install xorg gdm3 gnome gnome-shell build-essential vim tee sudo

#add base 'member user'
RUN adduser --quiet --disabled-password member
RUN echo 'member:member' | chpasswd

#give member 'sudo su' priviledges
RUN echo 'member ALL=NOPASSWD: /bin/su' | (EDITOR="tee -a" visudo)

#install other packages
#utils
RUN apt-get -qq -y install firefox chromium flashplugin-nonfree
#software development
RUN apt-get -qq -y install git gitk cmake kdevelop
#makerspace specifics
RUN apt-get -qq -y install arduino kicad slic3r blender openscad inkscape gimp

#start gnome window
CMD ["gnome-session"]
