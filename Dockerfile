FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

WORKDIR /app

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Create directories
RUN mkdir -p docs db

# Expose Streamlit port
EXPOSE 8501

# Run the application
CMD ["streamlit", "run", "chatbot.py", "--server.address=0.0.0.0"]