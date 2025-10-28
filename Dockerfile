#Lightweight Python image
FROM python:3.10-slim

#Set working directory
WORKDIR /app

#Copy requirements.txt and install dependencies

COPY requirements.txt .
RUN pip install -r requirements.txt

#Copy the rest of the application code
COPY app/ .

#Expose port 5000
EXPOSE 5000

#Run the application
CMD ["python", "app.py"]