//
//  Mapa.swift
//  HazParoAnahuac
//
//  Created by alumno on 04/05/22.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct Mapa: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.4006, longitude: -99.264), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var empireStateBuilding =
    Place(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656))
    
    var body: some View {
      NavigationView {
        Map(coordinateRegion: $region, annotationItems: [empireStateBuilding]) { place in
          MapAnnotation(coordinate: place.coordinate) {
              PlaceAnnotationView(title: place.name)
          }
        }
        .navigationTitle("Mapa de facultades")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
}

struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa()
    }
}
