def handle(script) {
  script.with {
    logger.info("Service handler: service1")
    respond {
      withStatusCode(200) and()
      withFile("services/service1/data/default.json") 
    }
  }
}
