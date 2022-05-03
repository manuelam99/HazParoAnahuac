//
//  NavegacionPrincipal.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct NavegacionPrincipal: View {
    var body: some View {
        TabView{
            Text("Favores")
                .tabItem{Image(systemName: "list.bullet.rectangle")}
            Text("Mis Paros")
                .tabItem{Image(systemName: "person.fill")}
            Text("Perfil")
                .tabItem{Image(systemName: "person.fill")}
            Text("Mapa")
                .tabItem{Image(systemName: "person.fill")}
        }
    }
}

struct NavegacionPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        NavegacionPrincipal()
    }
}
