This will produce an Ubuntu binary, but you can configure all this in robovm.xml

http://docs.robovm.com/configuration.html
http://docs.robovm.com/advanced-topics/commandline.html

```
   docker run -ti -v $(pwd):/build sillelien/robo-builder -config robovm.xml 
```

