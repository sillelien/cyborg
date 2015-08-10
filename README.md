# Cyborg

Cyborg uses RoboVM to compile a Java project into a binary executable and then optionally wraps it into a suitable minimal Docker container.

You must create a [robovm.xml](http://docs.robovm.com/configuration.html) and run the commands in that directory.

${BLURB}

## Dockerizing Java using RoboVM

This will by default produce an Ubuntu binary, but you can configure all that in [robovm.xml](http://docs.robovm.com/configuration.html)

http://docs.robovm.com/configuration.html


## Build an executable in the current directory

```
   docker run -ti -v $(pwd):/build sillelien/cyborg-builder:0.1  
```

[![Docker Registry](https://img.shields.io/docker/pulls/sillelien/cyborg-builder.svg)](https://registry.hub.docker.com/u/sillelien/cyborg-builder)

[![Image Layers](https://badge.imagelayers.io/sillelien/cyborg-builder.svg)](https://imagelayers.io/?images=sillelien/cyborg-builder:master 'Get your own badge on imagelayers.io') 

## Build a Docker image from the current directory

This builds a working Docker image from the current directory based on  [sillelien/jess:master](https://registry.hub.docker.com/u/sillelien/jess/) - so they are pretty small.

```
   docker run -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/build sillelien/cyborg-wrapper:0.1 image-tag executable-name 
```

[![Docker Registry](https://img.shields.io/docker/pulls/sillelien/cyborg-wrapper.svg)](https://registry.hub.docker.com/u/sillelien/cyborg-wrapper)

[![Image Layers](https://badge.imagelayers.io/sillelien/cyborg-wrapper.svg)](https://imagelayers.io/?images=sillelien/cyborg-wrapper:master 'Get your own badge on imagelayers.io') 


## Badges

[![Circle CI](https://circleci.com/gh/Sillelien/cyborg/tree/master.svg?style=svg)](https://circleci.com/gh/Sillelien/cyborg/tree/master)

[![GitHub License](https://img.shields.io/github/license/sillelien/cyborg.svg)](https://raw.githubusercontent.com/sillelien/cyborg/master/LICENSE)

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/cyborg.svg)](https://github.com/sillelien/cyborg/issues)

${FOOTER}