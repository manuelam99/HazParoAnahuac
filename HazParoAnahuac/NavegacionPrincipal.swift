//
//  NavegacionPrincipal.swift
//  HazParoAnahuac
//
//  Created by alumno on 03/05/22.
//

import SwiftUI

struct NavegacionPrincipal: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        TabView{
            FeedFavores()
                .tabItem{Image(systemName: "list.bullet.rectangle")}
            MisParos()
                .tabItem{Image(systemName: "checkmark.circle.fill")}
            Perfil()
                .tabItem{Image(systemName: "person.fill")}
            Mapa().environmentObject(MapModel())
                .tabItem{Image(systemName: "map.fill")}
        }
    }
}

struct NavegacionPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        NavegacionPrincipal(viewRouter: ViewRouter())
    }
}
