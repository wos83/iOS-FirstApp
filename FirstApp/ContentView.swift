//
//  ContentView.swift
//  FirstApp
//
//  Created by Willian Santos on 2/18/23.
//

import SwiftUI

class Counter: ObservableObject {
    
    @Published var years = 0
    @Published var months = 0
    @Published var days = 0
    @Published var hours = 0
    @Published var minutes = 0
    @Published var secounds = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true)
        
        { timer in
            
            let calendar = Calendar.current
            
            let components = calendar.dateComponents([
                .year
                , .month
                , .day
                , .hour
                , .minute
                , .second
            ], from: Date())
            
            let currentDate = calendar.date(from: components)
            
            var eventDateComponents = DateComponents()
            eventDateComponents.year = 2024
            eventDateComponents.month = 12
            eventDateComponents.day = 31
            eventDateComponents.hour = 23
            eventDateComponents.minute = 59
            eventDateComponents.second = 59
            
            let eventDate = calendar.date(from: eventDateComponents)
            
            let timeLeft = calendar.dateComponents([
                .year
                , .month
                , .day
                , .hour
                , .minute
                , .second
            ], from: currentDate!, to: eventDate!)
            
            self.years = timeLeft.year ?? 0000
            self.months = timeLeft.month ?? 00
            self.days = timeLeft.day ?? 00
            self.hours = timeLeft.hour ?? 00
            self.minutes = timeLeft.minute ?? 00
            self.secounds = timeLeft.second ?? 00            
        }
    }
}

struct ContentView: View {
    
    @StateObject var counter = Counter()
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text("\(counter.years) anos")
                Text("\(counter.months) meses")
                Text("\(counter.days) dias")
            }
            
            HStack{
                Text("\(counter.hours) horas")
                Text("\(counter.minutes) minutos")
                Text("\(counter.secounds) segundos")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
