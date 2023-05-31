//
//  Venkatesh.swift
//  Quiz 3
//
//  Created by Kevin De Baboon on 31/5/23.
//

import SwiftUI

struct Venkatesh: View {
    var body: some View {
        VStack{
            Text("Venkatesh")
                .font(.title)
            Image("ScratchProfilePic").resizable()
            
            Text("The Venkatesh, also known as Vensah on Earth's cyberspace, is an omnivorous species from the planet Earth.")
                .padding(.vertical)
            Text("""
Description:
Height: 1.575m
Mass: 33.5

Often referred to as a short human.
""")
        }.padding()
    }
}

struct Venkatesh_Previews: PreviewProvider {
    static var previews: some View {
        Venkatesh()
    }
}
