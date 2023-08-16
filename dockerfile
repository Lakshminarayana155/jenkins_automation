# run time as parent image
FROM python:latest

# enviroment variable ensures that the python output is set straight to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements_win.txt

COPY . /app/

WORKDIR /app/sample_auto

EXPOSE 8080

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]