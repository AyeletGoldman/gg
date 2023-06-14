// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

private enum Constants {
    static let carouselSpacing: CGFloat = 10
}

struct CarouselView<Title: View, CarouselItemView: View>: View {

    private let numberOfItems: Int
    private let itemAtIndex: (_ index: Int, _ isSelected: Bool) -> CarouselItemView
    private let showsScrollingIndicators: Bool
    private let scrollInset: CGFloat?
    private let title: Title?
    private var onItemSelected: ((Int) -> Void)?

    @State private var selectedIndex: Int?

    init(title: () -> Title,
         numberOfItems: Int,
         itemAtIndex: @escaping (_ index: Int, _ isSelected: Bool) -> CarouselItemView,
         showsScrollingIndicators: Bool = false,
         scrollInset: CGFloat? = nil,
         onItemSelected: ((Int) -> Void)? = nil,
         initialSelectedIndex: Int? = nil) {
        self.title = title()
        self.numberOfItems = numberOfItems
        self.itemAtIndex = itemAtIndex
        self.scrollInset = scrollInset
        self.showsScrollingIndicators = showsScrollingIndicators
        self.onItemSelected = onItemSelected
        self.selectedIndex = initialSelectedIndex
    }

    var body: some View {
        StylableGroup("carousel") {
            self.title?
                .padding(.horizontal, self.scrollInset)
            ScrollView(.horizontal, showsIndicators: self.showsScrollingIndicators) {
                LazyHStack(spacing: Constants.carouselSpacing) {
                    ForEach(Array(0..<self.numberOfItems), id: \.self, content: { index in
                        if let onItemSelected = self.onItemSelected {
                            Button(action: {
                                onItemSelected(index)
                                self.selectedIndex = index
                            }, label: {
                                self.itemAtIndex(index, self.selectedIndex == index)
                            })
                        } else {
                            self.itemAtIndex(index, self.selectedIndex == index)
                        }
                    })
                }.padding(.horizontal, self.scrollInset)
            }
        }
    }
}

extension CarouselView where Title == SectionHeaderView<Never> {
    init(title: String,
         numberOfItems: Int,
         itemAtIndex: @escaping (_ index: Int, _ isSelected: Bool) -> CarouselItemView,
         showsScrollingIndicators: Bool = false,
         scrollInset: CGFloat? = nil,
         onItemSelected: ((Int) -> Void)?) {
        self.init(title: { SectionHeaderView(title: title) },
                  numberOfItems: numberOfItems,
                  itemAtIndex: itemAtIndex,
                  showsScrollingIndicators: showsScrollingIndicators,
                  scrollInset: scrollInset,
                  onItemSelected: onItemSelected)
    }
}

extension CarouselView where Title == Never, CarouselItemView == DefaultCarouselItemView {
    init(carouselItems: [MediaType],
         itemSize: CGSize = CGSize(width: 70, height: 70),
         showsScrollingIndicators: Bool = false,
         scrollInset: CGFloat? = nil,
         onItemSelected: ((Int) -> Void)? = nil,
         initialSelectedIndex: Int? = nil,
         isPreviewMode: Bool = true) {
        self.title = nil
        self.numberOfItems = carouselItems.count
        self.itemAtIndex = { index, isSelected in
            return DefaultCarouselItemView(mediaType: carouselItems[index],
                                           itemSize: itemSize,
                                           isSelected: isSelected,
                                           isPreviewMode: isPreviewMode)
        }
        self.scrollInset = scrollInset
        self.showsScrollingIndicators = showsScrollingIndicators
        self.onItemSelected = onItemSelected
        self.selectedIndex = initialSelectedIndex
    }
}
