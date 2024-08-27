//
//  ContentView.swift
//  CoverRemover
//
//  Created by Mohsen on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var backOffset: CGSize = .zero
    @State private var frontOffset: CGSize = .zero
    @State private var lastFrontOffset: CGSize = .zero
    @State private var isMiddleLineVisible: Bool = true
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                Rectangle()
                    .foregroundStyle(.clear)
                    .overlay(alignment:.bottom){
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.clear)
                            .frame(width: 200, height: 300)
                            .overlay(){
                                Image(.back)
                                    .resizable()
                            }
                            .offset(backOffset)
                            .task {
                                backOffset = CGSize(width: 0, height:200)
                            }
                        
                    }
                    .clipped()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.white)
                Rectangle()
                    .foregroundStyle(.clear)
                    .overlay(alignment:.top){
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.clear)
                            .frame(width: 200, height: 300)
                            .overlay{
                                Image(.front)
                                    .resizable()
                            }
                            .offset(frontOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        frontOffset = value.translation + lastFrontOffset
                                        backOffset = frontOffset + CGSize(width: 0, height: 300)
                                        
                                        isMiddleLineVisible =  (-300...0).contains(frontOffset.height)
                                    }
                                    .onEnded { value in
                                        frontOffset = value.translation + lastFrontOffset
                                        lastFrontOffset = frontOffset
                                        backOffset = frontOffset + CGSize(width: 0, height: 300)
                                        
                                    }
                            )
                        
                    }
                    .clipped()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                
                    .task {
                        frontOffset = CGSize(width: 0, height: -100)
                        lastFrontOffset = frontOffset
                    }
            }
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 220,height: 5)
                .foregroundStyle(.red)
                .offset(x:frontOffset.width,y:0)
                .animation(.easeOut, value: isMiddleLineVisible)
                .opacity(isMiddleLineVisible ? 1 : 0)
                .blur(radius: 4)
        }.background(.black)
    }
}


#Preview {
    ContentView()
}
