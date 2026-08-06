# Docker Sandbox Kit - Cloudflare DNS management

This repo provides a [mix-in kit](https://docs.docker.com/ai/sandboxes/customize/kits/#mixin-kits) for [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) that makes it easy to query and manage DNS records in Cloudflare, even for users that don't know much about DNS.

Specifically, it does the following:

1. Inject a [SKILL.md](./files/home/.claude/skills/cloudflare-dns/SKILL.md) that informs the agent session that DNS management is being performed by Cloudflare.

2. Configure the sandbox to inject the `cloudflare-api` secret into all requests going to `api.cloudflare.com`

With this, a user can ask prompts such as:

```plaintext
Can you deploy this site on my home lab machine and make it available at home.example.com?

Can you have all requests for *.home.example.com go to my home lab?
```

## Getting started

1. Obtain an API token from Cloudflare ([docs here](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/))

2. Configure it as a `sbx` secret:

    ```bash
    sbx secret set -g cloudflare-api
    ```

    When prompted, enter the token you obtained.

    Alternatively, if you already keep the token in a host environment variable or file, bind it in your own `~/.config/sbx/credentials.yaml` instead:

    ```yaml
    bindings:
      cloudflare-api:
        discovery:
          - env: [CLOUDFLARE_API_TOKEN]
        allowedDomains:
          - api.cloudflare.com
    ```

3. Start a sandbox using this kit:

    ```bash
    sbx run claude --kit docker.io/mikesir87/sbx-kit-cloudflare-dns:latest
    ```

4. Query or ask for changes to your DNS records:

    ```bash
    Can you update test.example.com to point to the same location as stage.example.com?
    ```

