FROM  ubuntu

MAINTAINER jgasper@unicon.net

# install slapd using debian unattended mode
RUN apt-get update && \
    echo 'slapd/root_password password password' | debconf-set-selections && \
    echo 'slapd/root_password_again password password' | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ldap-utils slapd

ADD init.ldif /
ADD users.ldif /

RUN service slapd start \
    && mkdir -p /var/ldap/example \
    && chown -R openldap /var/ldap \
    && ldapadd -Y EXTERNAL -H ldapi:/// -f init.ldif \
    && ldapadd -H ldapi:/// -f users.ldif -x -D "cn=admin,dc=example,dc=edu" -w password \
    && rm /*.ldif

EXPOSE 389

CMD slapd -h 'ldap:///' -g openldap -u openldap -d 0
