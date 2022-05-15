# VaporRouteBuilder

Provide **SwiftUI Liked** Route syntax for Vapor using result builder.
This library provide only a tiny wrapper of @resultBuilder to allow
you to write ***declarative route***

For example, in vanilla vapor controller you might write like this:

```swift
struct TodoController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("todos")
        todos.get(use: index)
        
        let protected = todos.grouped(MyJWT.authenticator())
        protected.post(use: create)
        protected.group(":todoID") { todo in
            todo.delete(use: delete)
        }
    }
}
```

With **VaporRouteBuilder** you can write the following much more clean and explicit routing code:

```swift
struct TodoController: RouteCollection {
    var routes: [BuildableRoute] {
        Grouped("todo") {
            Get(use: index)
            Grouped(MyJWT.authenticator()) {
                Post { req -> HTTPResult in .ok }
                Grouped(":todoID") {
                    Deleted(use: delete)
                }
            }
        }
    }
}
```
