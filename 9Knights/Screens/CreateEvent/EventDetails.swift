//
//  EventDetails.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/28.
//

import SwiftUI
import Combine

struct EventDetailsNavigationBar: View {
    @State private var isPresented = false
    @State private var isPresentedright = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
                .shadow(color: Color.gray.opacity(0.05), radius: 4, x: 0, y: 4)
                .frame(width: 390,height: 70)
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    ZStack{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Gray"))
                            .opacity(0.5)
                        Image("BlackArrowLeft")
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Text("旅程內容").font(.system(size: 24)).bold()
                Spacer()
                NavigationLink(destination: TabButton()){ Text("完成").foregroundColor(Color("Red")).font(.system(size: 20)).bold() }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
}
struct TextEditorWithPlaceholder: View {
     @Binding var introtext: String
    let text: String
     var body: some View {
         ZStack(alignment: .leading) {
             if introtext.isEmpty {
                VStack {
                     Text(text)
                         .foregroundColor(Color("WordGray"))
                         .padding(.top, 10)
                         .padding(.leading, 3)
                     Spacer()
                 }
             }
             
             VStack {
                 TextEditor(text: $introtext)
                     .frame(minHeight: 150, maxHeight: 180)
                     .opacity(introtext.isEmpty ? 0.6 : 1)
                 Spacer()
             }
         }
     }
 }
struct EventDetails: View {
    
    let options = ["北部", "中部", "南部", "東部"]
    let properties = ["車聚", "跑山", "旅遊", "休閒"]
    
    @State private var introtext: String = ""
    @State private var titletext: String = ""
    @State private var ppltext: String = ""
    @State private var isKeyboardShown = false
    @State private var selectedOption: String?
    @State private var selectedproperties: String?
    @State private var selectedStartDate = Date()
    @State private var selectedEndDate = Date()
    @State private var isShowingStartDatePicker = false
    @State private var isShowingEndDatePicker = false
    @State private var selectedNumber = 1
    let numbers = Array(1...10)
    

    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let startDate = calendar.date(byAdding: .year, value: -10, to: Date())!
            let endDate = calendar.date(byAdding: .year, value: 10, to: Date())!
            return startDate...endDate
        }()
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }
    var body: some View {
        NavigationStack{
            VStack{
                EventDetailsNavigationBar()
                VStack{
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Text("標籤").font(.system(size: 20)).bold()
                            Spacer()
                        }
                        HStack(spacing: 20){
                            Text("地區")
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    self.selectedOption = option
                                }, label: {
                                    Text(option)
                                        .font(.system(size: 12)).bold()
                                        .padding()
                                        .frame(width: 60, height: 26)
                                        .foregroundColor(Color("WordGray"))
                                        .background(self.selectedOption == option ? Color("Gray") : Color.white)
                                        .border(self.selectedOption == option ? Color("TagGray") : Color("WordGray"))
                                    
                                }).buttonStyle(StaticButtonStyle())
                            }
                        }
                        HStack(spacing: 20){
                            Text("性質")
                            ForEach(properties, id: \.self) { properties in
                                Button(action: {
                                    self.selectedproperties = properties
                                }, label: {
                                    Text(properties)
                                        .font(.system(size: 12)).bold()
                                        .padding()
                                        .frame(width: 60, height: 26)
                                        .foregroundColor(Color("WordGray"))
                                        .background(self.selectedproperties == properties ? Color("Gray") : Color.white)
                                        .border(self.selectedproperties == properties ? Color("TagGray") : Color("WordGray"))
                                    
                                }).buttonStyle(StaticButtonStyle())
                            }
                        }
                    }.frame(maxWidth: 360)
                    Divider()
                    VStack{
                        HStack{
                            Text("標題").font(.system(size: 20)).bold()
                            Spacer()
                        }
                        VStack {
                            TextField("輸入標題...", text: $titletext)
                        }
                    }.padding(.vertical).frame(maxWidth: 360, maxHeight: 80)
                    
                    //                        .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    //                            self.isKeyboardShown = keyboardHeight > 0
                    //                        }
                    Divider()
                    HStack{
                        Text("介紹").font(.system(size: 20)).bold()
                        Spacer()
                    }.frame(maxWidth: 360)
                    ZStack(alignment: .topLeading) {
                        TextEditorWithPlaceholder(introtext: $introtext, text: "寫下您想如何介紹您的旅程...")
                    }.frame(maxWidth: 360)
                }.padding(.top)
                Divider()
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("開始日期").font(.system(size: 20)).bold()
                            VStack(alignment: .leading) {
                                Button(action: {
                                    isShowingStartDatePicker = true
                                }, label: {
                                    Text(isShowingStartDatePicker ? "請選擇日期": "\(selectedStartDate, formatter: dateFormatter)")
                                        .frame(width: 170)
                                        .padding(.trailing, 50)
                                    Spacer()
                                })
                                .frame(width: 170)
                                .padding(.vertical,5)
                                .foregroundColor(Color.black)
                                
                            }
                            .sheet(isPresented: $isShowingStartDatePicker, content: {
                                VStack {
                                    Text("請選擇開始旅程的日期")
                                        .font(.system(size: 20))
                                        .padding()
                                    
                                    DatePicker("", selection: $selectedStartDate, in: dateRange, displayedComponents: .date)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                    
                                    Button(action: {
                                        isShowingStartDatePicker = false
                                    }, label: {
                                        Text("確定")
                                            .font(.headline)
                                            .padding()
                                            .foregroundColor(.white)
                                    })
                                    .background(Color.blue)
                                    .cornerRadius(10.0)
                                }
                            })
                        }.frame(width: 170)
                        Divider()
                        VStack(alignment: .leading){
                            Text("結束日期").font(.system(size: 20)).bold()
                            VStack {
                                Button(action: {
                                    isShowingEndDatePicker = true
                                }, label: {
                                    Text(isShowingEndDatePicker ? "請選擇日期": "\(selectedEndDate, formatter: dateFormatter)")
                                        .frame(width: 170)
                                        .padding(.trailing, 50)
                                    Spacer()
                                })
                                .frame(width: 170)
                                .padding(.vertical,5)
                                .foregroundColor(Color.black)
                                
                            }
                            .sheet(isPresented: $isShowingEndDatePicker, content: {
                                VStack {
                                    Text("請選擇結束旅程的日期")
                                        .font(.system(size: 20))
                                        .padding()
                                    
                                    DatePicker("", selection: $selectedEndDate, in: dateRange, displayedComponents: .date)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                    
                                    Button(action: {
                                        isShowingEndDatePicker = false
                                    }, label: {
                                        Text("確定")
                                            .font(.headline)
                                            .padding()
                                            .foregroundColor(.white)
                                    })
                                    .background(Color.blue)
                                    .cornerRadius(10.0)
                                }
                            })
                        }.padding(.leading,10).frame(width: 170)
                    }.frame(height:80)
                }
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("人數上限").font(.system(size: 20)).bold()
                        TextField("輸入預計參與人數(數字)...", text: $ppltext)
                    }
                }.frame(height:80).frame(maxWidth: 360)
                Divider()
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("行程規劃").font(.system(size: 20)).bold()
                        NavigationLink(destination: EventRoute()){
                            Text("新增行程中途點")
                                .foregroundColor(Color("WordLightGray"))
                        }
                    }
                    Spacer()
                }.frame(maxWidth: 360,maxHeight: 80)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        EventDetails()
    }
}
