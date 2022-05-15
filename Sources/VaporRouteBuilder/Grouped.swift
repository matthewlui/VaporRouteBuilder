//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public struct Grouped: RouteBuildable {

    public var route: BuildableRoute

    public init(middleware: [Middleware], @RouteBuilder routesBuilder: @escaping () -> [BuildableRoute]) {
        route = { builder in
            let grouped = builder.grouped(middleware)
            _ = routesBuilder().map({ $0(grouped) })
        }
    }

    public init(_ path: PathComponent..., @RouteBuilder routesBuilder: @escaping () -> [BuildableRoute]) {
        route = { builder in
            let grouped = builder.grouped(path)
            _ = routesBuilder().map { $0(grouped) }
        }
    }
}
