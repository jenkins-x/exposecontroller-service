# Exposecontroller Service

This chart runs `exposecontroller` as a long running process which is ideal for Development or using in your Edit environment in Jenkins X.

Otherwise its probably simpler to just run the regular `exposecontroller` chart which fires a job each time you install/update a helm chart.

This service requires an `exposecontroller ConfigMap` to be setup with the rules to use.