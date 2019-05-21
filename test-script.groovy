import groovy.io.FileType

def services = [:]

// Loading service scripts
new File(basePath()).eachDir() { 
  dir -> dir.eachFile(FileType.FILES) { 
    file -> services.put(dir.getName(), 
      parse(file.getAbsolutePath()))
  }
}

// Extracting service id
def id = new URL(context.request.uri)
  .getPath().split("/")[2]; 

// Dispatching request
if (services.containsKey(id)) {
  services.get(id).handle(this)
} else {
  logger.error("Unknown Service: " + id)
  respond { 
    withStatusCode(500) 
  }
}

def parse(path) {
  return new GroovyShell().parse(new File(path))
}

def basePath() {
  return "/opt/imposter/config/services"
}
