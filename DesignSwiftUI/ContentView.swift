//
//  ContentView.swift
//  DesignSwiftUI
//
//  Created by Luis Garcia on 25/12/21.
//

import SwiftUI

// VStack vertical
// HStack horizontal
// ZStack fondo

struct ContentView: View {
    
    // EnvironmentsValues o variables de entorno
    @Environment(\.verticalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact{
            compactDesign()
        }else{
            regularDesign()
        }
    }
}

struct regularDesign: View {
    
    let numero = "45654345"
    let mensaje = "Hola este es el mensaje, como estas?"
    
    func sendMessage() {
        let sms = "sms: \(numero)&body=\(mensaje)"
        guard let stringMSM = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        UIApplication.shared.open(URL.init(string: stringMSM)!, options: [:], completionHandler: nil)
    }
    
    func sendCall(){
        guard let number = URL(string: "tel://\(numero)") else { return }
        UIApplication.shared.open(number)
    }
    
    var body: some View {
        ZStack() {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack() {
                Image("icono")
                    .resizable()
                    .frame(width: 150, height: 200, alignment: .center)
                    // .clipShape(Circle())
                HStack() {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("Wicho García")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                }
                HStack() {
                    Image(systemName: "arrow.forward.circle")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Calle #256")
                        .foregroundColor(.white)
                        .font(.title)
                        .italic()
                }
                HStack() {
                    Button(action:{
                        sendCall()
                    }) {
                        Image(systemName: "phone.fill")
                            .modifier(boton(color: .indigo))
                    }
                    
                    Button(action:{
                        sendMessage()
                    }) {
                        Image(systemName: "message.fill")
                            .modifier(boton(color: .red))
                    }
                }
                
            }
        }
    }
}

struct boton: ViewModifier {
    var color : Color
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.indigo)
            .clipShape(Circle())
            .foregroundColor(Color.white)
            .font(.title)
        
    }
}

struct compactDesign: View {
    var body: some View {
        ZStack() {
            Color.indigo.edgesIgnoringSafeArea(.all)
            
            HStack() {
                Image("icono")
                    .resizable()
                    .frame(width: 150, height: 200, alignment: .center)
                    // .clipShape(Circle())
                VStack(alignment: .leading, spacing: 30) {
                    HStack() {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("Wicho García")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                    HStack() {
                        Image(systemName: "arrow.forward.circle")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Calle #256")
                            .foregroundColor(.white)
                            .font(.title)
                            .italic()
                    }
                        
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
