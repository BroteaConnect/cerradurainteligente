# Cerradura Inteligente

Landing page for smart locks (fingerprint, keypad and WiFi/app models):
keyless security for homes and businesses. Generated from Brotea's
`landing-astro` template and redesigned with original copy.

## Configuration
- `PUBLIC_REQUIREMENTS_ENDPOINT` — URL that receives the form's JSON POST
  (`{project, source, submitted_by, content}` → requirements table).
  Defaults to `https://api.brotea.dev/requirements`; the Dockerfile exposes
  it as a build ARG since Astro inlines it at build time.

## Commands
- `npm install` · `npm run dev` · `npm run build` (output in `dist/`)

## Deploy
Built and served via the multi-stage `Dockerfile` (Astro build → nginx
serving `dist/`). Deployed to production at
https://cerradurainteligente.brotea.dev.
