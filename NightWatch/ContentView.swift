//
//  ContentView.swift
//  NightWatch
//
//  Created by Mar Cardona Aranda on 1/12/25.
//

import SwiftUI

let nighlyTasks = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check the mailbox",
    "Inspect security cameras",
    "Clear ice from sidewalks",
    "Document \"strange and unusual\" occurrences"
]

let weeklyTasks = [
    "Check inside al vacant rooms",
    "Walk the perimeter of the property"
]

let monthlyTasks = [
    "Test security alarm",
    "Test motion detectors",
    "Test smoke alarms"
]

struct ContentView: View {
    var body: some View {
        List {
            Section (
                content: {
                    ForEach(nighlyTasks, id: \.self) {
                        taskName in Text(taskName)
                    }
            },header: {
                HStack {
                    Image(systemName: "moon.stars")
                    Text("Nighly Tasks")
                }
                .headerStyle()
            })
            
            Section (
                content: {
                    ForEach(weeklyTasks, id: \.self) {
                        taskName in Text(taskName)
                    }
            },header: {
                HStack {
                    Image(systemName: "sunset")
                    Text("Weekly Tasks")
                }
                .headerStyle()
            })
            
            Section (
                content: {
                    ForEach(monthlyTasks, id: \.self) {
                        taskName in Text(taskName)
                    }
            },header: {
                HStack {
                    Image(systemName: "calendar")
                    Text("Monthly Tasks")
                }
                .headerStyle()
            })
        }
        .listStyle(GroupedListStyle())
    }
}

struct HeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.yellow)
            .textCase(.uppercase)
    }
}

extension View {
    func headerStyle() -> some View {
        self.modifier(HeaderStyle())
    }
}

#Preview {
    ContentView()
}

#Preview("ContentView Landscape", traits:
        .landscapeRight,
         body: { ContentView()
})

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
