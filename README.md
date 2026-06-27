# Schelpenfissa

Promo one-pager voor **Schelpenfissa** — jaarlijks strandfeest op het strand van Muiderberg, **15 augustus 2026**.

Statische site (HTML/CSS/JS, geen build-stap). Beeld, logo en hero-video zijn AI-gegenereerd via Higgsfield.

## Structuur

```
public/            ← web-root (wat nginx serveert)
  index.html
  assets/          logo.svg, hero.png/.webp, hero.mp4, g1–g4.webp
  robots.txt
  sitemap.xml
insta/             ← Instagram-posts (NIET online; alleen bron)
deploy.sh          ← één-commando deploy naar de VPS
```

## Deploy

```bash
./deploy.sh
```

Transfer `public/` naar `root@187.124.0.172:/srv/apps/schelpenfissa/public`, chown en `nginx reload`.

## Hosting

- VPS: `/srv/apps/schelpenfissa/` (AlmaLinux, nginx static)
- Domein: `schelpenfissa.com` (Cloudflare DNS-only → 187.124.0.172)
- TLS: Let's Encrypt (certbot)
- nginx: `/etc/nginx/conf.d/schelpenfissa.conf`
