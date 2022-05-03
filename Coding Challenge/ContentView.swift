//
//  ContentView.swift
//  Coding Challenge
//
//  Created by Wattpad Cuong on 2022-04-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding().onAppear {
                Task {
                    await DataService.shared.fetchStories()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
