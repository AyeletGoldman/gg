# MaisonKit

![Tests](https://github.com/lvmh-clienteling/maisonkit/workflows/Test/badge.svg)
![Documentation](https://github.com/lvmh-clienteling/maisonkit/workflows/Documentation/badge.svg)
![SwiftLint](https://github.com/lvmh-clienteling/maisonkit/workflows/SwiftLint/badge.svg)

For MaisonKit's latest documentation, visit [our documentation site](https://lvmh-clienteling.github.io/maisonkit-docs/master/)

## Example

To run the example project, clone the repo, run `bundle` from the base folder and then and run `bundle exec pod install` from the Example directory.

## Requirements

- Cocoapods

## Installation

MaisonKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MaisonKit'
```

then change directory to the `Example` directory and run

```bash
bundle exec pod install
```

## Authors

- Thomas Carton, thomas.carton.ext@lvmh.com
- Nehora Sharabi, nehoras@balink.net
- Shlomo Ariel, shlomoa@balink.net
- Kerr Marin Miller, kerr.miller.ext@lvmh.com

## Development

To get started developing for MaisonKit, visit [our getting started guide](https://lvmh-clienteling.github.io/maisonkit-docs/master/getting-started.html)

### Testing

To run the tests run `bundle exec fastlane test`

## Releasing a new version of this pod

The easiest way to release a new version of this pod is via the `release-maisonkit` GitHub action. You can find it in the actions tab: https://github.com/lvmh-clienteling/maisonkit/actions.

### Manually

Make sure the podspec passes validation

`bundle exec pod lib lint --sources='https://github.com/lvmh-clienteling/ios-pod-specs.git,https://github.com/CocoaPods/Specs' --verbose --allow-warnings --private`

Push to the private specs repo

`bundle exec pod repo push lvmh-clienteling MaisonKit.podspec`

## Releasing a new version of the example app to stakeholders

To release a new version of the example app, run the "Distribute" action in GitHub: https://github.com/lvmh-clienteling/maisonkit/actions/workflows/distribution.yml

## License

MaisonKit is under a private license.
