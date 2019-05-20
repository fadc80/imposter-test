GroovyShell shell = new GroovyShell();

servicePool = shell.parse(new File(basePath() + "/ServicePool.groovy"))

service1 = shell.parse(new File(basePath() + "/service1/Service1.groovy"))
service2 = shell.parse(new File(basePath() + "/service2/Service2.groovy"))
service3 = shell.parse(new File(basePath() + "/service3/Service3.groovy"))
//<!--IMPORT-->

serviceList = [:]

servicePool.add("service1", service1, serviceList)
servicePool.add("service2", service2, serviceList)
servicePool.add("service3", service3, serviceList)
//<!--ADD-->

servicePool.dispatch(this, serviceList)

def basePath() {
  return "/opt/imposter/config/services/"
}


