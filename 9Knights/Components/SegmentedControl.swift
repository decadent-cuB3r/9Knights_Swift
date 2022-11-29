//
//  Segmented.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/25.
//

import SwiftUI
import UIKit

///////// Helpers /////////
public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

/// PreferenceKey for a subview to notify superview of its size
struct SizePreferenceKey: PreferenceKey {
    public typealias Value = CGSize
    public static var defaultValue: Value = .zero

    public static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct BackgroundGeometryReader: View {
    public init() {}

    public var body: some View {
        GeometryReader { geometry in
            return Color
                    .clear
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}

struct SegmentedControl: View {
    
    @Binding private var selection: Int
       @State private var segmentSize: CGSize = .zero
       @State private var itemTitleSizes: [CGSize] = []

       private let items: [String]

       public init(items: [String],
                   selection: Binding<Int>) {
           self._selection = selection
           self.items = items
           self._itemTitleSizes = State(initialValue: [CGSize](repeating: .zero, count: items.count))
       }

       public var body: some View {
           ZStack {
               GeometryReader { geometry in
                   Color
                       .clear
                       .onAppear {
                           segmentSize = geometry.size
                       }
               }
               .frame(maxWidth: .infinity, maxHeight: 1)

               VStack(alignment: .leading, spacing: 0) {
                   VStack(alignment: .leading, spacing: 0) {
                       HStack(spacing: 50) {
                           ForEach(0 ..< items.count, id: \.self) { index in
                               segmentItemView(for: index)
                           }
                       }
                       .padding(.bottom, 12)

                       // bottom line
                       VStack{
                           Rectangle()
                               .foregroundColor(Color("Red"))
                               .frame(width: selectedItemWidth, height: 3)
                               .offset(x: selectedItemHorizontalOffset(), y: 0)
                               .animation(Animation.linear(duration: 0.3))
                       }
                   }
                   .padding(.horizontal, 10)
                   


                   // full width divider
               }.padding(.top,15)
                   
           }.background(Color("Gray"))
               
       }

       private var selectedItemWidth: CGFloat {
           return itemTitleSizes.count > selection ? itemTitleSizes[selection].width : .zero
       }

       private func segmentItemView(for index: Int) -> some View {
           guard index < self.items.count else {
               return EmptyView().eraseToAnyView()
           }

           let isSelected = self.selection == index

           return
               Text(items[index])
               .font(.system(size: 18, weight: .bold))
               .foregroundColor(isSelected ? .black : Color("WordLightGray"))
               .background(BackgroundGeometryReader())
               .onPreferenceChange(SizePreferenceKey.self) {
                   itemTitleSizes[index] = $0
               }
               .onTapGesture { onItemTap(index: index) }
               .eraseToAnyView()
       }

       private func onItemTap(index: Int) {
           guard index < self.items.count else { return }
           self.selection = index
       }

       private var xSpace: CGFloat {
           guard !itemTitleSizes.isEmpty, !items.isEmpty, segmentSize.width != 0 else { return 0 }
           let itemWidthSum: CGFloat = itemTitleSizes.map { $0.width }.reduce(0, +).rounded()
           let space = (segmentSize.width - itemWidthSum) / CGFloat(items.count + 1)
           return max(space, 0)
       }

       private func selectedItemHorizontalOffset() -> CGFloat {
           guard selectedItemWidth != .zero, selection != 0 else { return 0 }

           let result = itemTitleSizes
               .enumerated()
               .filter { $0.offset < selection }
               .map { $0.element.width }
               .reduce(0, +)

           return result + 50 * CGFloat(selection)
       }
}
