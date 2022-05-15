//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public protocol RouteCollectionBuild: RouteCollection {
    @RouteBuilder var routes: [BuildableRoute] { get }
}

public extension RouteCollectionBuild {
    public func boot(routes: RoutesBuilder) throws {
        self.routes.forEach { $0(routes) }
    }
}
