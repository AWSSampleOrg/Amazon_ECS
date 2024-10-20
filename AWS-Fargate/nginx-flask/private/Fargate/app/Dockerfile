FROM python:3.12
WORKDIR /work
ADD . /work
RUN pip install boto3 flask
EXPOSE 3000
CMD ["python", "main.py"]
