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
apps/guestbook/        the reference application — a Deployment, a Service, a ConfigMap
apps/guestbook-scaled/ the same, with kustomize overlays
charts/app/            where the Helm lab's chart lands (see charts/README.md)
```

## The two labs

**The Helm lab** ends by copying the chart a student has just written into `charts/app/`
on their branch and pushing it.

**The ArgoCD lab** points an `Application` at that path. ArgoCD sees the `Chart.yaml`,
renders the chart, and applies it — so the artifact the student packaged in one lab is
the artifact delivered in the next one, with no build step in between.
