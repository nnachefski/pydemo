source $BASE/install/env.conf

$OC_CLIENT new-project custom-images

$OC_CLIENT apply -f buildah-task.yaml
$OC_CLIENT apply -f ocp4kit-git-pr.yaml
$OC_CLIENT apply -f s2i-base-git-pr.yaml
$OC_CLIENT apply -f ubi8-custom-dest-image-pr.yaml
$OC_CLIENT apply -f s2i-custom-core-dest-image-pr.yaml
$OC_CLIENT apply -f custom-s2i-chain-pl.yaml
