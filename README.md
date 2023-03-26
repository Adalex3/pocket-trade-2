# Inspiration
In an increasingly materialistic society that does not bode well for the already-dying planet, it is now more important than ever to reconsider uses for bygone households objects which have passed their prime. Should you really be throwing out that old chair? Are you sure no one could find a use for that shirt that shrunk just a little too small in the wash?

The idea for Pocket Trade stemmed from a hope that an app could be used to promote sustainability, environmentalism, and recycling in a way that also elevates a local community and provides a safe, easy way to find undiscovered treasure.

# What it does
On the surface, Pocket Trade may seem like another marketplace app, such as Facebook Marketplace or EBay. However, it is packed full of features that make it much more.

At the heart of Pocket Trade are two values: sustainability and community. Instead of purchasing a listed item with money as is seen in other similar apps, every transaction requires that both parties contribute a physical object to the Trade -- as the name suggests. This promotes sustainability since two objects are being regifted in each trade. And due to the fact that all Trades are with physical objects, Pocket Trade sources Trades from your local area, thus engaging neighbors in friendly communication and idea exchange.

The structure of the system goes something like this: you can upload Items -- anything you want, furniture, household decor, clothing, musical instruments, technology -- and these Items are sent to the Market -- the publicly accessible index of all available Trades in your area. If you are browsing the Market and see something interesting, you can request to Trade with its owner by presenting one of your own Items. If they accept, you can easily schedule a "Meetup" in-app, where you and the other party can meet in person to exchange goods. There is also an option to upload an Item as "private", so that no one can request to Trade, but you can offer it as a Trade for someone else's public Item.

At the Meetup, to promote the aforementioned sense of community, we require the users to engage in a original way to confirm that a Trade has been successfully completed. This comes in the form of a "Fist Bump" that the users must do to signal to the app that the Trade is done -- bumping the phones together! Not to mention it is extremely satisfying to feel the custom-designed haptic "explosions" that enhance the experience even further when you "phone bump".

Privacy and safety are extremely important to us, which is why we developed some novel features that fix some otherwise gaping safety flaws in our plan. First of all, Meeting Up with a stranger can be quite dangerous. To aid this, a user can optionally add a "Third-Party" when scheduling a Meetup through Twilio. This Third-Party could be a trusted friend or family member that will receive an informational text message when the user arrives at the Meetup, stating that "Your friend is meeting up with a stranger. If they don't reach out to let you know they're okay soon, you should check up on them." We then remind the user after they've completed the Meetup to let their Third-Party know that all is well.

# How we built it
There are two portions of Pocket Trade that are intended to be eventually identical-- a Flutter web app / website, and a Swift iOS app. We have employed various services and frameworks across all of them to make them as feature-full as possible.

On the mobile app, we wanted to have a fully functional demo-worthy experience at the end of these 24 hours. We have fully featured menus, GUIs, and controls that allow you to do the aforementioned Item browsing, Trading, and Meetups. Built natively in iOS Storyboards using Swift, we crafted a new design language that highlighted robustness, reliability, and friendliness -- using deep purples, tree-like greens, and soft whites. We also focused heavily on structure, hand-picking various hues to ideally separate certain layers of views from others.

The reason we chose native Swift on iOS was to better incorporate native Apple frameworks into our app. We used a wide variety of frameworks including CoreLocation, MapKit, CoreMotion, and NearbyInteraction.

On the Flutter website, we implemented a fully functional back-end interaction system that allows us to create custom Items, upload a Firebase server, view, edit, and delete them.

Since we chose two completely different front end development systems, we learned A LOT in the realm of front end. In addition, the back end proved to be pretty dense -- a lot more difficult to implement than we thought...

# Challenges we ran into
Our biggest challenge by far was getting Firebase setup and incorporated into the website. That took us a whopping 10 hours to get going, but we eventually got it all working! We realized that our issues lied within our different operating systems, causing interruptions when trying to run.

Another challenge was balancing all of the different frameworks and libraries we were using. This was a vast project because we used both Flutter and Swift to make two completely separate front end experiences. Flutter posed the most problems however, due to how easy it is to get lost within widgets. While some time was lost, we were able to bring it all together properly in the end.

# Accomplishments that we're proud of
As mentioned before, we came across a lot of issues as we continued development of our service. However, we were able to innovate and find solutions to every single one of them in the time provided; that is probably the thing we are most proud of. Specifically, our intense struggle to incorporate Firebase into our service paid off greatly.

Additionally, we are proud of the safety features we added into the app, because they are not something we have ever seen before and could be very beneficial. When it came to design, finding creative ways to tie in the themes of environmental sustainability in our color schemes and graphics was very rewarding.

# What we learned
Working with Dart and Flutter throughout the development of our app allowed our team to gain a deeper understanding of Object-Oriented Programming principles and practices. We especially gained a thorough understanding of Firebase tools such as Firebase Storage and Firestore through our work integrating the technologies into our project. Additionally, as half our team consisted of first-time hackers, this was their first time designing, creating and finishing a project from scratch.

# What's next for Pocket Trade
Our main goal would be to standardize and expand our two platforms so that they have the same feature base and interact with the same backend. After that, we'd implement a user authentication / account creation system to provide a personalized service to Pocket Trade users to help keep track of their own listings and trades. Finally, we could optimize our service for scale, and we'd be just about ready for a real launch! We got a LOT more done in 24 hours than we ever thought we could!
