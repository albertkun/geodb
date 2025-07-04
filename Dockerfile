FROM postgres:latest

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv libpq-dev git wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN python3 -m venv venv
ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["postgres"]
