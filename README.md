# Kitura using Dollar and Cent library

Example project showing how to integrate Dollar and Cent library into Kitura Web App

## Setup

1. `swift build`
2. `.build/debug/Server`
3. `open http://localhost:8090`


## Code

```swift
import Kitura
import HeliumLogger
import Dollar
import Cent

HeliumLogger.use()

let router = Router()

router.get("/") {
    request, response, next in

    let greeting = { (words: String...) -> String in
        "\(words[0]) \(words[1]) from \(words[2])"
    }
    let helloWorld = $.partial(greeting, "Hello", "World")

    response.send(helloWorld("Swift").kebabCase)

    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
```
