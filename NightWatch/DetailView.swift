//
//  DetailView.swift
//  NightWatch
//
//  Created by Mar Cardona Aranda on 3/12/25.
//

import SwiftUI

struct DetailView: View {
    let taskName: String
    var body: some View {
        VStack {
            Text(taskName)
        }
    }
}

