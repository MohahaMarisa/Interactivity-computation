import rita.*;
String[] verbs = {};
String[] rawKindness = {
   "A coworker hired me for extra work, because she knew I was trying to save up money. At first I was hesitant to accept because she asked me before she asked her assistant, but it was okay with the assistant. I was grateful that she thought of me for the task, which was something I would have been happy volunteering to do.",
 "My neighbor stopped by my house and brought me a cinnamon broom. Those are those little straw brooms that you see in the stores in the fall that make the house smell really nice. It was so sweet of her and so unexpected! It made me very happy and it makes me happy every day when I see it.",
"I was in a hurry to get to the train station and cursed out a woman under my breath as I passed her.  Then, my wallet fell out of my pocket and onto the street.  She picked it up and handed it to me.  I thanked her sincerely and felt like a huge heel!",
"I was waiting on my friend to get back from doing something while in a Skype call with her.  We were about to play a game, however, she had told me to wait.  As soon as she got back, I had gotten an in-game notice stating she bought me an in-game item I have been wanting for quite some time, I was really shocked as she had already given me a couple other things prior to this so it was very unexpected and a huge surprise to me since I didn't ask for it.",
 "I was a single, 18 year old mother with my 1 year old daughter. I had just moved into my own place that was across the street from Walgreens. We walked together to grab some bread and applesauce. I was so embarrassed to be paying in change, and it was obvious the cashier was less than thrilled. As we were walking back across the street and go into the apartment complex a truck pulled up along side me. It was a husband and wife who told me I shouldn't be embarrassed and to be proud of how hard I was working. I was already in tears, and then they handed me a $20 bill, and that they'd pray for me. ",
 "This was over 10 years ago and I've never forgotten that moment. Still makes me tear up :)",
 "I was 7 months pregnant with my first child. My husband and I were visiting my parents and siblings who lived 9 hours away. I thought we were just picking up a crib my parents had bought us. Upon entering my parents house, we were surprised to see a bunch of close family and friends. It was a surprise baby shower for us! We were so happy to see everyone and receive so many, many gifts.",
 "I was in a very desperate financial situation and my best friend knew about it. So he knocked on my door and handed me $20. I was so, so thankful and grateful for that act, because I was able to buy food. I love him.",
 "I had a tire blow out on a rainy night while going off an off-ramp in the middle of nowhere.  A cop pulled over to see if I was alright, and let me borrow his umbrella.  He stayed there until I got my tire changed to make sure I was safe.",
 "My Mom recently made my husband and I sauerkraut with fresh rice (one of my favorite foods of hers). I was surprised and thrilled that she had made it for us - and also relieved, because we don't know how to cook that much nor have much money, and needed some healthy food desperately.",
 "My mother made me food when I was sick. She also helped me pay a bill to. It made me feel great and relived. It was a surprise.",
 "I stopped at a gas station last week because my car had ran out of gas. When I got to the station I realized I didn't have my wallet. Frantically looking around my car a nice woman asked if something was wrong to which I explained to her that I left my wallet. She offered to give me 5$ for gas to get on my way.",
 "I was at the grocery store just trying to buy a few things for dinner that night. Nothing real expensive, about $15-$20 worth of stuff. My card got declined. I had no other payment. I was going to leave the stuff there when the person in line behind me offered to just pay for it. I was really grateful and also super shocked because you don't see that kind of thing anymore.",
 "My car had broken down taking my kids to school. Another mother drove by and offered to take my kids to school. Then she was kind enough to return, picked me up and drove me home.",
 "I am usually the one to make sure the laundry is done for everyone in the house. For a few weeks I had been working really hard, trying to get in a lot of overtime, and in between working from home one evening I put a load of clothes in the washer. I completely forgot about them and before I fell into bed I remember the clothes. I rushed out to the washer to put the clothes in the dryer and saw my son had not only tried the clothes, but had folded them. I got tears in my eyes for how nice that felt.",
 "To be honest I had hard times remembering anything.. A couple weeks ago I was at the groceries store, an old man and I going to the cashier, he was in front of me: he picked the left line and I continued to the right. His line was going to be closed with the client before him so he moved to my line. I told him to pass in front of me and he replied he wasn't in a hurry because he was retired.",
 "One nice thing that someone did for me recently that I wasn't expecting was when my dad went to Trader Joe's and bought healthy food for me after I had been feeling unwell. He usually shops at a different grocery store , but he did it because he knew that it would be food that I would like.",
 "I was in the office before lunchtime somene gave me a candy, . It was super unexpected, I felt super good. I really I needed",
 "My sister surprised me by leaving fruit snacks at my front door the other day. I love fruit snacks. It was a small thing, but made my day.",
 "I was given a really nice compliment at work.  I was told I inspired someone to improve at their job and she got a promotion because of it.  It was incredibly heartwarming.",
 "I was in the drive-thru to pick up my starbucks for my office.  As I pulled up to the window, the barista told me that my order had been paid for by the car in front of me.  I was extremely grateful for the kindness and paid it forward when I could.",
 "It was late at night, and I had just gotten out of the gym. I walked to the parking lot, got in my car, and tried to start it, and the battery was dead. A fellow gym-goer came out shortly after, and I guess he heard me repeatedly try and start my car, which was unsuccessful. He walked up to my window and asked me if I needed a jump - and I said absolutely, yes, thank you! He pulled his car around, we got the batteries connected, and 30 seconds later I was on my way. What a life-saver! I was relieved to not have to waste money calling roadside assistance, and was quite frankly seriously positively surprised that someone would go out of their way to help me. It was very heartening, and I now make it a point to 'pay it forward' as far as these sorts of little kindnesses go.",
 "I was really tired and we were out of coffee. I had to go to a 7 hr online trainig class and didnt know how I'd make it through. My husband shows up with coffee for me, I was so happy and grateful.",
 "Our HR Manager was making cheese, egg and ham biscuits for everyone to enjoy one morning. I am a vegetarian and the ham was mixed in so I would not have been able to partake of the goodies. However she surprised me by making 4 separate ham  free biscuits just for me.  It was a very nice and welcome treat!",
 "My buddy let me sleep on his couch for a week.  I really needed a friend right then.  Felt great to have one pull through for me.",
 "I recently was cleaning my home and wanted to get rid of a lot of items around the house. I started early in the morning and was extremely surprised at how well the house was looking, for the first time in over a year the clutter was gone. But I noticed  I had lots of stuff out by the curb and wondering now if the city will pick it up.",
 "To my surprise my neighbor who has a truck  came over and loaded all the garbage on his truck and took it to the dump.",
 "I was so relieved that it was all gone. I felt so blessed to have such a nice neighbor.",
"A young lady offered me her seat on the subway.  Now, at 63 I'm not that old but I do have gray hair.  I appreciated her offer though I did not take her up on it - what a kind young lady.",
"It was surprising group kindness.  I went to a dance class tonight and the cirque class was doing dive cart wheels.  I thought I could do them and asked to join in.  The teacher let me.  I was the last one and the others cheered really loud when I did it.  Normally, we don't cheer in class, so it was a big surprise!  I'm almost 3 times older than them...I guess that might be the reason....but am not sure.",
"I had had a really bad day and a friend that I had been texting about stuff I had been going through was there for me. She gave up the rest of her afternoon at work and showed up at my apartment and took me to lunch and then we just sat and talked. Totally unexpected. Glad she gave me time.",
 "I had taken the day off work because I was very tired. My mom stopped by just to bring me a can of coke which she knows is my favorite drink. I felt like someone cares about me.",
"I had a fight with my boyfriend and was walking around our neighborhood which was in a downtown area. A homeless person bought me a beer and talked about angels and God. It was a really touching moment. I felt as though it was a message from above even if that sounds ridiculous.",
"I was in between jobs and really eager to get my foot in my career. I had posted an article on Facebook about the type of career I wanted, nothing too long and nothing like rant. A friend read it and messaged me right away, telling me she had a cousin who was in that field. Without me being able to reply, I got a text message from the cousin saying how my friend had vouched for me and if I would be available for an interview. Fast forward to now and I am loving my job! It was such a helpful extended act of kindness that changed my life.",
"My husband made the bed yesterday. I know it sounds trivial but it was a really nice surprise to walk in on. I hate making beds and I also hate sleeping in unmade beds so it meant a lot to me. It made me feel special and appreciated.",
"My dog was sick and I had just brought my favorite goat buck in for a second surgery. I was stressed out and upset because I have no other family than my animals. I was telling all this to a cashier at an organic grocer store I shop at. She an I have been friendly for over a year. After listening to me she said it hurt her to see me so sad and she asked me if she could give me a hug. I haven't had a hug from anyone in years so it made me feel like I was cared about by someone in a genuine way. I felt touched and sad at the same time, realizing just how long it had been since anyone showed me a tender act of care.",
"I was recently on the side of the road with a flat tire and a sweet boy stopped and changed my tire for me. I felt really thankful and also know there is still some good in this world.",
"A person who I didn't expect to show sympathy, actually was very upset when I told him about my mother's recent death - he even wrote a note.",
"I was out to dinner at Outback Steakhouse with my family (5 of us). My 3 young kids were being somewhat challenging, and I was a little stressed and not really enjoying my meal.  When we were done, the waiter came to us and said someone at the bar had paid for our meal, tip and everything. We immediately looked up, and no one was there. I was so in shock, confused, and happy....it really made my day.  I posted about it on Facebook and thanked the stranger who paid for our meal, and promised to pay it forward. I received a lot of positive feedback and comments from people.",
"My female cousin once unexpectedly baked a cake and served me a piece. I felt this was quite unusual since she's normally lazy and never does things like this (for anyone), although the inverse is not quite the same. I enjoyed it and found it unusual (the gesture), but coined it as a random act of kindness from her.",
"I was trying to buy a house and someone offered me the money I needed to put down on the house. I was over joyed and shocked that someone would help me in that.",
"I was in a video store (ok not extremely recently but it is what came to mind) and talking to my daughter about what we could get because I had rent due and was really short on money and it was just a bad time in general.  The next thing I knew a somewhat scruffy-looking guy came up and handed me a five dollar bill and kept walking.  I just stood there in shock for a little bit.  I was a little embarrassed, but is was such a nice thing for somebody to have done.",
"The grocery store where I shop regularly was crowded. I had other important work to do and was short on time. The helper at the grocery store understood my predicament  and helped me pay my grocery bill by opening a new counter. He really made my day!",
"One day, I happened to be in a town quite unfamiliar to me. The people there spoke a different language which I could not understand well. Similarly, they could not understand what I was telling them. I wanted to go to a hotel run by somebody who speaks my language. I knew only my mother tongue besides English. There gathered a number of taxi drivers  around me to take advantage of my miserable situation. Seeing the pathetic condition I was in, a young man stepped forward and asked what the matter was. He spoke in good English. I felt very much relieved and happy. I explained my situation and requested him to help. First he assured me that he was not a con and showed me a chain around his neck to prove that he was a devotee of one of the local Gods. He then called one of the taxi drivers and gave instructions as to where to take me. The taxi took me to a hotel whose owner spoke the same language as mine. I felt greatly grateful to the person who helped me in this difficult situation.",
"A man let me go in front of him at the grocery store when I only had a few items and he had a cart full.  I was very relieved because I had a rowdy toddler with me.  It was very nice of him and I was very appreciative.",
"I was on my way to one of my hardest midterms last year, physics. Unexpectedly, a girl was handing out packets containing snacks and other various test supplies out on campus, which was a really nice.",
"A man I had just met, changed the flat tube in my tire five minutes before the mountain bike race that we were both competing in. He did this without hesitation. Amazing.",
"I just did some groceries. I got some extra snacks and drinks. I saw a homeless senior citizen resting on a bench, and decided on a whim to share my snacks and drinks.",
"I was having a really bad day out of nowhere. My mom showed up to my apartment and brought flowers. She does not even live in the same town as me. It was very thoughtful of her. I felt grateful for her.",
"I always strive for a clean house but rarely get it. Not only did I walk into a clean house after work on my Birthday, but my man also got me the most beautiful flowers! I always want nothing but flowers for my day and this time he came through and then some! It was awesome and made me feel good.",
};
JSONArray values;
void setup(){
  values = new JSONArray();

  for (int i = 0; i < rawKindness.length; i++) {

    JSONObject kindness = new JSONObject();

    kindness.setInt("pg", i);
    kindness.setString("kindness", rawKindness[i]);
    kindness.setString("verb1", verbs[i*5]);
    kindness.setString("verb2", verbs[i*5+1]);
    kindness.setString("verb3", verbs[i*5+2]);
    kindness.setString("verb4", verbs[i*5+3]);
    kindness.setString("verb5", verbs[i*5+4]);

    values.setJSONObject(i, kindness);
  }

  saveJSONArray(values, "data/rawKindness.json");
}

// Sketch saves the following to a file called "new.json":
// [
//   {
//     "id": 0,
//     "species": "Capra hircus",
//     "name": "Goat"
//   },
//   {
//     "id": 1,
//     "species": "Panthera pardus",
//     "name": "Leopard"
//   },
//   {
//     "id": 2,
//     "species": "Equus zebra",
//     "name": "Zebra"
//   }
// ]