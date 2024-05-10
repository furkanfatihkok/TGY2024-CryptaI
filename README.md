# CryptaI

<p align="center">
  <img src="file:///Users/ffk-/Desktop/Screenshot%202024-05-04%20at%2022.59.25.png" alt="Getir Lite App Icon" width="150" height="150">
</p>

<div align="center">
  <h1>CryptaI Project by Furkan Fatih Kök</h1>
</div>


 ## Screenshots

| Image 1                | Image 2                | Image 3                |
|------------------------|------------------------|------------------------|
| ![Listing1](https://github.com/lochmidth/GetirFinalProject/blob/main/Screenshots/Listing%20Empty.pngs) | ![Listing2](https://github.com/lochmidth/GetirFinalProject/blob/main/Screenshots/Listing%20with%20Products.pngs) | ![Detail1](https://github.com/lochmidth/GetirFinalProject/blob/main/Screenshots/Product%20Detail%20Empty.pngs) |
| Onboarding Screen    | Filtering Coins    | Coins Detail   |

## Tech Stack

- **Xcode:** Version 15.3
- **Language:** Swift 5.10
- **Minimum iOS Version:** 15.0
- **Dependency Manager:** SPM

## Architecture

![Architecture](https://www.spaceotechnologies.com/wp-content/uploads/2024/03/iOS-MVVM-Architecture-in-Swift.png)


### Unit Tests

- I provided the filtering process of the sections.
- Sort Coins

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- Xcode installed

Also, make sure that these dependencies are added in your project's target:

- [Alamofire](https://github.com/Alamofire/Alamofire): Alamofire's compact syntax and extensive feature set allow requests with powerful features like automatic retry to be written in just a few lines of code.
- [SDWebImage](https://github.com/SDWebImage/SDWebImage): SDWebImage is a popular asynchronous image download and caching library for iOS and macOS apps. This library prevents thread congestion and ensures a smooth user experience when downloading and caching your images from the internet.
- [XIBView](https://github.com/furkanfatihkok/XIBView): My XIBView package is a package that contains mandatory XIB methods when we create a custom view.


### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/furkanfatihkok/TGY2024-CryptaI.git
    ```

2. Open the project in Xcode:

    ```bash
    cd CryptaI
    open CryptaI.xcodeproj
    ```
3. Add required dependencies using Swift Package Manager:

   ```bash
   - Alamofire
   - SDWebImage
   - XIBView
    ```

6. Build and run the project.

## Usage

###  Onboarding Screen

<p align="left">
  <img src="https://github.com/lochmidth/GetirFinalProject/blob/main/Screenshots/ListingGIF.gifss" alt="Listing" width="200" height="400">
</p>

###  Coins Screen

1. Open the app on your simulator or device.
2. Browse the coins, click on the sections to see the values of the coins.
3. Go to Coin Detail by tapping on the relevant coin.

<p align="left">
  <img src="https://github.com/lochmidth/GetirFinalProject/blob/main/Screenshots/ListingGIF.gissf" alt="Listing" width="200" height="400">
</p>

---

### Coin Details 

1. Look at the chart for the coin.
2. Check the coin status with the search action to look for other coins.

<p align="left">
  <img src="https://github.com/lochmidth/GetirFinalProject/blob/main/Screenshots/ProductDesstailGIF.gif" alt="Listing" width="200" height="400">
</p>

---
