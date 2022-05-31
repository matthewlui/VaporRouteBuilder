//
// Created by Matthew Lui on 14/5/2022.
//

import Vapor

public typealias BuildableRoute = (RoutesBuilder) throws -> Void

@resultBuilder
public struct RouteBuilder {
    public static func buildBlock(_ components: RouteCollection...) -> [RouteCollection] {
        components
    }
}
