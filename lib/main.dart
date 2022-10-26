import 'package:destini_flutter/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image : DecorationImage(
                    image: AssetImage('images/background.png'),
                      fit: BoxFit.cover,
                ),
                ),
                // padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
                // constraints: BoxConstraints.expand(),
                child: StoryPage()),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Story_Brain _storyBrain = Story_Brain();

  void getStory(int choiceNumber){
setState(() {

    _storyBrain.nextStory(choiceNumber);
    if (_storyBrain.getChoice1() == 'Restart'){
      _isVisible = false;
    } else {
      _isVisible = true;
    }
});

}
  bool _isVisible = true;

  // void showToast() {
  //   setState(() {
  //     _isVisible = !_isVisible;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  _storyBrain.getStoryTitle(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  getStory(1);
                },
                child: Text(
                  _storyBrain.getChoice1(),

                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  primary: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Visibility(
                visible: _isVisible,
                child: TextButton(
                  onPressed: () {
                     getStory(2);
                  },
                  child: Text(
                    _storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue, primary: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
