//
//  ContentView.swift
//  checklist
//
//  Created by Zimo on 29/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var done = [Bool]()
    @State private var tasks = [String]()
    @State private var isEditing = false
    @State private var isMoving = false
    @State private var selectedIndex: Int? = nil
    @State private var showRenameAlert = false
    @State private var renameText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Checklist")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                        selectedIndex = nil
                        if !isEditing {
                            isMoving = false
                        }
                    }
                }
                Button("Add") {
                    addItem()
                }
                .disabled(!isEditing)
                
                Button(isMoving ? "Stop Moving" : "Move") {
                    withAnimation {
                        isMoving.toggle()
                    }
                }
                .disabled(!isEditing)
                
                Button("Delete") {
                    deleteSelected()
                }
                .disabled(!isEditing || selectedIndex == nil)
            }
            .padding(.bottom, 10)
            
            if isMoving {
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack {
                            Image(systemName: "\(index + 1).circle")
                            Text(tasks[index])
                        }
                    }
                    .onMove(perform: move)
                    .onDelete(perform: delete)
                }
            } else {
                ForEach(tasks.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: "\(index + 1).circle")
                        Text(tasks[index])
                        Spacer()
                        if isEditing && selectedIndex == index {
                            Button {
                                renameText = tasks[index]
                                selectedIndex = index
                                showRenameAlert = true
                            } label: {
                                Image(systemName: "pencil")
                            }
                        }
                        Image(systemName: done[index] ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(done[index] ? .blue : .gray)
                            .onTapGesture {
                                withAnimation {
                                    if isEditing || !done[index] {
                                        done[index].toggle()
                                    }
                                }
                            }
                    }
                    .contentShape(Rectangle())
                    .background(selectedIndex == index ? Color.blue.opacity(0.1) : Color.clear)
                    .onTapGesture {
                        if isEditing {
                            selectedIndex = selectedIndex == index ? nil : index
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            tasks = [
                "AM7:20 Wake up",
                "AM7:40 Brush teeth",
                "AM8:00 Get dressed",
                "AM8:30 Breakfast",
                "AM8:40 Send child to school",
                "AM8:50 Check emails",
                "AM9:00 Start work",
                "AM12:00 Lunch",
                "PM2:40 Check emails again",
                "PM2:50 Get child back home",
                "PM5:30 Make some dinner",
                "PM6:00 Eat dinner",
                "PM7:30 Shower time",
                "PM8:00 Get ready for bed",
                "PM8:30 Read a book and sleep time"
            ]
            done = Array(repeating: false, count: tasks.count)
        }
        .alert("Rename Item", isPresented: $showRenameAlert, actions: {
            TextField("Task Name", text: $renameText)
            Button("OK") {
                if let index = selectedIndex {
                    tasks[index] = renameText
                }
            }
            Button("Cancel", role: .cancel) {}
        })
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
        done.move(fromOffsets: source, toOffset: destination)
    }
    
    private func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        done.remove(atOffsets: offsets)
    }
    
    private func deleteSelected() {
        if let index = selectedIndex {
            withAnimation {
                tasks.remove(at: index)
                done.remove(at: index)
                selectedIndex = nil
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            tasks.append("New Task")
            done.append(false)
        }
    }
}

#Preview {
    ContentView()
}
/// Todo for today: add checklist "done" icons maybe via `Circle`
