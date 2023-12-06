# score-radius

Using [`score-helm`](https://github.com/score-spec/score-helm).

```bash
score-helm run \
	-f samples/hello-radius/score.yaml \
	-o score-helm-values.yaml
```

```bash
helm install \
	hello-radius \
	--repo https://score-spec.github.io/score-helm-charts \
	workload \
	--values score-helm-values.yaml
```

```bash
kubectl annotate deployment hello-radius "radapp.io/enabled=true"
```

```bash
kubectl rollout restart deployment hello-radius
```

```bash
kubectl port-forward svc/hello-radius 8080:8080
```

Ultimately (once the Helm chart support the annotation):
```bash
helm install \
	hello-radius \
	--repo https://score-spec.github.io/score-helm-charts \
	workload \
	--values score-helm-values.yaml \
	--set "annotations.radapp\.io/enabled=true" \
	--dry-run
```