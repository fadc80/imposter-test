# Imposter-Test

Serving multiple mocks using a single [Imposter](https://github.com/outofcoffee/imposter) docker container.

## Requirements

* Bash Shell
* Java 8

## Cloning Repository

```shell
git clone https://github.com/fadc80/imposter-test.git
```

## Starting Imposter

```shell
cd imposter-test && docker run -ti -p 8443:8443 -v $(pwd):/opt/imposter/config fadc80/imposter-rest
```

## Invoking Sample Services

This project comes with three sample services:

| Name          | URL                                     |
|---------------|-----------------------------------------|
| **Service 1** | http://localhost:8443/services/service1 |
| **Service 2** | http://localhost:8443/services/service1 |
| **Service 3** | http://localhost:8443/services/service3 |


For example, to call Sevice 1:

```
wget --server-response -qO - http://localhost:8443/services/service1
``` 

**Output:**
>   HTTP/1.1 200 OK  
>  Content-Type: application/json  
>  Content-Length: 58  
> {  "serviceId": "service1", "message": "Hello World!" }  

## Adding New Services

New services can be added using a [template](template/service.groovy):

```
chmod +x template.sh && ./template.sh service4
```

That's all!
