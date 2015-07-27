# Cyborg
## Dockerizing Java using RoboVM

This will by default produce an Ubuntu binary, but you can configure all that in robovm.xml

http://docs.robovm.com/configuration.html
http://docs.robovm.com/advanced-topics/commandline.html


## Build an executable in the current directory

```
   docker run -ti -v $(pwd):/build sillelien/cyborg-builder -config robovm.xml 
```

## Build a Docker image from the current directory

This builds a working Docker image from the current directory based on `FROM scratch` - so they are small.

```
   docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/build sillelien/cyborg-wrapper image-tag executable-name -config robovm.xml 
```
