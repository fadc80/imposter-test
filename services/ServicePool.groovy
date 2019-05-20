def add(serviceId, service, serviceList) {
  serviceList.put(serviceId, service)
}

def dispatch(global, serviceList) {
  def id = serviceId(global.context.request.uri);
  if (serviceList.containsKey(id)) {
    serviceList.get(id).handle(global)
  } else {
    global.with {
      logger.error("Unknown Service: " + id)
      respond {
        withStatusCode(500)
      }
    }
  }
}

def serviceId(uri) {
  return new URL(uri).getPath().split("/")[2]
}
