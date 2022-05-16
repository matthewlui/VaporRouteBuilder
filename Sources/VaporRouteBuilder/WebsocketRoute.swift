//
// Created by Matthew Lui on 16/5/2022.
//

import Vapor

struct WebSocket: RouteBuildable {
    public var route: BuildableRoute

    public init(_ path: PathComponent...,
                maxFrameSize: WebSocketMaxFrameSize = .`default`,
                shouldUpgrade: @escaping ((Request) -> EventLoopFuture<HTTPHeaders?>) = {
                    $0.eventLoop.makeSucceededFuture([:])
                },
                onUpgrade: @escaping (Request, WebSocket) -> ()
    ) {
        route = { builder in
            builder.on(.GET, path) { (request: Request) -> Response in
                request.webSocket(maxFrameSize: maxFrameSize, shouldUpgrade: shouldUpgrade, onUpgrade: onUpgrade)
            }
        }
    }
}
