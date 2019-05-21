def handle(global) {
  global.with {
    logger.info("Service handler: <!--SERVICE-->")
    respond {
      withStatusCode(200) and()
      withFile("services/<!--SERVICE-->/data/default.json")
    }
  }
}
