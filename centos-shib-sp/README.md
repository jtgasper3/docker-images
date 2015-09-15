## Overview
This Docker image contains a deployed Shibboleth SP 2.5.5 with Apache 2.4 running on the latest CentOS 7.

This image can be used as a base image overriding the configuration with local changes.

Port 443 is exposed for traffic.

### Using as a Base
This image is ideal for use as a base image for ones own deployment. 

For example, add your SP configurations to `./shibboleth-sp` and you app files to `./appfiles/`.

Next, assuming the Dockerfile is similar to this example:

```
FROM jtgasper3/centos-shib-sp

ADD /shibboleth-sp/ /etc/shibboleth-dp/
ADD /appfiles/ /var/www/http/ 
```

> This will take the base image that is available in the Docker repository and download it. Next, it overrides all of the base files with your local configuration.

The dependant image can be built by running:

```
docker build --tag="<org_id>/<image_name>".
```

Now, just execute the new image:

```
$ docker run -dP --name="app-local-test" <org_id>/<image_name> 
```

## Building

From source:

```
$ docker build --tag="org_id/shibboleth-idp" github.com/jtgasper3/docker-images/centos-shib-sp
```

## Author

  * John Gasper (<https://jtgasper.github.io>, <jgasper@unicon.net>, <jtgasper3@gmail.com>)

## References
The following references provided some form of guidence for this project:


## LICENSE

Copyright 2015 John Gasper

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.