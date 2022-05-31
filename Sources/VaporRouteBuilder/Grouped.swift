//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public struct Grouped: RouteCollection {

    public var route: BuildableRoute

    public init(middleware: [Middleware], @RouteBuilder routesBuilder: @escaping () throws -> [RouteCollection]) {
        route = { builder in
            let grouped = builder.grouped(middleware)
            _ = try routesBuilder().map { try $0.boot(routes: grouped) }
        }
    }

    public init(middleware: Middleware..., @RouteBuilder routesBuilder: @escaping () throws -> [RouteCollection]) {
        route = { builder in
            let grouped = builder.grouped(middleware)
            _ = try routesBuilder().map { try $0.boot(routes: grouped) }
        }
    }

    public init(_ path: PathComponent..., @RouteBuilder routesBuilder: @escaping () throws -> [RouteCollection]) {
        route = { builder in
            let grouped = builder.grouped(path)
            _ = try routesBuilder().map { try $0.boot(routes: grouped) }
        }
    }

    public func boot(routes: RoutesBuilder) throws {
        try self.route(routes)
    }
}
