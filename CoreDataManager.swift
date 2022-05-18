//
//  CoreDataManager.swift
//  HazParoAnahuac
//
//  Created by alumno on 18/05/22.
//

import Foundation
import CoreData

class CoreDataManager
{
    let persistentContainer : NSPersistentContainer
    init()
    {
        persistentContainer = NSPersistentContainer(name: "DataModelo")
        persistentContainer.loadPersistentStores
        {
            (description,error) in
            if let error = error {
                fatalError("Error en Core Data Store \(error)")
            }
        }//fin persistenContainer
    }//fin init
    func updatePelicula()
    {
        do
        {
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
        }
    }//fin update
    func savePelicula(titulo: String)
    {
        let Pelicula = UserID(context: persistentContainer.viewContext)
        Pelicula.idusuario = titulo
        do
        {
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
        }
    }//fin save
    func deletePelicula(pelicula: UserID)
    {
        persistentContainer.viewContext.delete(pelicula)
        do
        {
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
        }
    }//fin delete
    func getAllPelculas() -> [UserID]
    {
        let fetchRequest: NSFetchRequest<UserID> = UserID.fetchRequest()
        do
        {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
    }//fin get all
}
