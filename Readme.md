# UniFi2NetBox Docker Container

Automatisch gebauter Docker Container für [unifi2netbox](https://github.com/mrzepa/unifi2netbox).

## Features

- Automatische Updates bei Änderungen im Original-Repository
- Multi-Architektur Support (amd64, arm64)
- Tägliche Checks auf neue Versionen
- Versionierte Tags

## Installation

### Docker Run

```bash
docker run -d \
  --name unifi2netbox \
  -e UNIFI_HOST=your-controller.example.com \
  -e UNIFI_PORT=8443 \
  -e UNIFI_USER=your-username \
  -e UNIFI_PASSWORD=your-password \
  -e NETBOX_URL=https://netbox.example.com \
  -e NETBOX_TOKEN=your-api-token \
  -v $(pwd)/config:/app/config \
  -v $(pwd)/logs:/app/logs \
  ghcr.io/YOUR-USERNAME/unifi2netbox:latest
```

### Docker Compose

```yaml
version: '3.8'

services:
  unifi2netbox:
    image: ghcr.io/YOUR-USERNAME/unifi2netbox:latest
    container_name: unifi2netbox
    environment:
      - UNIFI_HOST=your-controller.example.com
      - UNIFI_PORT=8443
      - UNIFI_USER=your-username
      - UNIFI_PASSWORD=your-password
      - NETBOX_URL=https://netbox.example.com
      - NETBOX_TOKEN=your-api-token
    volumes:
      - ./config:/app/config
      - ./logs:/app/logs
    restart: unless-stopped
```

## Umgebungsvariablen

| Variable | Beschreibung | Erforderlich |
|----------|-------------|--------------|
| `UNIFI_HOST` | UniFi Controller Hostname | Ja |
| `UNIFI_PORT` | UniFi Controller Port | Nein (Default: 8443) |
| `UNIFI_USER` | UniFi Username | Ja |
| `UNIFI_PASSWORD` | UniFi Password | Ja |
| `NETBOX_URL` | NetBox URL | Ja |
| `NETBOX_TOKEN` | NetBox API Token | Ja |

## Tags

- `latest` - Neuester Build
- `YYYYMMDD` - Build vom spezifischen Datum
- `xxxxxxx` - Build vom spezifischen Upstream-Commit

## Build-Status

Der Container wird automatisch gebaut:
- Täglich um 2:00 Uhr UTC (falls Änderungen im Upstream vorhanden)
- Bei Änderungen am Dockerfile
- Manuell über GitHub Actions

## Lizenz

Siehe [Original-Repository](https://github.com/mrzepa/unifi2netbox)
