FROM python:2.7.13-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
		python-psutil \ 
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app
ADD requirements.txt /app
RUN pip install -r requirements.txt
ADD app.py /app

EXPOSE "9096"
CMD ["python", "app.py"]
