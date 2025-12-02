FROM python:alpine
ARG UID=1000
ARG GID=1000
RUN addgroup mnamer -g $GID
RUN adduser mnamer -u $UID -G mnamer --disabled-password

WORKDIR /app

# Copy uv from official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY pyproject.toml ./
COPY ./mnamer ./mnamer

# Install the package into system Python
RUN uv pip install --system .

USER mnamer

ENTRYPOINT ["python", "-m", "mnamer"]
CMD ["--batch", "/mnt"]
