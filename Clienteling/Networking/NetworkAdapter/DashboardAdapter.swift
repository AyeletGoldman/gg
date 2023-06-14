//// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MaisonKit
import Combine
import SwiftUI
import Moya

extension NetworkAdapter: DashboardAdapter {
    func getDashboardItems(userId: String, filters: MaisonKit.SelectedFilters?) -> AnyPublisher<Result<DashboardDisplayable, ErrorDisplayable>, Error> {
        dashboardStore.runningUser = filters?.first?.value.first
        return dashboardStore.dashboardPublisher
    }
    
    static let NO_DATA_FLAG: Double = -99999
}
extension DashboardDisplayable {
    init(_ dashboard: IDashboardsV2) {
        let items: [any StatItemDisplayView] = dashboard.itemsV2.map { item in
            switch item {
            case .iDashboardAbstractComponent(let component):
                switch component.clientGraph {
                case .circles:
                    return MultiCircularStat(data: MultiCircularStatBlockView.Data(abstractComponent: component))
                case .singleValue:
                    return SimpleStat(data: SimpleStatBlockView.Data(abstractComponent: component))
                case .bar:
                   return MultiValueBarStat(data: MultiValueBarStatBlockView.Data(abstractComponent: component))
                case .gauge:
                    return GaugeDisplayView(data: GaugeView.Data(component: component))
                default:
                    if component.data.isEmpty {
                        return SimpleStat(data: SimpleStatBlockView.Data(abstractComponent: component))
                    }
                    return HorizontalGraphDisplayView(data: HorizontalGraphView.Data(abstractComponent: component))
                }
                
            case .iDashboardSimpleComponent(let component):
                switch component.clientGraph {
                case .circles:
                    return CircularProgressDetailStat(data: CircularProgressDetailStatBlockView.Data(title: component.subtitle ?? "", subtitle: component.componentTitle, progress: (component.value ?? 0)/100 ))
                default:
                    return SimpleStat(data: SimpleStatBlockView.Data(simpleComponent: component))
                }
                
            case .iDashboardMultiAbstractComponent(let component):
                switch component.clientGraph {
                case .horizontal:
                    return HorizontalGraphDisplayView(data: HorizontalGraphView.Data(multiAbstractComponent: component))
                case .bar:
                    return MultiValueBarStat(data: MultiValueBarStatBlockView.Data(multiAbstractComponent: component))
                case .combineBar:
                    return MultiHorizontalGraphDisplayView(data: MultiHorizontalGraphView.Data(component: component))
                default:
                    return MultiValueBarStat(data: MultiValueBarStatBlockView.Data(multiAbstractComponent: component))

                }
            }
        }
        
        let filterId = UUID().uuidString
        let filterItems = dashboard.filters.availableFilters.map {
            TextFilterView.Item(displayName: $0.name, value: $0.userId)
        }
        
        let filter = FilterData(
            title: MKLocalizedString("dashboard.filters.clientAdvisors.title", comment: "Title"),
            pluralTitleFormat: MKLocalizedString("dashboard.filters.clientAdvisors.title", comment: "Title"),
            viewBuilder: .textFilter(TextFilter(id: filterId, filterItems: filterItems))
        )
        
        var selectedFilters: MaisonKit.SelectedFilters = [:]
        if let selectedFilter = dashboard.filters.selectedFilter {
            selectedFilters[filterId] = [selectedFilter.userId]
        }
        self.init(
            title: MKLocalizedString("Dashboard Title", comment: "Dashboard title"),
            items: items,
            filters: filterItems.count > 1 ? [filter] : [],
            selectedFilters: selectedFilters
        )
    }
}
