#!/bin/bash

# Масив URL вебсайтів для перевірки
WEBSITES=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://goit.global"
    "https://www.edu.goit.global"
)

# Ім'я файлу логів
LOG_FILE="website_status.log"

# Очищаємо попередній лог-файл
> "$LOG_FILE"

echo "🔍 Починаємо перевірку доступності вебсайтів..."

# Проходимо по всіх сайтах у списку
for SITE in "${WEBSITES[@]}"; do
    # Виконуємо запит, слідкуємо за переадресацією (-L) і отримуємо лише HTTP-код (-o /dev/null -s -w "%{http_code}")
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" -L "$SITE")

    # Перевіряємо статус-код
    if [ "$STATUS" -eq 200 ]; then
        echo "$SITE is UP ✅" | tee -a "$LOG_FILE"
    else
        echo "$SITE is DOWN ❌ (HTTP $STATUS)" | tee -a "$LOG_FILE"
    fi
done

echo "✅ Результати записано у файл: $LOG_FILE"
