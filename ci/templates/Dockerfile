# Use an official lightweight Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy all files to the working directory
COPY . .

# Install dependencies (if requirements.txt exists)
RUN pip install --no-cache-dir -r requirements.txt || true

# Define the default command
CMD ["python", "-m", "http.server", "8000"]
