{{/* The fully-qualified name: release plus chart, truncated to what Kubernetes
     allows for a name, with the trailing dash a truncation can leave behind. */}}
{{- define "app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Labels every object in this chart carries. */}}
{{- define "app.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* The stable subset, and the only one a selector may use. A Deployment's
     selector is immutable, so a label that changes -- the version, most
     obviously -- would make the next upgrade after a chart bump impossible. */}}
{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
