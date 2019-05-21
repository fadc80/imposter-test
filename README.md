# Imposter-Test

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

## Invoking Sample Mock Services

**Sample service1** [[code here :eyes:]](services/service1/service1.groovy)
```
wget --server-response -qO - http://localhost:8443/services/service1
``` 
**Output:**
>   HTTP/1.1 200 OK  
>  Content-Type: application/json  
>  Content-Length: 58  
> {  "serviceId": "service1", "message": "Hello World!" }  

**Sample service2** [[code here :eyes:]](services/service2/service2.groovy)
```
wget --server-response -qO - http://localhost:8443/services/service2
```
**Output:**
>   HTTP/1.1 200 OK  
>  Content-Type: application/json  
>  Content-Length: 58  
> { "serviceId": "service2", "message": "Hello World!" }

**Sample service3** [[code here :eyes:]](services/service3/service3.groovy)
```
wget --server-response -qO - http://localhost:8443/services/service3
```
**Output:**
>   HTTP/1.1 200 OK  
>  Content-Type: application/json  
>  Content-Length: 58  
> { "serviceId": "service3", "message": "Hello World!" }

## Adding New Mock Services

```
chmod +x template.sh && ./template.sh service4
```
