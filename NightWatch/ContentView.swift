//
//  ContentView.swift
//  NightWatch
//
//  Created by Mar Cardona Aranda on 1/12/25.
//

import SwiftUI

@Observable
class NightWatchViewModel {
    var nighlyTasks = [
        NightWatchTask(name: "Check all windows", isComplete: false),
        NightWatchTask(name: "Check all doors", isComplete: false),
        NightWatchTask(name: "Check that the safe is locked", isComplete: false),
        NightWatchTask(name: "Check the mailbox", isComplete: false),
        NightWatchTask(name: "Inspect security cameras", isComplete: false),
        NightWatchTask(name: "Clear ice from sidewalks", isComplete: false),
        NightWatchTask(name: "Document \"strange and unusual\" occurrences", isComplete: false)
    ]

    var weeklyTasks = [
        NightWatchTask(name: "Check inside al vacant rooms", isComplete: false),
        NightWatchTask(name: "Walk the perimeter of the property", isComplete: false)
    ]

    var monthlyTasks = [
        NightWatchTask(name: "Test security alarm", isComplete: false),
        NightWatchTask(name: "Test motion detectors", isComplete: false),
        NightWatchTask(name: "Test smoke alarms", isComplete: false)
    ]
}

struct ContentView: View {
    @Bindable var nightWatchViewModel: NightWatchViewModel
    @State private var focusModeOn = false
    @State private var resertAlertShowing = false
    var body: some View {
        NavigationStack {
            List {
                Section (
                    content: {
                        ForEach($nightWatchViewModel.nighlyTasks) {
                            task in
                            if !focusModeOn || (focusModeOn && !task.wrappedValue.isComplete) {
                                NavigationLink {
                                    DetailView(task: task)
                                } label: {
                                    TaskRow(task: task.wrappedValue)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            nightWatchViewModel.nighlyTasks.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            nightWatchViewModel.nighlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                        }
                    },header: {
                        TaskSectionHeader(
                            headerText: "Nighly Tasks",
                            symbolSystemName: "moon.stars"
                        )
                    })
                
                Section (
                    content: {
                        ForEach($nightWatchViewModel.weeklyTasks) {
                            task in
                            NavigationLink {
                                DetailView(task: task)
                            } label: {
                                TaskRow(task: task.wrappedValue)
                            }
                        }
                        .onDelete { indexSet in
                            nightWatchViewModel.weeklyTasks.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            nightWatchViewModel.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                        }
                    },header: {
                        TaskSectionHeader(
                            headerText: "Weekly Tasks",
                            symbolSystemName: "sunset"
                        )
                    })
                
                Section (
                    content: {
                        ForEach($nightWatchViewModel.monthlyTasks) {
                            task in
                            NavigationLink {
                                DetailView(task: task)
                            } label: {
                                TaskRow(task: task.wrappedValue)
                            }
                        }
                        .onDelete { indexSet in
                            nightWatchViewModel.monthlyTasks.remove(atOffsets: indexSet)
                        }
                        .onMove { indices, newOffset in
                            nightWatchViewModel.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                        }
                    },header: {
                        TaskSectionHeader(
                            headerText: "Monthly Tasks",
                            symbolSystemName: "calendar"
                        )
                    })
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text("Home"))
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn, label: {
                        Text("Focus Mode")
                    })
                    .toggleStyle(.switch)
                    .frame(width: 175)
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        resertAlertShowing = true
                    }, label: {
                        Text("Reset")
                    })
                }
            }
        }
        .alert("Reset List", isPresented: $resertAlertShowing) {
            Button(role: .cancel) {
                
            } label: {
                Text("Cancel")
            }
            
            Button(role: .destructive) {
                let refresehdNightWatchViewModel = NightWatchViewModel()
                self.nightWatchViewModel.nighlyTasks = refresehdNightWatchViewModel.nighlyTasks
                self.nightWatchViewModel.weeklyTasks = refresehdNightWatchViewModel.weeklyTasks
                self.nightWatchViewModel.monthlyTasks = refresehdNightWatchViewModel.monthlyTasks
            } label: {
                Text("Yes, reset it")
            }
        } message: {
            Text("Are you sure?")
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
    ContentView(nightWatchViewModel: NightWatchViewModel())
}


#Preview("Task Row", body: {
    TaskRow(task: NightWatchTask(name: "Check all windows", isComplete: false))
    TaskRow(task: NightWatchTask(name: "Check all windows", isComplete: true))
})

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nightWatchViewModel: NightWatchViewModel())
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


struct TaskRow: View {
    let task: NightWatchTask
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundStyle(.gray)
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}
