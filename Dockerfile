FROM python:3.12-slim-bullseye

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Copy the application into the container.
COPY . /server

# Install the application dependencies.
WORKDIR /server
RUN uv sync --locked --no-cache

# Add created venv binaries to PATH
ENV PATH="/server/.venv/bin/:$PATH"

# Run the application.
CMD ["fastapi", "run", "app/main.py", "--port", "80"]
