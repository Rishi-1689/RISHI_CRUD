FROM python:3.10-slim

WORKDIR /app
COPY . .

# Install sass CLI (modern)
RUN apt update && apt install -y npm && npm install -g sass

# Compile SCSS to CSS
RUN sass ./static/scss:./static/css

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]