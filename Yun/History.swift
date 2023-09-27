//
//  History.swift
//  Yun
//
//  Created by Yael Javier Zamora Moreno on 09/07/23.
//

import SwiftUI

let today = Date()
let firstDay = Calendar.current.date(byAdding: .day, value: -346, to: today)!
let relations = Calendar.current.date(byAdding: .day, value: -320, to: today)!
let boda = Calendar.current.date(byAdding: .day, value: -318, to: today)!
let hallowen = Calendar.current.date(byAdding: .day, value: -252, to: today)!
let fin = Calendar.current.date(byAdding: .day, value: -188, to: today)!
let sanValentin = Calendar.current.date(byAdding: .day, value: -145, to: today)!

struct History: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Me faltan fechas, pero aquí están algunas").font(.largeTitle).multilineTextAlignment(.center).bold()
                TimelineList([
                    Appointment(date: firstDay, message: "Nos conocemos😍"),
                    Appointment(date: relations, message: "Iniciamos nuestro noviazo💘"),
                    Appointment(date: boda, message: "Nos casamos en el Acatianguis🥰"),
                    Appointment(date: hallowen, message: "Nuestro primer Halloween juntos😘"),
                    Appointment(date: fin, message: "Terminamos porque soy un idiota😭"),
                    Appointment(date: fin, message: "Volvimos a ser novios❤️"),
                    Appointment(date: sanValentin, message: "Nuestro primer 14 de febrero😍"),
                    Appointment(date: sanValentin, message: "Tendremos toda una vida juntos❤️😍🥰")
                ])
            }
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
