FROM python:3.6.7
ADD . /app
WORKDIR /app
COPY requirements.txt .

# upgrade pip and install required python packages
RUN pip install -U pip
RUN pip install -r requirements.txt

# copy over our app code
COPY . .