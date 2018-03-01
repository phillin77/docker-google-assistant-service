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

RUN pip3 install virtualenv && \
    python3 -m venv env && \
    env/bin/python -m pip install --upgrade pip setuptools wheel && \
    source env/bin/activate && \
    python -m pip install --upgrade google-assistant-sdk[samples] && \
    python -m pip install --upgrade google-auth-oauthlib[tool] && \
    deactivate && \
    rm -rf /var/cache/apt/* /tmp/* /var/tmp/*

CMD source env/bin/activate
