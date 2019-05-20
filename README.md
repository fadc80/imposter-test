# Imposter-Test

## Requirements

* Bash Shell
* Java 8

## Cloning Repository

```shell
git clone git@github.com:fadc80/imposter-test.git
```

## Starting Imposter

```shell
cd imposter-test && docker run -ti -p 8443:8443 -v $(pwd):/opt/imposter/config fadc80/imposter-rest
```

## Invoking Sample Mock Services

```
wget --server-response -qO - http://localhost:8443/services/service1
wget --server-response -qO - http://localhost:8443/services/service2
wget --server-response -qO - http://localhost:8443/services/service3
```

>   HTTP/1.1 200 OK  
>  Content-Type: application/json  
>  Content-Length: 32  
> {  
>  "message": "Hello World!"  
> }  

## Adding New Mock Services

```
chmod +x test-setup.sh && ./test-setup.sh service4
```
