# syntax=docker/dockerfile:1
FROM scratch
COPY files/home/.claude/skills/cloudflare-dns /usr/share/cloudflare-dns-skill/cloudflare-dns
