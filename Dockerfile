FROM base/archlinux:latest

# Install Ruby and Bundle
RUN pacman -Sy --needed --noconfirm grep ruby ruby-bundler && pacman -Scc --noconfirm

# Put source code
ADD src/ /chito/src/
ADD start.sh /chito/
ADD lista /chito/
ADD telegram_token /chito

# Install Ruby dependencies
RUN cd /chito/src/ && bundle

# Set environment
WORKDIR /chito/
CMD ["./start.sh"]

