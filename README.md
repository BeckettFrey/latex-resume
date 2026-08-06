# Public Resume

![jsDelivr](https://img.shields.io/jsdelivr/gh/hm/beckettfrey/latex-resume?logo=jsdelivr) ![Docker](https://img.shields.io/badge/docker-ghcr.io%2Fxu--cheng%2Ftexlive--full-blue?logo=docker)

The compiled pdf is served through the jsDelivr CDN, which mirrors GitHub content on a global edge network:

```
https://cdn.jsdelivr.net/gh/beckettfrey/latex-resume@main/resume.pdf
```

jsDelivr caches files aggressively, so a freshly pushed `resume.pdf` would normally take up to 12 hours to appear at that url. To avoid the stale window, the [`purge-jsdelivr` workflow](.github/workflows/purge-jsdelivr.yml) runs on every push to `main` that touches `resume.pdf` and hits jsDelivr's purge endpoint:

```
https://purge.jsdelivr.net/gh/beckettfrey/latex-resume@main/resume.pdf
```

This evicts the cached copy, so the next request pulls the latest pdf from GitHub. The result: the CDN url above always serves the current resume with edge-cache performance.