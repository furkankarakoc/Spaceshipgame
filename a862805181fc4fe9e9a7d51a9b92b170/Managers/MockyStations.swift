//
//  MockyStations.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by furkan on 11.05.2022.
//

import Foundation
import UIKit

enum ApiError: Error {
    case fetchDataFail
}

class MockyStations {
    
    static let shared = MockyStations()
    
    static var stations: [Station]? = []
    static var stationCount = 0
    
    static var currentX = 0.0
    static var currentY = 0.0
    
    func getStations(completion: @escaping (Result<[Station], Error>) -> Void) {
        
        let url = URL(string: "https://run.mocky.io/v3/e7211664-cbb6-4357-9c9d-f12bf8bab2e2")!
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse as Any)
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }

            do {
                let result = try JSONDecoder().decode([Station].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.fetchDataFail))
            }
        }
        
        task.resume()
    }
    
    func calculateDistance() -> Int {
        
        guard let stations = MockyStations.stations else {
            return 0
        }
        
        let point = CGPoint(x: MockyStations.currentX, y: MockyStations.currentY)
        
        let targetX = stations[MockyStations.stationCount].coordinateX
        let targetY = stations[MockyStations.stationCount].coordinateY
        
        let distance = point.CGPointDistance(to: CGPoint(x: targetX, y: targetY))
        
        print(distance)
        
        return Int(distance)
    }
}
