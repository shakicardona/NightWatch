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
        NavigationStack {
            List {
                Section (
                    content: {
                        ForEach(nighlyTasks, id: \.self) {
                            taskName in
                            NavigationLink(taskName) {
                                DetailView(taskName: taskName)
                            }
                        }
                    },header: {
                        TaskSectionHeader(
                            headerText: "Nighly Tasks",
                            symbolSystemName: "moon.stars"
                        )
                    })
                
                Section (
                    content: {
                        ForEach(weeklyTasks, id: \.self) {
                            taskName in
                            NavigationLink(taskName) {
                                DetailView(taskName: taskName)
                            }
                        }
                    },header: {
                        TaskSectionHeader(
                            headerText: "Weekly Tasks",
                            symbolSystemName: "sunset"
                        )
                    })
                
                Section (
                    content: {
                        ForEach(monthlyTasks, id: \.self) {
                            taskName in
                            NavigationLink(taskName) {
                                DetailView(taskName: taskName)
                            }
                        }
                    },header: {
                        TaskSectionHeader(
                            headerText: "Monthly Tasks",
                            symbolSystemName: "calendar"
                        )
                    })
            }
            .listStyle(GroupedListStyle())
        }
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

struct TaskSectionHeader: View {
    let headerText: String
    let symbolSystemName: String
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            Text(headerText)
        }
        .headerStyle()
    }
}

