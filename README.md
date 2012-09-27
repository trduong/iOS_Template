An awesome modern mobile application has three core components:

1. An engaging user experience that not only dazzles and excites your customers, but also helps them get complex tasks done with a minimum of intervention. This template won't help you be a great designer, but it will help you get a lot of grunt work out of the way so that you can focus your time and talent on writing great apps, which will, among many things, get you a lot of practice building things for customers.
2. [Social design](https://developers.facebook.com/socialdesign/) at the core of every element of the user experience. Sharing with friends, following other users, and liking items or otherwise expressing interest in components of your application all foster conversations between users and help you build intelligent interfaces that anticipate user desires.
3. Platform independence to support the widest possible range of users. In the US and other western countries, we often think of this as support for both iOS and Android. But consider mobile experiences that reach far more users, such as responsive web design. To execute on platform independence requires that you intelligently split the core logic of your application from the core user experience, often implementing the former on a hosted server and delivering tailored implementations of the latter for various platforms of importance to your target market.

# About This Template #
This iOS template is designed to work in concert with a [Rails-based server](http://github.com/CoolAssPuppy/Rails_template) template. Together, the templates will save you 1-3 days of setup grunt work and include:

1. An Xcode template that, with one double-click, will generate a working iOS application with Facebook integration via the [Facebook iOS SDK](http://developers.facebook.com).
2. A Rails Application Template that, with one command line instruction, will generate a complete Rails server to manage the User model and house any other business logic you'd like to create for your application.
3. A clean, easy to understand and learn networking implementation (using [AFNetworking](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking) and JSON) that handles communication between the iOS client and server.

# Installing and Using This Template #
Installing and using the template is pretty easy.

### Initial Installation ###
You'll only have to do this once.

1. Follow the instructions for downloading and setting up your Rails server using the accompanying [Rails Application Template](http://github.com/CoolAssPuppy/Rails_template).
2. Download the ZIP file containing all of the contents of this template.
3. Copy the unzipped folder to your ~/Library/Developer/Xcode/Templates folder.

### Repeat Instructions ###
You'll follow the remainder of these instructions each time you want to use the template.

4. Fire up Xcode.
5. Create a new Project.
6. In the "Choose a template for your new project" dialog, search for the entry named "Strategic Nerds" in the iOS section on the left navigation.
7. Double-click on the "Nerds" icon that will show up on the right-hand side of the "Choose a template" dialog box.
8. Congratulations! It's an IOS Application! Take this moment to grab a cigar, kick your feet up, and pat yourself on the back.
9. No, really. Enjoy this moment. Bask in the glory of your awesomeness.

### Add Libraries ###
The iOS template is dependent on two libraries. The Facebook iOS SDK is Facebook's awesome library for managing login, interaction with the built-in functionality in iOS 6.0, and presenting view controllers for managing friends lists, places, and other information. The AFNetworking stack is a great library for communicating with back-end services (such as our Rails Application Template). This template only scratches the surface of the stuff AFNetworking can do.

Both of these libraries change frequently, so rather than bundling them in our template, we've made these final two steps manual. Forgive us.

10. Download the latest [Facebook iOS SDK](http://developers.facebook.com/ios) and install it according to the instructions.
11. Follow the [instructions](https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/3.1/) (particularly step 5!) to add the Facebook SDK to your Project.
12. Follow the [instructions](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking) to download and install the AFNetworking library.

That's it!

# Additional Resources #
There are two absolutely invaluable resources for all beginners wanting to build iOS apps that connect to Rails servers:

1. Want to learn iOS programming VERY quickly and correctly? Check out the Big Nerd Ranch Guide: [iOS Programming](http://www.amazon.com/iOS-Programming-Edition-Guides-ebook/dp/B007OWBAB0/ref=kinw_dp_ke). This is a truly outstanding book.
2. Want to become a Rails ninja? You have to start with the [Ruby on Rails Tutorial](http://ruby.railstutorial.org) by Michael Hartl. You won't be disappointed.

# Pay it Forward #
You may (or may not) be a beginner now, but in a few months you definitely won't be. Remember your obligation to the folks behind you on the learning curve. We're all in this together and our community becomes stronger when you take the time to build resources that speed your and everyone else's development, contribute to great communities like Stack Overflow, and enthusiastically recommend resources that you find extraordinarily helpful.

Be excellent to each other!