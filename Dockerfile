FROM python:3.10

WORKDIR /app

# Install system dependencies for building Python packages and AV
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ffmpeg \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
