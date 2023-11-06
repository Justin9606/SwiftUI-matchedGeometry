//
//  ContentView.swift
//  SwiftUI-DesignCode
//
//  Created by justin on 11/6/23.
//

import SwiftUI

// stransition
// struct ContentView: View {
//    @State var show: Bool = false
//    var body: some View {
//        ZStack {
//            if !show {
//                Text("View transition")
//            } else {
//                RoundedRectangle(cornerRadius: 30, style: .continuous)
//                    .fill(Color.blue)
//                    .padding()
//                    .transition(.move(edge: .trailing))
//                    .zIndex(1)
//            }
//        }
//        .onTapGesture {
//            withAnimation(.spring()) {
//                show.toggle()
//            }
//        }
//    }
// }
// struct ContentView: View {
//    @State var tap = false
//
//    var body: some View {
//        VStack {
//            Text("View more").foregroundColor(.white)
//        }
//        .frame(width: 200, height: 200)
//        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
//        .mask(RoundedRectangle(cornerRadius: 30))
//        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(tap ? 0.6 : 0.3), radius: tap ? 20 : 10, x: 0, y: tap ? 10 : 20)
//        .scaleEffect(tap ? 1.2 : 1)
//        .animation(.spring(response: 0.4, dampingFraction: 0.6))
//        .onTapGesture {
//            tap = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                tap = false
//            }
//        }
//    }
// }

// long press
// struct ContentView: View {
//    @GestureState var press = false
//    @State var show = false
//
//    var body: some View {
//        Image(systemName: "camera.fill")
//            .foregroundColor(.white)
//            .frame(width: 60, height: 60)
//            .background(show ? Color.black : Color.blue)
//            .mask(Circle())
//            .scaleEffect(press ? 2 : 1)
//            .animation(.spring(response: 0.4, dampingFraction: 0.6))
//            .gesture(
//                LongPressGesture(minimumDuration: 0.5)
//                    .updating($press) { currentState, gestureState, _ in
//                        gestureState = currentState
//                    }
//                    .onEnded { _ in
//                        show.toggle()
//                    }
//            )
//    }
// }

// matched geometry effect

struct ContentView: View {
    @State var show = false
    @Namespace var namespace

    var body: some View {
        ZStack {
            if !show {
                ScrollView {
                    HStack {
                        VStack {
                            Text("Title").foregroundColor(.white)
                                .matchedGeometryEffect(id: "title", in: namespace)
                        }
                        .frame(width: 100, height: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous).matchedGeometryEffect(id: "shape", in: namespace)
                        )
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 100, height: 100)

                        Spacer()
                    }
                    .padding(8)
                }
            } else {
                VStack {
                    Text("Title").foregroundColor(.white)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    Rectangle().matchedGeometryEffect(id: "shape", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
