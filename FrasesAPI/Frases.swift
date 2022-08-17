//
//  Frases.swift
//  FrasesAPI
//
//  Created by Juan Cruz on 16/08/2022.
//

import Foundation


//Model en base al JSON de la API

struct Frases : Decodable {
    var id: String
    var icon_url: String 
    var value: String
}
