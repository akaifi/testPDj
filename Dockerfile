# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python3 && pyvenv "testPDj"

ADD . /srv/testPDj/testPDj
RUN cd "testPDj" && source bin/activate && pip3 install -r "testPDj/requirements.txt"


EXPOSE 8000
CMD source /srv/testPDj/bin/activate && \
 /srv/testPDj/testPDj/manage.py runserver 0.0.0.0:8000
