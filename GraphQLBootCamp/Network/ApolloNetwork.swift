//
//  ApolloNetwork.swift
//  GraphQLBootCamp
//
//  Created by Bhavin Thummar on 2024-09-30.
//

import Foundation
import Apollo
import ApolloWebSocket

// MARK: - Singleton ApolloNetwork

class ApolloNetwork {
    static let shared = ApolloNetwork()
    
    /// A web socket transport to use for subscriptions
    private lazy var webSocketTransport: WebSocketTransport = {
        let url = URL(string: "ws://localhost:4000/graphql")!
        let webSocketClient = WebSocket(url: url, protocol: .graphql_transport_ws)
        return WebSocketTransport(websocket: webSocketClient)
    }()
    
    /// An HTTP transport to use for queries and mutations
    private lazy var normalTransport: RequestChainNetworkTransport = {
        let url = URL(string: "http://localhost:4000/graphql")!
        return RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: self.store), endpointURL: url)
    }()
    
    
    /// cuatom interceptorProvider
    private lazy var interceptorProvider: NetworkInterceptorProvider = {
        let authPayloads = ["Authentication": "Bearer <Token>"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        
        let client = URLSessionClient(sessionConfiguration: configuration,
                                      callbackQueue: nil,
                                      sessionDescription: "Books Session")
        
        return NetworkInterceptorProvider(store: store, client: client)
    }()
    
    
    private lazy var customTransport: RequestChainNetworkTransport = {
        let url = URL(string: "http://localhost:4000/graphql")!
        return RequestChainNetworkTransport(interceptorProvider: interceptorProvider, endpointURL: url)
    }()
    
    
    /// A split network transport to allow the use of both of the above
    /// transports through a single `NetworkTransport` instance.
    private lazy var splitNetworkTransport = SplitNetworkTransport(
        uploadingNetworkTransport: self.normalTransport,
        webSocketNetworkTransport: self.webSocketTransport
    )
    
    /// Create a client using the `SplitNetworkTransport`.
    private(set) lazy var apolloClient  = ApolloClient(networkTransport: self.splitNetworkTransport, store: self.store)
    
    /// A common store to use for `normalTransport` and `client`.
    private lazy var store = ApolloStore()
}


class NetworkInterceptorProvider: InterceptorProvider {
    
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    
    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            // CustomInterceptor()
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}
