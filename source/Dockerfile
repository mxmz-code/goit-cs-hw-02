FROM python:3.10

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь вміст проекту
COPY . .

# Встановлюємо змінну середовища для FastAPI
ENV PYTHONUNBUFFERED=1

# Запускаємо FastAPI-застосунок
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
