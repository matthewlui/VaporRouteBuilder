//
// Created by Matthew Lui on 15/5/2022.
//

import Vapor

public struct On<T: AsyncResponseEncodable>: RouteCollection {

    let method: HTTPMethod
    let path: [PathComponent]
    let body: HTTPBodyStreamStrategy
    let handler: (Request) async throws -> T

    public init(
        _ method: HTTPMethod,
        _ path: PathComponent...,
        body: HTTPBodyStreamStrategy = .collect,
        handler: @escaping (Request) async throws -> T
    ) {
        self.method = method
        self.path = path
        self.body = body
        self.handler = handler
    }

    public func boot(routes: RoutesBuilder) throws {
        routes.on(method, path, body: body, use: handler)
    }
}

public struct Get<T: AsyncResponseEncodable>: RouteCollection {

    let path: [PathComponent]
    let handler: (Request) async throws -> T

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        self.path = path
        self.handler = handler
    }

    public func boot(routes: RoutesBuilder) throws {
        routes.on(.GET, path, use: handler)
    }
}

public struct Post<T: AsyncResponseEncodable>: RouteCollection {

    let path: [PathComponent]
    let handler: (Request) async throws -> T

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        self.path = path
        self.handler = handler
    }

    public func boot(routes: RoutesBuilder) throws {
        routes.on(.POST, path, use: handler)
    }
}

public struct Put<T: AsyncResponseEncodable>: RouteCollection {

    let path: [PathComponent]
    let handler: (Request) async throws -> T

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        self.path = path
        self.handler = handler
    }

    public func boot(routes: RoutesBuilder) throws {
        routes.on(.PUT, path, use: handler)
    }
}

public struct Patch<T: AsyncResponseEncodable>: RouteCollection {

    let path: [PathComponent]
    let handler: (Request) async throws -> T

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        self.path = path
        self.handler = handler
    }

    public func boot(routes: RoutesBuilder) throws {
        routes.on(.PATCH, path, use: handler)
    }
}

public struct Delete<T: AsyncResponseEncodable>: RouteCollection {

    let path: [PathComponent]
    let handler: (Request) async throws -> T

    public init(_ path: PathComponent..., handler: @escaping (Request) async throws -> T) {
        self.path = path
        self.handler = handler
    }

    public func boot(routes: RoutesBuilder) throws {
        routes.on(.DELETE, path, use: handler)
    }
}
