//
// Created by Matthew Lui on 14/5/2022.
//

import Vapor

public typealias BuildableRoute = (RoutesBuilder) -> Void

@resultBuilder
public struct RouteBuilder {
    public static func buildBlock(_ components: RouteBuildable...) -> [BuildableRoute] {
        components.map(\.route)
    }
}
