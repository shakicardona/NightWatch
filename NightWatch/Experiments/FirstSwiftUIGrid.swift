//
//  FirstSwiftUIGrid.swift
//  NightWatch
//
//  Created by Mar Cardona Aranda on 2/12/25.
//

import SwiftUI

struct FirstSwiftUIGrid: View {
    var body: some View {
        LazyVGrid(columns: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Columns@*/[GridItem(.fixed(200))]/*@END_MENU_TOKEN@*/) {
            
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
        }
        ScrollView(.horizontal) {
            LazyHGrid(rows: [
                GridItem(.fixed(100)),
                GridItem(.fixed(100)),
                GridItem(.fixed(100))
            ]) {
                
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                Text("Placeholder")
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            }
        }

        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FirstSwiftUIGrid()
}
