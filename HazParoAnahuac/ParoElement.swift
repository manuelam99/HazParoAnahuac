//
//  ParoElement.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import Foundation

// MARK: - ParoElement
struct ParoElement: Codable, Identifiable {
    let id, definicion, tipo: String
    let precio: Int
    let solicitante, ejecutor, deDonde, aDonde: String
    let comentario: String
    let estatus: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case definicion, tipo, precio, solicitante, ejecutor
        case deDonde = "de_donde"
        case aDonde = "a_donde"
        case comentario, estatus
    }
}

typealias Paro = [ParoElement]

struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [ParoElement]
}
