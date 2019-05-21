// Code generated from template.
def handle(global) {
  global.with {
    // Replace below code with your code. 
    // Inside this block all Imposter 
    // methods are available.
    logger.info("Service handler: service3")
    respond {
      withStatusCode(200) and()
      withFile("services/service3/data/default.json")
    }
  }
}
