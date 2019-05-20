package services

abstract class Service {
  abstract def handle(script)
  abstract def id()
}
