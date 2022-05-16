//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public struct On<T: AsyncResponseEncodable>: RouteBuildable {

    typealias Result = T

    public var route: BuildableRoute

    public init(
        _ method: HTTPMethod,
        _ path: [PathComponent],
        body: HTTPBodyStreamStrategy = .collect,
        handler: @escaping (Request) async throws -> T
    ) {
        route = { builder in
            let responder = AsyncBasicResponder { request in
                if case .collect(let max) = body, request.body.data == nil {
                    _ = try await request.body.collect(max: max?.value ?? request.application.routes.defaultMaxBodySize.value).get()
                }
                return try await closure(request).encodeResponse(for: request)
            }
            let route = Route(
                method: method,
                path: path,
                responder: responder,
                requestType: Request.self,
                responseType: Response.self
            )
            builder.add(route)
        }
    }
}

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
