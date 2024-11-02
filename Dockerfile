FROM python:3.10-slim
ARG MNAMER_VERSION=2.5.5
ARG UID=1000
ARG GID=1000
RUN addgroup mnamer --gid $GID
RUN adduser mnamer --uid $UID --gid $GID --disabled-password
USER mnamer

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./mnamer ./mnamer

ENTRYPOINT ["python", "-m", "mnamer"]
CMD ["--batch", "/mnt"]
