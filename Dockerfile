# Use an official Python runtime as a parent image
FROM python:3.8

# Create and set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose port 8000 for the Django development server
EXPOSE 8000

# Collect static files
RUN python3 manage.py collectstatic --noinput

# Migrate the database
RUN python3 manage.py migrate

# Start the Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
