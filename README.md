# About This Template #
This project contains two iOS templates. "Basic" is designed to work standalone as a starting point for iOS applications with Facebook connectivity built-in. "Server-Based" is designed to work in concert with a [Rails-based server](http://github.com/CoolAssPuppy/Rails_template) template. Together, the templates will save you 1-3 days of setup grunt work and include:

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

9. Fire up Xcode.
10. Select File > New Project.
11. In the "Choose a template for your new project" dialog, look in the iOS section of the left navigation for the name of your folder in step 3.
12. Double-click on the "Nerds" icon that will show up on the right-hand side of the "Choose a template" dialog box.
13. Supply your Product Name. This should be the same as the "yourappname" section of your bundle identifier in step 8.
14. Supply your Company Identifier. This should be the same as the "com.yourcompanyname" section of your bundle identifier in step 8.
15. Supply your Facebook App ID.
16. After clicking next, you need to go into the Info.plist file and modify the Facebook App ID in two locations and replace the underscore with the first digit of your Facebook App ID. An Apple "feature" prevents us from copying the first character of a string comprised of all numbers.

### Add Libraries ###
The iOS template is dependent on two libraries. The Facebook iOS SDK is Facebook's awesome library for managing login, interaction with the built-in functionality in iOS 6.0, and presenting view controllers for managing friends lists, places, and other information. The AFNetworking stack is a great library for communicating with back-end services (such as our Rails Application Template). This template only scratches the surface of the stuff AFNetworking can do.

Both of these libraries change frequently, so rather than bundling them in our template, we've made these final two steps manual. Forgive us.

17. Download the latest [Facebook iOS SDK](http://developers.facebook.com/ios) and install it according to the instructions.
18. Follow the [instructions](https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/3.1/) to add the Facebook SDK to your Project.
19. If you're planning on using the "Server-Based" template, follow the [instructions](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking) to download and install the AFNetworking library.
20. Compile and run your application in the iOS 6.0 Simulator.

That's it!

# Additional Resources #
There are two absolutely invaluable resources for all beginners wanting to build iOS apps that connect to Rails servers:

1. Want to learn iOS programming VERY quickly and correctly? Check out the Big Nerd Ranch Guide: [iOS Programming](http://www.amazon.com/iOS-Programming-Edition-Guides-ebook/dp/B007OWBAB0/ref=kinw_dp_ke). This is a truly outstanding book.
2. Want to become a Rails ninja? You have to start with the [Ruby on Rails Tutorial](http://ruby.railstutorial.org) by Michael Hartl. You won't be disappointed.

# Pay it Forward #
You may (or may not) be a beginner now, but in a few months you definitely won't be. Remember your obligation to the folks behind you on the learning curve. We're all in this together and our community becomes stronger when you take the time to build resources that speed your and everyone else's development, contribute to great communities like Stack Overflow, and enthusiastically recommend resources that you find extraordinarily helpful.

Be excellent to each other!