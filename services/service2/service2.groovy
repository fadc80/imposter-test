// Code generated from template
def handle(global) {
  global.with {
    // Replace below code with your code. 
    // Inside this block all Imposter 
    // methods are availible.
    logger.info("Service handler: service2")
    respond {
      withStatusCode(200) and()
      withFile("services/service2/data/default.json")
    }
  }
}
