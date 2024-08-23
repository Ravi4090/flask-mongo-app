
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose port 5000
EXPOSE 5000

# Set environment variable
ENV NAME World

# Run the application
CMD ["python", "app.py"]
