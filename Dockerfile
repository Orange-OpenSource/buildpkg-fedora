FROM fedora:latest
MAINTAINER Michel Decima <michel.decima@orange.com>

RUN dnf install -y -v \
        rpm-build rpmlint rpmdevtools dnf-plugins-core \
        git make automake gcc gcc-c++ kernel-devel \
        createrepo \
        fakeroot sudo \
        curl gnupg \
    && dnf clean all

RUN yum-add-gitlab orange-opensource/gitlab-buildpkg-tools \
     && dnf install -y -v gitlab-buildpkg-tools \
     && dnf clean all \
     || true

