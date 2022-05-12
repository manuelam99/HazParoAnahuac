//
//  VistaMadre.swift
//  HazParoAnahuac
//
//  Created by alumno on 12/05/22.
//

import SwiftUI

struct VistaMadre: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .loginPage:
            Login(viewRouter: viewRouter)
        case .regPage:
            Registrar(viewRouter: viewRouter)
        case .mainPage:
            NavegacionPrincipal(viewRouter: viewRouter)
        }
    }
    
}
