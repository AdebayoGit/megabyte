import 'package:flutter/material.dart';
import 'package:megabyte/components/main_app_bar.dart';
import 'package:megabyte/components/navigation_drawer.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: MainAppBar(),
      body: const FaqWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

List<FaqItem> generateItems(int numberOfItems) {
  return List<FaqItem>.generate(numberOfItems, (int index) {
    return FaqItem(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

/// This is the private State class that goes with MyStatefulWidget.
class _FaqWidgetState extends State<FaqWidget> {
  final List<FaqItem> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: _buildPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      dividerColor: yellow,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((FaqItem item) {
        return ExpansionPanel(
          backgroundColor: lightGreen,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              tileColor: seaGreen,
              hoverColor: lightGreen,
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere(
                      (FaqItem currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
