# Specify Python and a version to build an image from. 
FROM python:3.9
# Set the directory to work from. 'app' is defined as the parent directory. 
WORKDIR /app
# Copy dependencies required to run application from list in a specified directory.
COPY book_catalog/requirements.txt .
# Install dependencies using package installer for Python. '-r' specifies a requirements file
RUN pip install -r requirements.txt
# Copy book_catalog and scripts directory contents to the /app directory inside the Docker container.
COPY book_catalog /app 
COPY scripts /app 
# Declare container should listen on port 8000 at runtime.
EXPOSE 8000
# Command to run the FastAPI application using Uvicorn when the Docker container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# uvicorn is an server interface for running Python web applications.
# "main:app" Refers to the entry point for the microservice. 'app' is defined in main.py
# --host 0.0.0.0: Binds Uvicorn to listen on all available network interfaces accessible within the container.
# --port 8000: Specifies that Uvicorn should expect communciation from & listen on port 8000.