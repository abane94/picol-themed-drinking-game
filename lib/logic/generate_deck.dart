import 'dart:math';

import 'package:picol_drinking_game/data/prompt_configs.dart';

T or<T>(T? first, T def) {
  if (first == null) {
    return def;
  }
  return first;
}

class ResolvedPrompt {
  String prompt;
  String? followUp;
  ResolvedPrompt(this.prompt, [this.followUp]);
}

List<String> generateDeck(int rounds, List<String> players) {
  shuffle(players);
  shuffle(promptsConfigs);

  final int totalPromptsCount = promptsConfigs.length;

  List<PromptConfig> discard = <PromptConfig>[];

  // from crateDeck
  List<String> prompts = <String>[];

  List<String?> followUps = List.filled(2 * rounds,
      null); // this is because arrays arnt objects that can be randomly indexed like js, there might be a better way to do this

  var random = Random();

  for (int i = 0; i < rounds; i++) {
    // make sure deck is full enough at the begining of the round
    if (promptsConfigs.length < (totalPromptsCount * .05)) {
      while (discard.isNotEmpty) {
        promptsConfigs.add(discard.removeLast());
      }
      shuffle(promptsConfigs);
    }

    if (i > max(0, rounds - 5)) {
      while (discard.isNotEmpty) {
        promptsConfigs.add(discard.removeLast());
      }
      promptsConfigs = promptsConfigs.where((element) => element.followUp == null).toList();
      shuffle(promptsConfigs);
    }

    // get a random config and resolve it. // TODO: why does it need to be random and not next if they are already shuffled??
    int promptConfigIdx = random.nextInt(promptsConfigs.length);
    // PromptConfig config = promptsConfigs[promptConfigIdx];
    PromptConfig config = promptsConfigs.removeAt(promptConfigIdx);
    ResolvedPrompt resolved = resolvePrompt(config, players);

    prompts.add(resolved.prompt);
    if (resolved.followUp != null) {
      // console.log('begin follow up');
      int followUpIndex = i + (config.duration ?? 0); // TODO: -1 ??
      followUps[followUpIndex] = resolved.followUp ?? '';
    }

    // put the in the discard or back in the deck
    if (random.nextInt(100) < 30) {
      if (promptsConfigs.isEmpty) {
        promptsConfigs.add(config);
      } else {
        promptsConfigs.insert(random.nextInt(promptsConfigs.length), config);
      }
    } else {
      discard.add(config);
    }
  }

  List<String> deck = <String>[];

  // TODO: Remove
  for (String player in players) {
    player = player.toLowerCase();
    if (player == 'brennan' || player == 'bman') {
      deck.add('Brennan, show the room your taint!');
    }
  }

  for (int i = 0; i < prompts.length; i++) {
    deck.add(prompts[i]);
    if (followUps[i] != null) {
      String fu = followUps[i]!; // bang operator tells the compiler? that the value is not null
      deck.add(fu);
    }
  }

  // add in all the follow ups at the end
  for (int i = prompts.length; i < followUps.length; i++) {
    if (followUps[i] != null) {
      String fu = followUps[i]!; // bang operator tells the compiler? that the value is not null
      deck.add(fu);
    }
  }

  return deck;
}

List<T> shuffle<T>(List<T> arr) {
  var random = Random();
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length; j++) {
      int otherIdx = random.nextInt(arr.length);
      T currentVal = arr[j];
      T otherVal = arr[otherIdx];
      arr[j] = otherVal;
      arr[otherIdx] = currentVal;
    }
  }
  return arr;
}

ResolvedPrompt resolvePrompt(PromptConfig config, List<String> allPlayers) {
  String template = '' + config.prompt;
  String? followUp =
      config.followUp == null ? null : 'FOLLOW UP : ' + (config.followUp ?? '');

  int numPlayers =
      (RegExp(r'\#player')).allMatches(template).map((m) => m.group(0)).length;

  List<String> players = <String>[];
  for (int i = 0; i < numPlayers; i++) {
    if (allPlayers.isNotEmpty) {
      players.add(allPlayers.removeLast());
    } else {
      // console.log('not enough players!!')
    }
  }

  if (followUp != null) {
    followUp = followUp.replaceAll('#player', or(players[0], ''));
  }
  for (int i = 0; i < players.length; i++) {
    template =
        template.replaceAll('#player' + i.toString(), or(players[i], ''));

    if (followUp != null) {
      followUp =
          followUp.replaceAll('#player' + i.toString(), or(players[i], ''));
    }
  }
  if (players.isNotEmpty) {
    // players is empty when the prompt does not refrence any players Ex: VOTE cards
    template = template.replaceAll('#player', or(players[0], ''));
  }

  var random = Random();
  while (players.isNotEmpty) {
    int idx = random.nextInt(allPlayers.length);
    allPlayers.insert(idx, players.removeLast());
  }

  return ResolvedPrompt(template, followUp);
}
