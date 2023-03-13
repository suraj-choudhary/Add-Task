//
//  NoteItemView.swift
//  TODOLIST
//
//  Created by suraj kumar on 12/03/23.
//

import SwiftUI

struct NoteItemView: View {
    @State var animate: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add a bunch of item in your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something🥴")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                    
                }
                .padding(.horizontal, animate ? 30: 50)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30: 10, x: 0, y: animate ? 50: 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear() {
                
                addAnimation()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteItemView()
                .navigationTitle("Title")
        }
        
    }
}
