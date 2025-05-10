# Use the official Python image
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy requirements first (Docker caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt --default-timeout=100 future

# Copy the rest of the code
COPY . .

# Streamlit port
EXPOSE 8501

# Run Streamlit
CMD ["streamlit", "run", "chatbot.py", "--server.port=8501", "--server.address=0.0.0.0", "--server.enableCORS=false"]
