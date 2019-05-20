def handle(global) {
  global.with {
    logger.info("Service handler: service2")
    respond {
      withStatusCode(200) and()
      withFile("services/service2/data/default.json")
    }
  }
}
