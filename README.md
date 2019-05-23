# Imposter-Test

Serving multiple mocks using a single [Imposter](https://github.com/outofcoffee/imposter) docker container.

## Requirements

* Bash Shell
* Java 8

## Cloning Repository

```shell
git clone https://github.com/fadc80/imposter-test.git && cd imposter-test
```

## Starting Imposter

```shell
docker run -ti -p 8443:8443 -v $(pwd):/opt/imposter/config fadc80/imposter-rest
```

## Invoking Sample Services

This project comes with three sample services:

| Name          | Script                                          | URL                                     |
|---------------|-------------------------------------------------|-----------------------------------------|
| **Service 1** | [code :eye:](services/service1/service1.groovy) | http://localhost:8443/services/service1 |
| **Service 2** | [code :eye:](services/service2/service2.groovy) | http://localhost:8443/services/service2 |
| **Service 3** | [code :eye:](services/service1/service3.groovy) | http://localhost:8443/services/service3 |


For example, to call Service 1:

```
wget --server-response -qO - http://localhost:8443/services/service1
``` 

**Output:**
>   HTTP/1.1 200 OK  
>  Content-Type: application/json  
>  Content-Length: 58  
> {  "serviceId": "service1", "message": "Hello World!" }  

## Adding New Services

New services can be added using a template [script](template/service.groovy) and [data](template/data/default.json):

```
chmod +x template.sh && ./template.sh service4
```

That's all!
