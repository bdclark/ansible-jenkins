# Jenkins Ansible Role

[![Build Status](https://travis-ci.org/bdclark/ansible-jenkins.svg?branch=master)](https://travis-ci.org/bdclark/ansible-jenkins)

A no-nonsense role to install Jenkins via package (from repo or specific deb/RPM).

Requirements
------------
This role has been tested with the following versions of Ansible and operating systems:
- Ansible 2.5, 2.7
- Ubuntu 16.04, 18.04
- Centos 7.x

Role Variables
--------------
See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.

Dependencies
------------
This role does *not* install Java. A JRE/JDK must be installed before this role
is included/imported.

Example Playbook
----------------

```yaml
- hosts: jenkins
  become: yes

  vars:
    jenkins_home: /data/jenkins

  tasks:
    - name: install jre (debian)
      apt:
        name: openjdk-8-jre
        state: present
      when: ansible_os_family == 'Debian'

    - name: install jre (redhat)
      yum:
        name: java-1.8.0-openjdk
        state: present
      when: ansible_os_family == 'RedHat'

    - name: install jenkins
      include_role:
        name: jenkins
```
