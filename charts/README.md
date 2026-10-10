# charts/

This directory is where the Helm lab's chart lands.

The lab has you write a chart in your workspace. Its last step copies it here:

```bash
mkdir -p charts && cp -r "$lab/work/chart" charts/app
git add charts/app && git commit -m "Add the web chart" && git push
```

ArgoCD does **not** need a packaged chart. Point an `Application` at `charts/app`, and
because the directory holds a `Chart.yaml` it is rendered with Helm on every sync.

Until you have run the Helm lab, this directory has nothing in it but this file — and an
`Application` pointing here will say so plainly rather than failing mysteriously.
