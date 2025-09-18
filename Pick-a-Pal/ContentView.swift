//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Prajakta Kulkarni on 18/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var names : [String] = ["Elisha","Andre","Jasmine","Po-Chun","Kai","Aria","Froyo","Ali","Bas","Rahul"]
    @State private var nameToAdd : String = ""
    @State private var pickedName : String = ""
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? " " : pickedName)
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
                
            Divider()
            Button("Pick Random Name"){
                if let randomName = names.randomElement(){
                    pickedName = randomName
                }else{
                    pickedName = ""
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .buttonBorderShape(.capsule)
            .foregroundStyle(.white)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
