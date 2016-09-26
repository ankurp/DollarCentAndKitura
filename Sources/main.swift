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
