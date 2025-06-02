FROM python:3.10-slim as builder

WORKDIR /app

COPY requirements.txt . 

RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.10-slim as runner 

WORKDIR /app

COPY --from=builder /root/.local /root/.local
COPY . .

ENV PATH=/root/.local/bin:$PATH
EXPOSE 5000
CMD ["python", "app.py"]    