# MaisonKitAuth

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

MaisonKitAuth is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MaisonKitAuth'
```

## Usage

Once you have installed the pod, configure it with the URLs for authentication and token retrieval/refresh. You can do this in your app delegate:

```swift
let authorizationEndpoint = URL(string: "https://www.example.com/authenticate")!
let tokenEndpoint = URL(string: "https://www.example.com/token")!
MaisonKitAuth.configure(withAuthURL: authorizationEndpoint, tokenURL: tokenEndpoint)
```

This tells MaisonKitAuth what URLs it will use. When you are ready to authenticate, call `beginAuthentication`. You will have to pass the details of your OAuth2 client, the scopes and the redirect URL in a `OAuth2Details` object. You will also have to provide a `UIViewController` to present the authentication from. This will present the authentication view and start the process:

```swift
let info = OAuth2Details(credentials: OAuth2Details.Credentials(clientId: "some_client_id",
                                                                clientSecret: "some_client_secret"),
                             scopes: [.openId, .profile],
                             redirectURL: URL(string: "your_return_url")!)

MaisonKitAuth.beginAuthentication(oauth2Details: info,
                                  presentingController: self,
                                  completion: { [weak self] result in
                                    switch result {
                                    case .success(let authToken):
                                        // authToken is your access token to make authenticated requests
                                        break
                                    case .failure(let error):
                                        // Something bad happened
                                        break
                                    }
                                  })

```

Once you have logged in, you can retrieve the current access token via `retrieveCurrentAccessToken`:

```swift
let currentToken = MaisonKitAuth.retrieveCurrentAccessToken()
```

If you need to refresh your access token, call  `refreshToken`:
```swift
MaisonKitAuth.refreshToken { result in
    // result is a Result<AuthenticationToken, Error> that will either hold the new token or an error
}
```

To log out, simply call `logout`:
```swift
MaisonKitAuth.logout { success in
    // success is a bool indicating whether the logout was successful or not
}
```

## Tests

You can run the tests inside the example project.

## Author

Kerr Marin Miller, k.miller-ext@lvmh.fr

## License

MaisonKitAuth is available under a private license. See the LICENSE file for more info.
