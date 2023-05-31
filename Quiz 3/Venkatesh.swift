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
            Text("hi")
            Button{
                print("he touched me")
            } label:{
                Text("Dont TOuch ME!!!")
            }
        }
    }
}

struct Venkatesh_Previews: PreviewProvider {
    static var previews: some View {
        Venkatesh()
    }
}
