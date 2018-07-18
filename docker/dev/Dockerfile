FROM berndtzayne/todobackend-base:latest
MAINTAINER Zayne Berndt <berndt.zayne@gmail.com>

#Insatll dev/build dependencies
RUN apt-get update && \
	apt-get install -qy python-dev libmysqlclient-dev

#Activate virtual environment and install wheel support
RUN . /appenv/bin/activate && \
	pip install wheel --upgrade

#PIP environment variables (NOTE: must be setr after installing wheel)
ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PIP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache


#OUTPUT: Build artifacts (Wheels) are output here
VOLUME /wheelhouse

#OUTPUT: Test reports are output here
VOLUME /reports

COPY scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x /usr/local/bin/test.sh


#Set defaults for entrypoint and command string 
ENTRYPOINT ["test.sh"]
CMD ["python", "manage.py", "test", "--noinput"]

#Add application source
COPY src /application
WORKDIR /application