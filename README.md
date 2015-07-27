# Cyborg

Cyborg uses RoboVM to compile a Java project into a binary executable and then optionally wraps it into a suitable minimal Docker container.

You must create a [robovm.xml](http://docs.robovm.com/configuration.html) and run the commands in that directory.

## Dockerizing Java using RoboVM

This will by default produce an Ubuntu binary, but you can configure all that in [robovm.xml](http://docs.robovm.com/configuration.html)

http://docs.robovm.com/configuration.html


## Build an executable in the current directory

```
   docker run -ti -v $(pwd):/build sillelien/cyborg-builder  
```

## Build a Docker image from the current directory

This builds a working Docker image from the current directory based on  [sillelien/jess:master](https://registry.hub.docker.com/u/sillelien/jess/) - so they are pretty small.

```
   docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/build sillelien/cyborg-wrapper image-tag executable-name 
```
