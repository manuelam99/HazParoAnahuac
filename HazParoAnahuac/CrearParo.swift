//
//  CrearParo.swift
//  HazParoAnahuac
//
//  Created by alumno on 18/05/22.
//

import SwiftUI

struct CrearParo: View {
    @State var definicion: String = ""
    @State var tipo: String = ""
    @State var precio: String = ""
    @State var solicitante: String = ""
    @State var de_donde: String = ""
    @State var a_donde: String = ""
    @State var comentario: String = ""
    @State var paros = [ParoElement]()
    @State var regreso = DataModel(error: true, message: "", data: [ParoElement(id: "", definicion: "", tipo: "", precio: 0, solicitante: "", ejecutor: "", deDonde: "", aDonde: "", comentario: "", estatus: 0)])
    
    //MARK: - aceptarParo
    func crearParo(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "https://pf-pdmii.glitch.me/paros/crear") else
        {
            print("error url")
            return
            
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request)
        { (data,res,error) in
            
            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }
            
            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.paros = result.data
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }
                
            }//fin del do
            catch let JsonError
            {
                print("error en json ", JsonError.localizedDescription)
             }
                
                
        }.resume() // fin dataTask

    } //fin de creaFruits
    
    var body: some View {
        VStack{
            Image("perrito1")
                .resizable()
                .frame(width: 200, height: 200)
            VStack{
                TextField("Tipo", text: $tipo)
                TextField("Definición", text: $definicion)
                TextField("Precio", text: $precio)
                    .keyboardType(.numberPad)
                TextField("De dónde", text: $de_donde)
                TextField("A dónde", text: $a_donde)
                TextField("Comentario", text: $comentario)
            }
            VStack{
                Button(action: {
                    let params : [String:Any]  = [
                        "definicion": definicion, "tipo": tipo, "precio": precio,"solicitante": "6269accea7abe6a6287d89f1","de_donde":de_donde,"a_donde":a_donde,"comentario":comentario
                    ]
                    print(params)
                    print("Soy un boton yei")
                    crearParo(parameters: params)
                        }, label: {
                            Text("Hacer Paro")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            }
                )
            }
        }
        .buttonStyle(.bordered)
        .navigationTitle("Pide Paro")
        .font(.system(size: 30))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CrearParo_Previews: PreviewProvider {
    static var previews: some View {
        CrearParo()
    }
}
