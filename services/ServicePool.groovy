package services

import java.net.*
import java.io.*

class ServicePool {
  def script
  def services
  ServicePool(script) {
    this.script = script
    this.services = [:]
  }
  def add(Service service) {
    services.put(service.id(), service)
  }
  def dispatch() {
    def id = findServiceId();
    if (services.containsKey(id)) {
      services.get(id).handle(script)
    } else {
      script.with {
        logger.error("Unknown Service: " + id)
        respond {
          withStatusCode(500)
        }
      }
    }
  }
  def findServiceId() {
    return findServiceUrl().getPath().split("/")[serviceIdIndex()]
  }
  def findServiceUrl() {
    return new URL(script.context.request.uri)
  }
  def serviceIdIndex() {
    return 2
  }
}
