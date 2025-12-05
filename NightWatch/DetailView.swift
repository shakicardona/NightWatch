//
//  DetailView.swift
//  NightWatch
//
//  Created by Mar Cardona Aranda on 3/12/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var task: NightWatchTask
    
    var body: some View {
        VStack {
            Text(task.name)
            Button(action: {
                task.isComplete = true
            }, label: {
                Text("Mark Complete")
            })
        }
    }
}

#Preview {
    DetailView(task: .constant(NightWatchTask(name: "Check all windows", isComplete: false)))
}
