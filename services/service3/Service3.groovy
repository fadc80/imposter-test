package services.service3

import services.Service

class Service3 extends Service {
  def handle(script) {
    script.with {
      logger.info("Service handler: " + id())
      respond {
        withStatusCode(200) and()
        withFile("services/service3/data/default.json")
      }
    }
  }
  def id() {
    return "service3"
  }
}
