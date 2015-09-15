Simple 389-ds 
=============

This image is perfect if you need to spin-up a clean ldap image for testing. This is great for integration testing.

## Usage
Update the `users.ldif` file and then rebuild the image:

```
docker build --tag="jtgasper3/389ds-basic" .
```

To start a container:

```
docker run -d -p 10389:389 --name="ldap-server" jtgasper3/389ds-basic
```

To connect to the instance, point your favorite ldap browser to `localhost:10389` and connect with `cn=Directory Manager` and `password`.

Need to reset the ldap instance? Just stop and remove the container. Then start a new instance.
