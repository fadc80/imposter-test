package services.service1

import services.Service

class Service1 extends Service {
  def handle(script) {
    script.with {
      logger.info("Service handler: " + id())
      respond {
        withStatusCode(200) and()
        withFile("services/service1/data/default.json") 
      }
    }
  }
  def id() {
    return "service1"
  }
}
