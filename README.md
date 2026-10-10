# k8s4apps-gitops-demo

The GitOps demo repository for the **k8s4apps** course. ArgoCD reads this repository;
students write to their own branch of it.

## Branches

`main` is the read side — the starting state, and the reference answer. Every student
gets a branch called `student-<username>`, created from `main` and never merged back.

Their branch is the write side, and it is where the loop closes: change a manifest, push,
and watch ArgoCD make the cluster match. Deploy keys are per-student and write-scoped,
so one student cannot push to another's branch by accident.

`make gitops-demo` creates the branches and the keys, and `TEARDOWN=1 make gitops-demo`
removes them at the end of a course.

## What is in here

```
chart/                 the Helm chart you write in the Helm lab (empty until you do)
apps/guestbook/        the same application, delivered with kustomize instead
apps/guestbook-scaled/ the same, with kustomize overlays
values-prod.yaml       per-environment overrides for the chart
```

`chart/` is where you work, and it is deliberately empty at the start. The Helm lab
has you create `Chart.yaml`, `values.yaml` and `templates/` in it, the way you would
lay out any chart: the chart is the root of its own directory, not a subdirectory of
a `charts/` folder.

## The two labs

**The Helm lab** has each student write the chart directly in `chart/` on their branch
and push it. There is no copy step: the chart is written where it will be read from.

**The ArgoCD lab** points an `Application` at `chart`. ArgoCD sees the `Chart.yaml`,
renders the chart, and applies it — so the artifact the student packaged in one lab is
the artifact delivered in the next one, with no build step in between.
