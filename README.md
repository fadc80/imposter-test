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

```
wget --server-response -qO - http://localhost:8443/services/service1
wget --server-response -qO - http://localhost:8443/services/service2
wget --server-response -qO - http://localhost:8443/services/service3
```  

## Adding New Mock Services

```
chmod +x template.sh && ./template.sh service4
```
