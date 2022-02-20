import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picol_drinking_game/logic/generate_deck.dart';
import 'package:picol_drinking_game/types/game-parameters.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key, required this.game}) : super(key: key);

  final String title = 'Game View';

  final GamePrameters game;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  // save data
  List<String> prompts = <String>[];

  // int pointer = 0;
  final ValueNotifier<int> _pointer = ValueNotifier<int>(0);

  @override
  void initState() {
    // _getThingsOnStartup().then((value) {
    //   print('Async done');
    // });

    // Prompt logic goes here
    // prompts.add('this is a prompt');
    // for (String name in widget.game.players) {
    //   prompts.add(name);
    // }
    prompts = generateDeck(widget.game.rounds, widget.game.players);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
        valueListenable: _pointer,
        builder: (context, value, child) {
          return Text(prompts[_pointer.value], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
        }
        )
      ),
      floatingActionButton: ValueListenableBuilder<int>(
        valueListenable: _pointer,
        builder: (context, value, child) {
          return Row(
            children: [
              Visibility(
                visible: _pointer.value > 0,
                child: FloatingActionButton(
                  onPressed: prev, //_incrementCounter,
                  tooltip: 'Back',
                  child: const Icon(Icons.arrow_left), // This trailing comma makes auto-formatting nicer for build methods.
                ),
              ),
              const Spacer(),
              Visibility(
                visible: _pointer.value < prompts.length -1,
                child: FloatingActionButton(
                  onPressed: next, //_incrementCounter,
                  tooltip: 'Next',
                  child: const Icon(Icons.arrow_right), // This trailing comma makes auto-formatting nicer for build methods.
                ),
              )
            ],
          );
        },
      ),
    );
  }

  next() {
    _pointer.value = _pointer.value + 1;
  }

  prev() {
    if (_pointer.value <= 0) {
      _pointer.value = 0;
      return;
    }
    _pointer.value = _pointer.value - 1;
  }
}
