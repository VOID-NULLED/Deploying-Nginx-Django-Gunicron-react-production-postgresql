# backend/Dockerfile
FROM python:3.12-alpine

WORKDIR /backend

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]

#CMD ["gunicorn", "app.wsgi:application", "--bind", "0.0.0.0:8000"]
