//  Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct NPSDetailsView: View {

    private enum Labels {
        static let viewClientProfileLabel = MKLocalizedString("nps.rating-details.client-profile.button.title",
                                                              comment: "The title of the button that will take the user to the client profile")
        static let summaryLabel = MKLocalizedString("nps.survey.summary-section.title",
                                                    comment: "The title of the summary section in the NPS details screen")
        static let viewFullSurveyLabel = MKLocalizedString("nps.summary.full-survey.button.title",
                                                           comment: "The title of the button that will take the user to the full client survey details")
    }

    @ObservedObject private var viewModel: NPSDetailsViewModel

    init(viewModel: NPSDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ResultStateViewBuilder(result: self.viewModel.displayable).setLoadingView {
            self.buildView(for: .loadingDisplayable)
        }.buildContent { displayable in
            self.buildView(for: displayable)
        }
    }

    @ViewBuilder
    private func buildView(for displayable: NPSDetailsDisplayable) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                self.buildRatingDetails(with: displayable)
                StyledDivider()
                Group {
                    if let summary = displayable.summary {
                        self.buildSummary(with: summary)
                            .addStyledRowDivider()
                    }
                    TimelineView(timelineInfo: .found(TimelineDisplayable(sections: self.getTimelineSections(from: displayable),
                                                                          filters: [])),
                                 selectedFilters: .constant([]),
                                 filterTapped: { _ in },
                                 onSelectTimelineEntry: self.viewModel.onSelectTimelineEntry(_:))
                }.padding(.horizontal)
                Spacer()
            }
        }
    }

    private func getTimelineSections(from displayable: NPSDetailsDisplayable) -> [TimelineDisplayable.Section] {
        if let transaction = displayable.transactionDetails {
            return [
                self.viewModel.createTimelineSection(for: transaction)
            ]
        }
        return []
    }

    private func buildRatingDetails(with displayable: NPSDetailsDisplayable) -> some View {
        StylableGroup("rating-details") {
            VStack(alignment: .center, spacing: 0) {
                Text(displayable.clientName)
                    .style("title")
                    .padding(.top, 18)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity)
                BadgeView(title: displayable.source.displayableValue)
                    .badgeViewStyle(SecondaryBadgeViewStyle(verticalPadding: 3))
                    .padding(.bottom, 10)
                if let clientID = displayable.clientID {
                    TertiaryButton(buttonData: ButtonData(label: Labels.viewClientProfileLabel,
                                                          icon: "icon-right",
                                                          iconPosition: .trailing,
                                                          action: {
                        self.viewModel.didTapViewClientProfile(clientID)
                    }))
                    .padding(.bottom, 5)
                }
                HStack(spacing: 25) {
                    Progress(maximumScore: displayable.score.maximumValue,
                             score: displayable.score.value,
                             variant: displayable.score.identifierVariant)
                    Text(displayable.score.displayableValue)
                        .style("body")
                }.padding(.bottom, 14)

            }.padding(.horizontal)
        }
    }

    private func buildSummary(with summary: String) -> some View {
        StylableGroup("note") {
            Text(Labels.summaryLabel).style("title")
                .padding(.bottom, 7)
                .padding(.top, 17)
            Text(summary).style("body")
                .padding(.bottom, 14)
            TertiaryButton(buttonData: ButtonData(label: Labels.viewFullSurveyLabel,
                                                  icon: "icon-notes",
                                                  iconPosition: .leading,
                                                  action: {
                self.viewModel.didTapViewFullSurvey()
            }))
            .padding(.bottom, 17)
        }
    }
}

extension NPSDetailsDisplayable {
    static var loadingDisplayable: NPSDetailsDisplayable {
        return NPSDetailsDisplayable(clientName: "Example name",
                                     source: "Some category",
                                     clientID: "123-asd",
                                     summary: "Summary should be a long text that wraps a few lines and is shown below the rating",
                                     score: NPSScore(value: 8, maximumValue: 10, identifierVariant: "disabled"),
                                     transactionDetails: .loading)
    }
}

extension TimelineItemDisplayable {
    static var loading: TimelineItemDisplayable {
        return TimelineItemDisplayable(id: UUID().uuidString,
                                       filterId: "",
                                       date: Date(),
                                       title: "",
                                       footer: "Example Advisor",
                                       mediaItems: [.image(source: .loadingPlaceholder),
                                                    .image(source: .loadingPlaceholder),
                                                    .image(source: .loadingPlaceholder)])
    }
}
