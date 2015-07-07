ebs-snapshot cookbook
=====================

Simple cookbook to configure EBS snapshot script on an instance at Amazon OpsWorks environment

# Usage

In custom layer, must add ebs-snapshot recipes to Setup stage:

**Setup**
ebs-snapshot

# Attributes

It custom JSON data need to define access_key and secret_access_key, for example
```
{
  "ebs-snapshot" : {
    "access_key" : "xxxxxxxxxxxxx",
    "secret_access_key" : "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
  }
}
```