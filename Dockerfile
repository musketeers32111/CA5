FROM python:3.11.4


WORKDIR /app


COPY . /app


#RUN pip install -r requirements.txt 


EXPOSE 80


ENV NAME World


CMD ["python", "app.py"]
