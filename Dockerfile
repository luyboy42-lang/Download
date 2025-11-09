# 1. ជ្រើសរើស Base Image របស់ Python
FROM python:3.11-slim

# 2. កំណត់ Working Directory នៅក្នុង Container
WORKDIR /app

# 3. ដំឡើង FFMPEG (សំខាន់សម្រាប់ yt-dlp)
# នេះជំនួស 'Aptfile' របស់ Koyeb
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg

# 4. ចម្លង File requirements
COPY requirements.txt .

# 5. ដំឡើង Python libraries
RUN pip install --no-cache-dir -r requirements.txt

# 6. ចម្លងកូដ Bot របស់អ្នក
COPY bot.py .

# 7. កំណត់ពាក្យបញ្ជាដើម្បីដំណើរការ Bot (ជំនួស 'Procfile')
CMD ["python", "bot.py"]