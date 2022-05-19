//
//  Mapa.swift
//  HazParoAnahuac
//
//  Created by alumno on 04/05/22.
//

import SwiftUI
import MapKit
import Foundation

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

class MapModel: ObservableObject {
    @Published var mapType = MKMapType.standard
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.4006, longitude: -99.264), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
}


struct Mapa: View {
    @EnvironmentObject var mapModel: MapModel

    @State private var mapType: Int = 0
    @State private var mapTypes = ["Standard", "Satellite", "Hybrid"]

    var body: some View {
        ZStack (alignment: .topLeading) {
            MapView().edgesIgnoringSafeArea(.all).navigationTitle("Ubi KT")
            mapTools
        }
    }

    var mapTools: some View {
        HStack {
            Spacer()
            Picker(selection: Binding<Int> (
                get: {self.mapType},
                set: {
                    self.mapType = $0
                    self.mapModel.mapType = self.getMapType()
                }
            ), label: Text("")) {
                ForEach(0 ..< mapTypes.count) {
                    Text(self.mapTypes[$0])
                }
            }.pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            .frame(width: 222, height: 60)
            .clipped()
            Spacer()
        }
    }

    func getMapType() -> MKMapType {
        switch mapType {
        case 0: return .standard
        case 1: return .satellite
        case 2: return .hybrid
        default:
            return .standard
        }
    }

}

struct MapView: UIViewRepresentable  {

    @EnvironmentObject var mapModel: MapModel

    let mapView = MKMapView()

    func makeUIView(context: Context) -> MKMapView {
        mapView.mapType = mapModel.mapType
        mapView.setRegion(mapModel.region, animated: true)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapModel.mapType
    }

}

struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa()
    }
}
