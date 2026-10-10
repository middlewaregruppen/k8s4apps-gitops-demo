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
chart/                 the reference chart: what the Helm lab builds, finished
values-prod.yaml       per-environment overrides, as the lab leaves them
apps/guestbook/        the same application, delivered with kustomize instead
apps/guestbook-scaled/ the same, with kustomize overlays
```

`chart/` on `main` is the **finished** chart the Helm lab has you write. It is here as
a reference, not as a starting point: the lab creates `chart/` from nothing, and its
checkpoints require *your* chart to work, so copying this one would pass them without
teaching you anything.

If your chart renders something you cannot explain, diff it against this one. The
shape is the point: the chart is the root of its own directory, with `Chart.yaml`
directly inside it, not a subdirectory of a `charts/` folder.

This is a second copy of what `labs/helm/steps.md` builds. If the lab changes, this
should be re-generated from it rather than edited independently -- otherwise the
reference stops being one.

## The two labs

**The Helm lab** has each student write the chart directly in `chart/` on their branch
and push it. There is no copy step: the chart is written where it will be read from.

**The ArgoCD lab** points an `Application` at `chart`. ArgoCD sees the `Chart.yaml`,
renders the chart, and applies it — so the artifact the student packaged in one lab is
the artifact delivered in the next one, with no build step in between.
