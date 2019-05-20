import services.ServicePool
import services.service1.Service1
import services.service2.Service2
import services.service3.Service3
//<!--IMPORT-->

def services = new ServicePool(this)

services.add(new Service1())
services.add(new Service2())
services.add(new Service3())
//<!--ADD-->

services.dispatch() 
