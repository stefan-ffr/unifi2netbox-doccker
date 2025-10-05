FROM python:3.11-slim

WORKDIR /app

# Installiere Git falls du direkt vom Repo installieren möchtest
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Klone das Repository oder kopiere die Dateien
# Option 1: Vom Git Repository
RUN git clone https://github.com/mrzepa/unifi2netbox.git .

# Option 2: Falls du lokale Dateien hast
# COPY . .

# Installiere Dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Erstelle Volume für Config
VOLUME ["/app/config"]

# Setze Umgebungsvariablen (können beim Container-Start überschrieben werden)
ENV UNIFI_HOST="" \
    UNIFI_PORT="8443" \
    UNIFI_USER="" \
    UNIFI_PASSWORD="" \
    NETBOX_URL="" \
    NETBOX_TOKEN=""

# Führe das Script aus
CMD ["python", "unifi2netbox.py"]
