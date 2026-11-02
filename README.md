# Local JSON Editor

A single-page JSON formatter/editor that runs entirely in your browser. No build step, no
dependencies to install, no backend — just serve `index.html`.

Left pane: raw JSON code (Ace editor). Right pane: the same document as a JSONEditor tree.
Type or paste JSON on the left and the tree on the right updates live; invalid JSON while you
type is simply ignored.

![Local JSON Editor](jsoneditor-20261102-154509.png)

## Files

| File | Purpose |
| --- | --- |
| `index.html` | The whole app (HTML + CSS + JS). JSONEditor is loaded from jsDelivr CDN. |
| `Dockerfile` | `nginx:alpine` serving `index.html` |
| `scripts/build.sh` | Builds the Docker image |

Because the editor library comes from a CDN, the browser needs internet access on first load.
Everything you paste stays in your own browser tab — there is no server-side processing.

## Run with a simple Python server

```bash
python3 -m http.server 8000
```

Then open <http://localhost:8000>.

(Any static file server works: `python3 -m http.server`, `npx serve`, `php -S localhost:8000`, etc.
Opening `index.html` directly with `file://` also mostly works, but serving over HTTP is recommended.)

## Run with Docker

Build:

```bash
docker build -t jsoneditor:latest .
```

or use the helper script:

```bash
./scripts/build.sh
# IMAGE_NAME=myeditor IMAGE_TAG=dev ./scripts/build.sh
```

Run:

```bash
docker run -d -p 8080:80 --name jsoneditor jsoneditor:latest
```

Then open <http://localhost:8080>.

Stop and remove:

```bash
docker rm -f jsoneditor
```
