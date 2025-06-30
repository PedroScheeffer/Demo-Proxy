# Use the official Python image as a base
FROM python

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Add build tools to the base image
RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*

# Expose the port FastAPI will run on
EXPOSE 8000

# Command to run the application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
