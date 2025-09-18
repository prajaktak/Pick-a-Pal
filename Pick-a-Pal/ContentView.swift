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
    @State private var shouldRemovePickedName : Bool = false
    
    var body: some View {
        VStack {
            VStack (spacing : 10) {
                Image(systemName: "person.3.fill")
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.indigo)
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                        .listRowBackground(Color.gray.opacity(0.1))
                }
            }
            .scrollContentBackground(.hidden)
            
            TextField("Add name",text: $nameToAdd)
                .onSubmit {
                    if(!nameToAdd.isEmpty){
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
                .autocorrectionDisabled()
                
                
            Divider()
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            Divider()
            Button{
                if let randomName = names.randomElement(){
                    pickedName = randomName
                }else{
                    pickedName = ""
                }
                
                if shouldRemovePickedName{
                    if let index = names.firstIndex(of: pickedName){
                        names.remove(at: index)
                    }
                }
            }label: {
                Text("Pick Random Name")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
            }
            .disabled(names.isEmpty)
            .buttonStyle(.bordered)
            .shadow(color: .black, radius: 5)
            .buttonBorderShape(.capsule)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding()
        .foregroundStyle(.white)
        .background(Gradient(colors: [.blue, .cyan, .teal ,.purple]))
    }
}

#Preview {
    ContentView()
}
