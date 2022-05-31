//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public protocol RouteCollectionBuild: RouteCollection {
    @RouteBuilder var routes: [RouteCollection] { get }
}

public extension RouteCollectionBuild {
    public func boot(routes: RoutesBuilder) throws {
        try self.routes.forEach { try $0.boot(routes: routes) }
    }
}
