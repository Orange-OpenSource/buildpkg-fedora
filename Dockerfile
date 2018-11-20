FROM fedora:latest
MAINTAINER Michel Decima <michel.decima@orange.com>

RUN dnf install -y -v \
        rpm-build rpmlint rpmdevtools dnf-plugins-core \
        git make automake gcc gcc-c++ kernel-devel \
        createrepo \
        fakeroot sudo \
        curl gnupg \
    && dnf clean all

COPY yum-add-gitlab /usr/bin/
RUN yum-add-gitlab Orange-OpenSource/gitlab-buildpkg-tools \
     && dnf install -y -v gitlab-buildpkg-tools \
     && dnf clean all 

RUN sed -i \
        -e 's|^metalink=|#metalink=|' \
        -e 's|^#baseurl=|baseurl=|' \
        /etc/yum.repos.d/*.repo \
    && dnf clean all


