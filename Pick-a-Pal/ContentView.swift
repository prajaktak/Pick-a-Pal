//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Prajakta Kulkarni on 18/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var names : [String] = ["Elisha","Andre","Jasmine","Po-Chun","Kai","Aria","Froyo","Ali","Bus","Rahul"]
    @State private var nameToAdd : String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            TextField("Add name",text: $nameToAdd)
                .onSubmit {
                    if(!nameToAdd.isEmpty){
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
                .autocorrectionDisabled()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
