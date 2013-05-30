# About This Template #
This project contains two iOS templates. "Basic" is designed to work standalone as a starting point for iOS applications with Facebook connectivity built-in. "Parse" is defiend to work with Parse as its back-end. "Server-Based" is designed to work in concert with a [Rails-based server](http://github.com/CoolAssPuppy/Rails_template) template. Together, the templates will save you 1-3 days of setup grunt work and include:

1. An Xcode template that, with one double-click, will generate a working iOS application with Facebook integration via the [Facebook iOS SDK](http://developers.facebook.com).
2. A Rails Application Template that, with one command line instruction, will generate a complete Rails server to manage the User model and house any other business logic you'd like to create for your application.
3. A clean, easy to understand and learn networking implementation (using [AFNetworking](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking) and JSON) that handles communication between the iOS client and server.

# Installing and Using This Template #
Installing and using the template is pretty easy.

### Initial Installation ###
You'll only have to do this once.

1. If you plan on using the "Server-Based" template, follow the instructions for downloading and setting up your Rails server using the accompanying [Rails Application Template](http://github.com/CoolAssPuppy/Rails_template).
2. Download the ZIP file containing all of the contents of this template.
3. Name the unzipped folder something you'd like to see in Xcode (e.g., "Facebook") and copy it to your ~/Library/Developer/Xcode/Templates folder.

### Create a Facebook App ###
You'll follow the remainder of these instructions each time you want to use the template to create a new app.

First, we need to create a Facebook app.

4. Follow the [instructions](https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/3.1/) (in Step 4) to create a Facebook App.
5. Once the app is created, visit the [Developer Apps](https://developers.facebook.com/apps) page and click on it in the left navigation area.
6. Click the "Edit Settings" link under the Settings banner (near the right margin).
7. Click on the checkmark next to the "Native iOS App" entry and add your bundle identifier.
8. A bundle identifier should take the form of com.yourcompanyname.yourappname. For example, com.facebook.shuttlefinder. This should match exactly the bundle identifier specified in the Info.plist file of your Xcode project (below).
9. Take note of your "App ID" and the bundle identifier for later steps.

### Template Instructions ###
Now we'll go into Xcode and start building our app!

10. Fire up Xcode.
12. Select File > New Project.
13. In the "Choose a template for your new project" dialog, look in the iOS section of the left navigation for the name of your folder in step 3.
14. Double-click on the icon corresponding to the type of app you'd like to build in the "Choose a template" dialog box.
14. Supply your Product Name. This should be the same as the "yourappname" section of your bundle identifier in step 8.
15. Supply your Company Identifier. This should be the same as the "com.yourcompanyname" section of your bundle identifier in step 8.
16. Supply your Facebook App ID and Facebook Display Name.
17. If you're going to use the Parse template, supply your Parse Application ID and Parse Client Key.
18. After clicking next, you need to go into the Info.plist file and modify the Facebook App ID in two locations and replace the underscore with the first digit of your Facebook App ID. An Apple "feature" prevents us from copying the first character of a string comprised of all numbers.

### Add Libraries ###
The iOS template is dependent on external libraries:

+ The [Facebook SDK for iOS](http://developers.facebook.com/ios) is Facebook's library for managing login, interaction with the built-in functionality in iOS 6.0, and presenting view controllers for managing friends lists, places, and other information. Every template requires this library.
+ The [Parse SDK for iOS](http://www.parse.com) provides all the functionality you need to connect to Parse as your back-end service.
+ The AFNetworking stack is a great library for communicating with back-end services (such as our Rails Application Template). This template only scratches the surface of the stuff AFNetworking can do.

These libraries change frequently, so rather than bundling them in our template, we've made these final steps manual. Forgive us.

19. Download the latest [Facebook iOS SDK](http://developers.facebook.com/ios) and install it according to the instructions.
20. Download the latest [Parse SDK for iOS](http://www.parse.com) and install it according to the instructions.
21. Follow the [instructions](https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/3.1/) to add the Facebook SDK to your Project.
22. If you're planning on using the "Server-Based" template, follow the [instructions](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking) to download and install the AFNetworking library.
23. Compile and run your application in the iOS 6.0 Simulator.

That's it!

# Additional Resources #
There are two absolutely invaluable resources for all beginners wanting to build iOS apps that connect to Rails servers:

1. Want to learn iOS programming VERY quickly and correctly? Check out the Big Nerd Ranch Guide: [iOS Programming](http://www.amazon.com/iOS-Programming-Edition-Guides-ebook/dp/B007OWBAB0/ref=kinw_dp_ke). This is a truly outstanding book.
2. Want to become a Rails ninja? You have to start with the [Ruby on Rails Tutorial](http://ruby.railstutorial.org) by Michael Hartl. You won't be disappointed.

# Pay it Forward #
Be excellent to each other!