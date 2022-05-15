//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public struct Get<T: AsyncResponseEncodable>: RouteBuildable {

    typealias Result = T

    public var route: BuildableRoute

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        route = { builder in
            builder.on(.GET, path, use: handler)
        }
    }
}

public struct Post<T: AsyncResponseEncodable>: RouteBuildable {

    typealias Result = T

    public var route: BuildableRoute

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        route = { builder in
            builder.on(.POST, path, use: handler)
        }
    }
}

public struct Put<T: AsyncResponseEncodable>: RouteBuildable {

    typealias Result = T

    public var route: BuildableRoute

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        route = { builder in
            builder.on(.PUT, path, use: handler)
        }
    }
}

public struct Patch<T: AsyncResponseEncodable>: RouteBuildable {

    typealias Result = T

    public var route: BuildableRoute

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        route = { builder in
            builder.on(.PATCH, path, use: handler)
        }
    }
}

public struct Delete<T: AsyncResponseEncodable>: RouteBuildable {

    typealias Result = T

    public var route: BuildableRoute

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        route = { builder in
            builder.on(.DELETE, path, use: handler)
        }
    }
}
