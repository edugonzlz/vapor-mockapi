//
//  Mockable.swift
//  App
//
//  Created by José Estela on 9/7/18.
//

import Foundation
import Vapor

protocol Mockable {
    
    var method: HTTPMethod { get }
    var path: String { get }
    
    func addRoute(to router: Router) throws
    func handleResponse(_ req: Request) throws -> Future<Response>
}

extension Mockable {
    
    func addRoute(to router: Router) throws {
        router.on(self.method, at: self.path, use: handleResponse)
    }
}

