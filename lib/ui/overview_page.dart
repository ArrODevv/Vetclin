import 'package:flutter/material.dart';
import 'package:vetclin/ui/util/better_elevated_button.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            _ButtonBar(),
          ],
        ),
      ),
    );
  }
}

// TODO: change to fitting color
class _ButtonBar extends StatefulWidget {
  const _ButtonBar({ super.key });
  
  @override
  State<_ButtonBar> createState() => _ButtonBarState();
}

class _ButtonBarState extends State<_ButtonBar> {
  int selectedBtn = 1;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            BetterElevatedButton(
              onPressed: () {
                setState(() {
                  if(selectedBtn != 0) {
                    selectedBtn = 0;
                  }
                });
              },
              disabled: selectedBtn != 0,
              child: Text('Dummy Button'),
            ),
            
            BetterElevatedButton(
              onPressed: () {
                setState(() {
                  if(selectedBtn != 1) {
                    selectedBtn = 1;
                  }
                });
              },
              disabled: selectedBtn != 1,
              child: Text('Cooler Button'),
            ),
          ],
        ),
      ),
    );
  }
}
