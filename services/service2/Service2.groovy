package services.service2

import services.Service

class Service2 extends Service {
  def handle(script) {
    script.with {
      logger.info("Service handler: " + id())
      respond {
        withStatusCode(200) and()
        withFile("services/service2/data/default.json")
      }
    }
  }
  def id() {
    return "service2"
  }
}
