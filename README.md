# CryptaI

<p align="center">
  <img width="146" alt="CryptaI-Icon" src="https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/5bab47e2-2fa5-4e29-a371-86ab3b465766">
</p>


<div align="center">
  <h1>CryptaI Project by Furkan Fatih Kök</h1>
</div>

 ## Screenshots

| Image 1                | Image 2                | Image 3                |
|------------------------|------------------------|------------------------|
| ![Onboarding Screen](https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/ff55ce65-6aaf-4bc5-b401-4b2f88bb773f)|![Coins Scren](https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/8db51886-6b8a-48f6-a0c8-fe1f2d2f9710)| ![Detail Screen](https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/e9eb7b00-c2b0-452f-a13d-7608adb7c751) |
| Onboarding Screen    | Filtering Coins    | Coins Detail   |

## Tech Stack

- **Xcode:** Version 15.3
- **Language:** Swift 5.10
- **Minimum iOS Version:** 15.0
- **Dependency Manager:** SPM

## Architecture

![Architecture](https://benoitpasquier.com/images/2018/01/mvvm-pattern.png)



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
  <img src="https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/8de9557b-9665-4cdd-851f-be2b3a6b6876" alt="Onboarding Screen" width="200" height="400">
</p>

###  Coins Screen

1. Open the app on your simulator or device.
2. Browse the coins, click on the sections to see the values of the coins.
3. Go to Coin Detail by tapping on the relevant coin.

<p align="left">
  <img src="https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/20981c0c-7747-4c2d-8881-597813fb4e35" alt="Coins Screen" width="200" height="400">
</p>

---

### Coin Detail

1. Look at the chart for the coin.
2. Check the coin status with the search action to look for other coins.

<p align="left">
  <img src="https://github.com/furkanfatihkok/TGY2024-CryptaI/assets/113316242/063d80dd-8259-4a05-827d-203f50824664" alt="Coin Detail" width="200" height="400">
</p>

---
