//
//  HazParoAnahuacApp.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

@main
struct HazParoAnahuacApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            VistaMadre(viewRouter: ViewRouter())
        }
    }
}
