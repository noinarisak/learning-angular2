FROM codenvy/shellinabox

# Execute your custom commands here.  You can add
# as many RUN commands as you want.  Combining
# RUN commands into a single entry will cause your
# environment to load faster.  Also, building your image
# with docker offline and uploading it to Docker Hub
# as a pre-built base image will also cause it to load
# Faster.  This example installs python, curl, and the
# Google SDK as an example.
# RUN sudo apt-get update -y && \\
#     sudo apt-get install --no-install-recommends -y -q curl build-essential python3 python3-dev python-pip git python3-pip && \\
#     sudo pip3 install -U pip && \\
#     sudo pip3 install virtualenv && \\
#     sudo mkdir /opt/googlesdk && \\
#     wget -qO- \"https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz\" | sudo tar -zx -C /opt/googlesdk && \\
#     sudo /bin/sh -c \"/opt/googlesdk/google-cloud-sdk/install.sh\" && \\
#     sudo chmod +x /opt/googlesdk/google-cloud-sdk/bin/gcloud

# Custom
# install some components
RUN sudo apt-get update && \
    sudo apt-get install -y python git ruby-full rubygems npm && \
    sudo ln -sf /usr/bin/nodejs /usr/bin/node && \
    sudo gem install sass compass && \
    sudo npm install -g tsd@^0.6.0 typescript@^1.5.0-beta http-server

ENV HOME /home/user 
RUN mkdir /home/user/application /tmp/application
    
# Grunt will listen on 9000 port number
EXPOSE 9000
ENV CODENVY_APP_PORT_9000_HTTP 9000

# Debugging listen 8000 port number
ENV CODENVY_APP_PORT_8000_HTTP 8000

# Http-server listen on 8080 port number
EXPOSE 8080
ENV CODENVY_APP_PORT_8080_HTTP 8080

WORKDIR /home/user/application
VOLUME ["/home/user/application"]

# Map to the Codenvy Project Explorer
ENV CODENVY_APP_BIND_DIR /home/user/application

# Start web-server
CMD ["http-server"]