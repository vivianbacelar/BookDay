//
//  Test.swift
//  BookDay
//
//  Created by Vivian Bacelar on 26/01/23.
//

//import SwiftUI
//import UIKit
//
//
////Onboarding
//struct PassoaPasso: View{
//
//    @State var Library: Bool = true
//    @State var livro: VolumeInfo
//    @EnvironmentObject var flowOrganizer: FlowOrganizer
//
//    var body: some View{
//        ZStack{
//            Color.corDeFundo
//                .padding(.bottom, -40)
//            TabView {
//
//                ForEach(VolumeInfo.instructions) { page in
//                    PageView(
//                        content: page,
//                        finalizar: $finalizar,
//                        receita: $receita
//                    )
//
//                }
//            }
//            .overlay(alignment: .center) {
//
//                VStack {
//                    Button {
//                        flowOrganizer.dismiss()
//                        print("Click")
//                    } label: {
//                        Image(systemName: "xmark.circle.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 40, height: 40)
//                            .foregroundStyle(Color.corDeFundo, Color.corTextoPasso)
//
//                    }
//                    .buttonStyle(.plain)
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .padding(.trailing, 40)
//                    .padding(.top, 80)
//
//                    if !finalizar {
//                        ParabensView(receita: $receita)
//                    } else {
//                        Spacer()
//                    }
//                }
//
//
//            }.frame(width: UIScreen.main.bounds.width)
//
//
//        }
//        .tabViewStyle(PageTabViewStyle())
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: finalizar ? .always : .never))
//        .padding(.bottom, 40)
//
//
//    }
//
//}
//struct PageView: View{
//    var content: PageViewContent
//    @Binding var finalizar: Bool
//    @Binding var receita: Recipe
//
//    var body: some View {
//        VStack{
//            Text(content.title)
//                .font(.largeTitle)
//                .bold()
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 30)
//                .foregroundColor(Color.corTextoPasso)
//
//            if content.showsDismissButton{
//                Button(action: {
//                    finalizar.toggle()
//                }, label: {
//                    Text("Terminar Receita")
//                        .font(.custom("SulSansTest-Bold", size: 20, relativeTo: .title))
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 25)
//                        .padding(.vertical, 10)
//                        .background (Color.corTextoPasso)
//                        .clipShape (Capsule())
//
//                })
//                .buttonStyle(.plain)
//
//            }
//
//        }.padding(.bottom, 80)
//    }
//}
//
//
//struct ParabensView: View {
//    @State var imageSelect = UIImage()
//    @State var fechar: Bool = false
//    @State var openCamera = false
//    @State var imageSelected: UIImage?
//    @State var jaGanhou: Bool = false
//    @Binding var receita: Recipe
//
//    @EnvironmentObject var flowOrganizer: FlowOrganizer
//
//    var body: some View {
//        ZStack {
//            Color.corDeFundo
//                .padding(.bottom, -40)
//            VStack{
//                Text("Parabéns!")
//                    .bold()
//                    .font(.custom("SulSansTest-Bold", size: 60, relativeTo: .largeTitle))
//                    .padding(.top,-10)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.corRosa)
//                    .padding(.bottom)
//
//
//                Text("Você concluiu a receita!")
//                    .font(.custom("SulSansTest-Regular", size: 25, relativeTo: .headline))
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.corRosa)
//
//                ZStack(alignment: .bottomTrailing) {
//                    Button {
//                        if !jaGanhou {
//                            openCamera.toggle()
//                        }
//                    } label: {
//                        if let imageSelected {
//                            Image(uiImage: imageSelected)
//                                .resizable()
//                                .scaledToFit()
//                                .padding(.horizontal)
//                        } else {
//                            Image("tirar foto")
//                                .resizable()
//                                .frame(width: 334, height: 239, alignment: .center)
//
//                        }
//                    }.buttonStyle(.plain)
//                }
//                .fullScreenCover(isPresented: $openCamera){
//                    ImagePicker(image: $imageSelected, sourceType: .camera)
//                        .ignoresSafeArea()
//                        .onDisappear {
//                            if let _ = imageSelected  {
//                                fechar.toggle()
//                                jaGanhou = true
//                                receita.hasCompleted = true
//                            }
//                        }
//                }
//                .sheet(isPresented: $fechar) {
//                    CoinView(fechar: $fechar)
//                        .presentationDetents([.medium])
//                        .ignoresSafeArea()
//                }
//                if !jaGanhou {
//                    Text("Tire uma foto do prato e ganhe seu prêmio")
//                        .font(.custom("SulSansTest-Regular", size: 25, relativeTo: .headline))
//                        .padding(.horizontal,UIScreen.main.bounds.width / 8)
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(Color.corRosa)
//                        .padding(.bottom,50)
//
//
//                }else{
//
//                    ShareLink(item: Image(uiImage: imageSelected!), preview: SharePreview("Foto da sua receita!",image: Image(uiImage: imageSelected!))) {
//                        Text("Compartilhar")
//                            .font(.custom("SulSansTest-Medium", size: 20, relativeTo: .title))
//                            .foregroundColor(Color.corAmarela)
//                            .padding(.horizontal, 100)
//                            .padding(.vertical, 10)
//                            .background (Color.corRosa)
//                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                    }
//                    .padding(.bottom)
//                    .buttonStyle(.plain)
//                }
//            }
//        }.onAppear {
//            flowOrganizer.navigateTo(.parabens)
//        }
//    }
//}
