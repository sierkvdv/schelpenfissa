#!/usr/bin/env bash
# Deploy de statische Schelpenfissa-site naar de VPS.
# Gebruik: ./deploy.sh
set -euo pipefail

VPS="root@187.124.0.172"
KEY="$HOME/.ssh/openclaw_key"
DEST="/srv/apps/schelpenfissa/public"
SSH=(ssh -i "$KEY" -o StrictHostKeyChecking=accept-new)

echo "→ Transfer public/ naar ${VPS}:${DEST}"
tar czf - -C public . | "${SSH[@]}" "$VPS" \
  "mkdir -p '$DEST' && tar xzf - -C '$DEST' && chown -R schelpenfissa:schelpenfissa /srv/apps/schelpenfissa && find '$DEST' -type d -exec chmod 755 {} \; && find '$DEST' -type f -exec chmod 644 {} \; && echo '  transfer OK'"

echo "→ nginx test + reload"
"${SSH[@]}" "$VPS" "nginx -t && systemctl reload nginx"

echo "✅ Klaar — https://schelpenfissa.com"
