//
//  StationCoreData.swift
//  a862805181fc4fe9e9a7d51a9b92b170
//
//  Created by furkan on 11.05.2022.
//

import Foundation
import UIKit
import CoreData


class StationCoreData {

    enum DatabasError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }

    static let shared = StationCoreData()


    func addFovorite(name: String, eus: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        print("dababase path \(appDelegate.persistentContainer.persistentStoreDescriptions.first?.url)")
        
        

        let item = FavStation(context: context)

        item.name = name
        item.eus = Int32(eus)

        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
    }

    func getCardInfo(completion: @escaping (Result<[FavStation], Error>) -> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext

        let request: NSFetchRequest<FavStation>

        request = FavStation.fetchRequest()

        do {

            let titles = try context.fetch(request)
            completion(.success(titles))

        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
    
    func clearCardInfo(completion: @escaping (Result<Void, Error>)-> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
    
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<FavStation>

        request = FavStation.fetchRequest()
        
        do {
            let itemArray = try context.fetch(request)
            for item in itemArray {
                context.delete(item)
            }
        } catch {
            print("Error fetching data from context \(error)")
        }

        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToDeleteData))
        }
    }

    func deleteCardInfo(name: String, completion: @escaping (Result<Void, Error>)-> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
    
        let context = appDelegate.persistentContainer.viewContext
        
        
        let request : NSFetchRequest<FavStation> = FavStation.fetchRequest()

        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        
        request.predicate = predicate
        
        do {
            let itemArray = try context.fetch(request)
            
//            for item in itemArray {
//                context.delete(item)
//            }
            
            context.delete(itemArray[0])
            
        } catch {
            print("Error fetching data from context \(error)")
        }

        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToDeleteData))
        }

    }
}

