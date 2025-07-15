### Run SearXNG at Boot with systemd

Assuming your project is at:

```bash
/opt/searxng/
├── docker-compose.yml
├── .env
└── settings.yml
```

1. Create systemd Service File

```bash
sudo nvim /etc/systemd/system/searxng.service
```

Paste this content:

```ini
[Unit]
Description=SearXNG Docker Compose Service
After=network.target docker.service
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=true
WorkingDirectory=/opt/searxng
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
```

2. Reload systemd and enable the service

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable searxng.service
sudo systemctl start searxng.service
```

3. Check Status

```bash
sudo systemctl status searxng.service
```
