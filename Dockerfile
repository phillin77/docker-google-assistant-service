# Google Assistant Service
#
# VERSION               0.0.1
#
# reference: https://developers.google.com/assistant/sdk/guides/service/python/
#

FROM python:3.6-jessie

WORKDIR /tmp

RUN apt-get update -yy && \
    apt-get install -yy \
        portaudio19-dev libffi-dev libssl-dev

RUN pip3 install virtualenv
RUN python3 -m venv /env
RUN /env/bin/python -m pip install --upgrade pip setuptools wheel
RUN /bin/bash -c "source /env/bin/activate"
RUN python -m pip install --upgrade google-assistant-sdk[samples]
RUN python -m pip install --upgrade google-auth-oauthlib[tool]
# RUN deactivate
RUN rm -rf /var/cache/apt/* /tmp/* /var/tmp/*

CMD /bin/bash -c "source /env/bin/activate"
