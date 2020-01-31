# Kubernetes CDN deployment

You will deploy whole CDN services by the kubeconfig files under this directory.
Please follow the proceduces as below.

### Deployment

1. build the images
need to build RPMs and docker images by docker-compose file

```
// at the directory of this repo 
$ cd infrastructure/cdn-in-a-box

// build RPMs, only need to build once, no need to build everytime if there is not code pushed 
$ make

// build docker
$ docker-compose -f docker-compose.k8s.yml build

```

2. create namespace

under this directory

```
$ kubectl create -f namespace.yml
```

3. create volume

need to setup NFS by yourself and create pv and pvc pairs

```
$ kubectl create -f pvc.yml
```

4. create environment variables info
```
// changed to the settings in our k8s cluster
$ kubectl create -f env.yml
```

5. finally, creat CDN components

```
$ kubectl create -f cdn.yml
```
