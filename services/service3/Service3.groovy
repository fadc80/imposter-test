def handle(global) {
  global.with {
    logger.info("Service handler: service3")
    respond {
      withStatusCode(200) and()
      withFile("services/service3/data/default.json")
    }
  }
}
