
class PromptConfig {
  final String prompt;
  int? duration;
  String? followUp;

  PromptConfig(this.prompt, [this.duration, this.followUp]);
}

List<PromptConfig> originals = [
  PromptConfig('#player, your not this lazy, are you? High five every player or take a shot' ),
  PromptConfig('#player tickel #player1 or take one shot for each sock they are wearing' ),
  PromptConfig('#player, you are now mute, each word is a drink', 4, '#player, you can talk again' ),
  PromptConfig('VOTE: would you rather (1) lick a sidewalk, or (2) be licked by a stray dog' ),
  PromptConfig('#player is now a Parrot, repeate every prompt, failure to do so results in a shot', 3, 'Bye Bye birdy, #player does not have to repeat anymore' ),
  PromptConfig('#player give a shot for each player of the opposite gender, you\'re non binary? Double it' ),
  PromptConfig('VOTE: would you rather be a pancake or a waffle? Losers drink 3 times'),
  PromptConfig('VOTE: "yes yes yes yes yes" or "Oh Fuck!"? Winners drink 2 times'),

];

List<PromptConfig> stolen = [
    PromptConfig("VOTE: If there was a fight where there are 4 people against one, would you get involved or call the police? Losers must drink 3 sips"),
    PromptConfig("#player0, think of something you would do if you were rich. Go around the room and get your friends to guess. The first one to find out gives 2  sips. #player1 starts"),
    PromptConfig("#player0, if you stay quiet for 5 minutes, you can choose someone to finish his/her drink!"),
    PromptConfig("Would you rather die having your head stuck in elevator doors or slipping on a banana peel? Everyone vote at the same time, losing group drinks 2 times"),
    PromptConfig("#player0, give out 2 sips to the person you think is the most clever in the room"),
    PromptConfig("Everyone decides who is the largest player, Hulk will get 2 sips", 4, "Chuck Norris can't bare that, Hulk must take s 4 more sips"),
    PromptConfig("#player0, if you feel like you must cuddle the dog when it's in the room, drink 2 times. Otherwise give out 3 sips"),
    PromptConfig("Drink 5 sips if you've ever pulled your stomach in with your shirt off, in order to look more  appealing"),
    PromptConfig("#player0, use your mobile phone. Ask #player1 to guess the cartoon that you will share in less than 12 seconds. If they guess right, the other  players have to drink 4 sips. Otherwise you have  to drink them. iz"),
    PromptConfig("Chicken Run"),
    PromptConfig("#player0, give out 2 sips to the most beautiful person in your point of view"),
    PromptConfig("BOTTOMS UP  #player0, choose whether #player1 or #player2 must down it all"),
    PromptConfig("\"Movies where the final scene is a fight between the good guy and the bad guy???, the first to run out of ideas drinks 3 times. #player0, you start"),
    PromptConfig("Give out 4 sips if you've ever said no to a f*cking handsome guy or hot woman"),
    PromptConfig("#player0, give out 3 sips to a player sillier than you... If it's impossible, drink them"),
    PromptConfig("#player0, imitate a snake for 5 seconds or drink 4 times"),
    PromptConfig("The last person to put their thumb on the table drink 4 times"),
    PromptConfig("#player0 and #player1, switch glasses", 8, "#player0 and #player1, take back your own glass"),
    PromptConfig("#player0, make up your mind: which player do you think is more useless at playing video games, #player1 or #player2? The Loser must drink 4 SIDS ,"),
    PromptConfig("#player0, if you don't like taking a shit while your partner is around, drink 3 times. Otherwise give out 2 sips"),
    PromptConfig("#player0, if you've ever broken up with somebody by text message, give out 4 sips. If not, drink 2 times."),
    PromptConfig("The first person to pull out a condom, give out 2 sips"),
    PromptConfig("Would you rather never leave your country of origin or never drive a car? Vote at the same time, losers must drink 2 sips"),
    PromptConfig("#player0, post something dumb (on a social app of your choice). The sentence must contain the words \"jerk off\", \"cucumber\", \"pedestrian\" and  \"#player1\", Or down  your drink"),
    PromptConfig("Drink 2 times if you say \"I love you\" to your boyfriend/girlfriend at the end of every phone call... or almost"),
    PromptConfig("#player0 you say \"In my suitcase, there is...\", and start by adding one item. Each player repeats the items in the suitcase and adds on one new item. First person to fail, drinks 3 times!"),
    PromptConfig("\"Mechanic's tools\", the first to run out of ideas drinks 3 times. #player0, you start"),
    PromptConfig("Go around the room, spell the last name of the person to your right. Those who fail drink 4 times, #player0 you start!"),
    PromptConfig("#player0, if you like one of Justin Bieber's songs, drink 3 times"),
    PromptConfig("\"Movies about the end of the world\", the first to run out of ideas drinks 5 times. #player0, you start"),
    PromptConfig("#player0, if you manage to offer a sip to a player (from your glass) before the end of the game, the receiver will have to finish their drink"),
    PromptConfig("#player0, make up your mind: who do you think knows the lyrics from ???Let It Go??? (Frozen) better, #player1 or #player2? Snow Queen must drink 2 SIPS ,"),
    PromptConfig("#player0, if you know all of #player1's names (first, middle, last), this player will drink 3 times. Otherwise you'll drink 3 times"),
    PromptConfig("#player0, tell #player1 to drink as many times as you want"),
    PromptConfig("The next player who has to drink gives out 4 sips"),
    PromptConfig("#player0, take a sip of your drink and then hum a song. The first person to guess the song correctly can give out 3 sips"),
    PromptConfig("Everyone put down your glass and pick up the glass to the right of you", 5, "Take your glass back!"),
    PromptConfig("All players swap drinks from left to right. #player0, drink 2 times before leaving it", 4, "Take your glass back!"),
    PromptConfig("#player0, make up your mind: who do you think has worse taste in music, #player1 or #player2? DJ Poopman must drink 2 sips"),
    PromptConfig("Would you rather continually bore the people with whom you speak, or be unable to watch the second half of movies? Vote at the same time, losers must drink 2 sips"),
    PromptConfig("Decide who is the best looking person in the room. That person must now drink 3 times", 0, "The King of Ugly has spoken. The good looking person must drink one more sip",),
    PromptConfig("\"Really hot actresses\", first person to repeat themselves or can't think of anything drinks 3 times. #player0, you start", 0, "If you said Natalie Portman or Jessica Alba, give out 5 sips"),
    PromptConfig( "The first player out of #player0, #player1 and #player2 to show their backside hands out 2 sips"),
    PromptConfig("Be polite! Speak to one another using Mr or Ms, followed by their last name. Drink when you forget", 6, "Everyone, you can stop being so polite"),
    PromptConfig("Moneymakers who study or work in sales, drink 3 times"),
    PromptConfig("For your entire life would you rather work at a funeral home or at the McDonald's checkout? Vote at the same time, losers drink 4 times"),
    PromptConfig("#player0 is the paparazzi! Each time you take a picture of someone without their noticing, that person must drink 4 times", 8, "#player0 isn't the paparazzi anymore"),
    PromptConfig("#player0, make up your mind: which player do you think is more likely to spend the whole night playing a video game, #player1 or #player2? The Geek must drink 5 sips"),
    PromptConfig("#player0, do a handstand or drink 4 times"),
    PromptConfig("\"Things to do when bored\", the first to run out of ideas drinks 2 times. #player0, you start"),
    PromptConfig( "#player0 has to drink 4 times while #player1 is whispering in his or her ear"),
    PromptConfig("#player0, drink 3 times and give out 4 sips"),
    PromptConfig("#player0, drink as many sips as glasses you've poured"),
    PromptConfig("#player0, if you put on makeup before coming here, give out 2 sips. Otherwise drink 5 times"),
    PromptConfig("#player0, give out as many sips as there are Es in your first name, and drink as many as there are As"),
    PromptConfig("#player0, make up your mind: if you needed relationship advice, would you go see #player1 or #player2? Cupid must give out 4 sips"),
    PromptConfig("#player0, if you can give 3 song titles from the One Direction, give out 4 sips. Otherwise drink them"),
    PromptConfig("#player0, if your feet are smaller than #player1's, you drink 2 times. Otherwise give out 2 sips"),
    PromptConfig("#player0, make up your mind: who would need Auto-Tune more to help them sing properly, #player1 or #player2? Tonedeaf must drink 3 sips"),
    PromptConfig("#player0, drink 3 sips. The neighbor to your right drinks one less, until reaching O"),
    PromptConfig("Go around the room, repeat five times in a row: \"Three grey geese in a green field grazing??? in less than 6 seconds. 2 sips for the winners. 2 sips to for the losers. #player0 starts"),
    PromptConfig("But first, let me take a selfie. #player0 and #player1 take a picture together with funny faces"),
    PromptConfig("#player0, you can give out as many sips as you have aunts"),
    PromptConfig("#player0, say something you have NEVER done. Those who have done it, drink 2 times"),
    PromptConfig("Find what's next! #player0 starts singing a song, point to a player anytime to let him/her continue with the right lyrics. The player sings and goes on with another player, until someone fails and drinks 2 times"),
    PromptConfig("#player0, if you are wearing flip flops, give out 3 sips. If not, drink 3 times."),
    PromptConfig("Tag, you're it! The person who is \"it\" touches a player who drinks and they become the next \"it\". #player0, you're first. Play this 'til the end!"),
    PromptConfig("Drink 3 times if you've ever watched a live Striptease"),
    PromptConfig("\"Futurama characters\", the player who repeats or cannot think of one has to drink 2 sips! #player0] starts."),
    PromptConfig("BOTTOMS UP  #player0, give #player1 5 dollars or down your drink"),
    PromptConfig("#player0, choose an object in the room. The first one to touch it will give out 3 sips"),
    PromptConfig("2 sips to the last person to have opened a beer"),
    PromptConfig("#player0, post something dumb (on a social app of your choice). The sentence must contain  the words \"rip apart\", \"cousin\", \"rectum\" and \"#player1\". Or down  your drink"),
    PromptConfig("Drink 2 times if you've ever heard one of your relatives having sex"),
    PromptConfig("\"Reasons to smoke\", the first to run out of ideas drinks 3 times. #player0, you start"),
    PromptConfig("#player0, get on your knees... we'll tell you when it's time to get up!", 5, "#player0 can get up!"),
    PromptConfig("#player0 you're so shy! You must not answer a single question or you get a 4-sip penalty", 3, "#player0 can answer questions again"),
    PromptConfig("Drink 4 sips if you've ever watched a video tutorial to exercise"),
    PromptConfig("#player0, tell us #player1's age or drink 3 times"),
    PromptConfig("#player0, if you've ever downed shots with #player1, give out 3 sips. Otherwise drink them"),
    PromptConfig("Sharks who study or work in finance or accounting, drink 5 times"),
    PromptConfig("For or against watching a knife thrower screwing up live? Everyone vote at the same time, losing group drink 3 times"),

];

// List<PromptConfig> promptsConfigs = [
//   ...originals,
//   ...stolen
// ];

class PromptMap {
  static Map<String, List<PromptConfig>> map = {
    'stolen': stolen,
    'original': originals
  };

  static List<String> options = PromptMap.map.keys.toList();
}
