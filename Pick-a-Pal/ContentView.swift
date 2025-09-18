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
    @State var showLoginAlert = false
    @State var savedList : [String] = []
    
    var body: some View {
        VStack {
            VStack (spacing : 10) {
                Image(systemName: "person.3.fill")
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            Text(pickedName.isEmpty ? "Picked Name " : pickedName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.indigo)
            Divider()
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                        .fontWeight(.semibold)
                        .listRowBackground(Color.gray.opacity(0.1))
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            
            TextField("Add name",text: $nameToAdd)
                .onSubmit {
                    //removing all whitespaces in string before adding it to the list
                    nameToAdd = nameToAdd.trimmingCharacters(in: .whitespaces)
                    
                    if(!nameToAdd.isEmpty){
                        showLoginAlert = names.contains(nameToAdd)
                        if !showLoginAlert{
                            names.append(nameToAdd)
                            nameToAdd = ""
                        }
                    }
                }
                .alert(isPresented: $showLoginAlert) {
                    Alert(title: Text("Name already exists"), message: Text("Please choose a different name"), dismissButton: .default(Text("OK")))
                }
                .keyboardType(.default)
                .autocorrectionDisabled()
                
                
            Divider()
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
                .fontWeight(.bold)
            HStack{
                Button("Save List", systemImage: "document.circle.fill"){
                    savedList.append(contentsOf: names)
                    UserDefaults.standard.set(savedList, forKey: "savedList")
                }
                .disabled(names.isEmpty)
                Spacer()
                Button("Load List", systemImage: "arrowshape.turn.up.backward.circle.fill"){
                    names = UserDefaults.standard.array(forKey:"savedList") as! [String]
                }
            }
            .labelStyle(.titleAndIcon)
            .fontWeight(.bold)
            .buttonStyle(.bordered)
            .shadow(color: .black, radius: 5)
            .buttonBorderShape(.capsule)
            
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
                Image(systemName: "person.circle.fill")
                Text("Pick Random Name")
                    .fontWeight(.bold)
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
