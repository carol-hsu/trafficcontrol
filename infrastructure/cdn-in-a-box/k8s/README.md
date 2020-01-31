## Kubernetes CDN deployment

You will deploy whole CDN services by the kubeconfig files under this directory.
Please follow the proceduces as below.

**WARNING: Be careful to build RPMs and docker images based on correct branch, using them respectively for different senarios.**

### Deployment

1. **Build the images**
need to build RPMs and docker images by docker-compose file

```
// at the directory of this repo, should be 'cd ../' if you are in current directory
$ cd infrastructure/cdn-in-a-box

// build RPMs, only need to build once, no need to build everytime if there is not code pushed 
$ make

// build images, build 13 images for you
$ docker-compose -f kubecdn.yml build

```

Or, if you change specific components, want to rebuild the image, you can do so

```
// without using cached image layer, and designate the name of image
$ docker-compose -f kubecdn.yml build --no-cache CONTAINER_NAME_IN_COMPOSE_FILE

```

* Next, you may need to tag the images and push them to private docker registry in k8s cluster.

2. **Create namespace**

Under current directory

```
$ kubectl create -f namespace.yml
```

3. Create volume

Need to setup NFS by yourself and create pv and pvc pairs

```
// change the path and endpoint of NFS respectively in pvc.yml
$ kubectl create -f pvc.yml
```

4. Create environment variables info, which is somehow the same content with ../variables.env
```
// changed to the settings in our k8s cluster
$ kubectl create -f env.yml
```

5. finally, creat CDN components

Change the image paths in the YAML first

```
// create the dns server first
$ kubectl create -f dns.yml

// check the dns server, if showing following logs, the good to fire the rest components
// 31-Jan-2020 17:30:56.872 reloading configuration succeeded
// 31-Jan-2020 17:30:56.872 reloading zones succeeded
// 31-Jan-2020 17:30:56.884 all zones loaded
// 31-Jan-2020 17:30:56.884 running

// create the other components
$ kubectl create -f cdn.yml
```

### Function verification

* After booting up CDN, check `enroller` to see if the system is ready, sould looks like following
```
: (watching several directory)
INFO: enroller.go:737: 2020-01-31T17:46:25.856454779Z: watching /shared/enroller/regions
INFO: enroller.go:737: 2020-01-31T17:46:25.859179788Z: watching /shared/enroller/types
INFO: enroller.go:737: 2020-01-31T17:46:25.862071602Z: watching /shared/enroller/cachegroups
INFO: enroller.go:737: 2020-01-31T17:46:25.864629516Z: watching /shared/enroller/profiles
INFO: enroller.go:737: 2020-01-31T17:46:25.867390309Z: watching /shared/enroller/deliveryservice_servers
INFO: enroller.go:737: 2020-01-31T17:46:25.870387666Z: watching /shared/enroller/phys_locations
INFO: enroller.go:737: 2020-01-31T17:46:25.873428846Z: watching /shared/enroller/users
INFO: enroller.go:881: 2020-01-31T17:46:25.876019841Z: Created enroller-started
```

### Reboot CDN 

* Remember to clean up the volume/physical files on disk creating by components, checking your pvc.yml for the locations

