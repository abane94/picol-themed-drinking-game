import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picol_drinking_game/data/prompt_configs.dart';
import 'package:picol_drinking_game/types/game-parameters.dart';

import 'game.dart';

const MIN_PLAYERS = 3;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    // save data
    final List<String> _players = <String>[];
    // text field
    final TextEditingController _playerNameController = TextEditingController();
    final TextEditingController _deckSizeController = TextEditingController();

    FocusNode playerFocusNode = FocusNode();

    // dropdown data
    String deckName = PromptMap.options[0];
    int deckSize = 35;

    Map<int, String> deckOptionsIntToStr = {20: 'Short', 35: 'Normal', 50: 'Long'};
    Map<String, int> deckOptionsStrToInt = {'Short': 20, 'Normal': 35, 'Long': 50};

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Game Length'),
            _buildDropDown<int>(deckSize, deckOptionsIntToStr.keys.toList(), (int? newVal) {
              setState(() {
                deckSize = newVal!;
              });
            }, deckOptionsIntToStr),

            const Text('What kind if Game?'),
            _buildDropDown<String>(deckName, PromptMap.options, (String? newVal) {
              setState(() {
                deckName = newVal!;
              });
            }),
            TextField(
              controller: _playerNameController,
              decoration: const InputDecoration(hintText: 'Enter Player Name'),
              focusNode: playerFocusNode,
              onSubmitted: (String val) {
                _addPlayer(val);
                playerFocusNode.requestFocus();
              },  // _playerNameController.text
            ),
            ListView(children: _getPlayers(), shrinkWrap: true),
            ElevatedButton (
              onPressed: _players.length >= MIN_PLAYERS ? startGame : null,
              child: Text(_players.length >= MIN_PLAYERS ? "Start Game" : "Need at least $MIN_PLAYERS players"),
              style: _players.length < MIN_PLAYERS ? ElevatedButton.styleFrom(
                primary: Colors.grey,
              ) : null
            )
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _playerNameController,
        builder: (context, value, child) {
          return Visibility(
            visible: _playerNameController.text.trim().isNotEmpty,
            child: FloatingActionButton(
              onPressed: () { _addPlayer(_playerNameController.text); },  //_incrementCounter,
              tooltip: 'Add Player',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }

  // adds player to list.
  void _addPlayer(String name) {
    //  a set state will notify the app that the state has changed
    setState(() {
      _players.add(name.trim());
    });
    _playerNameController.clear();
  }

  deletePlayer(int i) {
    setState(() {
      _players.removeAt(i);
    });
  }

  Widget _buildPlayerListItem(String title, int i) {
    return ListTile(title: Row(
      children: [
        Text(title),
        Spacer(),
        IconButton(onPressed: () { deletePlayer(i); }, icon: const Icon(Icons.delete))
      ],
    ));
  }

  // iterates through our todo list titles.
  List<Widget> _getPlayers() {
    final List<Widget> _playerWidgets = <Widget>[];
    // for (String player in _players) {
    //   _playerWidgets.add(_buildPlayerListItem(player));
    // }
    for (int i = 0; i < _players.length; i++) {
      String player = _players[i];
      _playerWidgets.add(_buildPlayerListItem(player, i));
    }
    return _playerWidgets;
  }

  Widget _buildDropDown<T>(T initialValue, List<T> items, void Function(T?) cb, [Map<T, String>? labelMap]) {
    return DropdownButton(

      // Initial Value
        value: initialValue,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: items.map((T item) {
          return DropdownMenuItem(
            value: item,
            child: Text((labelMap ?? const {})[item] ?? item.toString()),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: cb,
      );
  }

  startGame() {
    _addPlayer(_playerNameController.text);
    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameView(game: GamePrameters(_players.where((player) => player.trim().isNotEmpty).toList(), deckSize, deckName)),
          ),
        );
  }
}
