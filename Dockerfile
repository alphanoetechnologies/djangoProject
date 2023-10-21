# Use an official Python runtime as a parent image
FROM ubuntu

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE your_project.settings
ENV SECRET_KEY your_secret_key

# Create and set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirements.txt && \
    cd devops

# Collect static files
RUN python3 manage.py collectstatic --noinput

# Migrate the database
RUN python3 manage.py migrate

# Expose port 8000 for the Django development server
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

