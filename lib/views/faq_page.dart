import 'package:flutter/material.dart';
import 'package:megabyte/components/colors.dart';
import 'package:megabyte/components/main_app_bar.dart';
import 'package:megabyte/components/navigation_drawer.dart';
import 'package:megabyte/models/faq.dart';
import 'package:megabyte/models/faq_data.dart';

List<FaqItem> gettingStartedFaq = FaqData().gettingStartedFaq;
List<FaqItem> generalFaq = FaqData().generalFaq;
List<FaqItem> winningsFaq = FaqData().winningsFaq;
List<FaqItem> transactionsFaq = FaqData().transactionsFaq;
List<FaqItem> lotteriesFaq = FaqData().lotteriesFaq;
List<FaqItem> groupsFaq = FaqData().groupsFaq;

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

class FaqWidget extends StatefulWidget {
  const FaqWidget({Key? key}) : super(key: key);

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  // final List<FaqItem> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Getting Started',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Container(
            child: _buildPanel(gettingStartedFaq),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'General',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Container(
            child: _buildPanel(generalFaq),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Winnings',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Container(
            child: _buildPanel(winningsFaq),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Payments and Withdrawals',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Container(
            child: _buildPanel(transactionsFaq),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lotteries',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Container(
            child: _buildPanel(lotteriesFaq),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Groups',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Container(
            child: _buildPanel(groupsFaq),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget _buildPanel(List<FaqItem> faq) {
    return ExpansionPanelList(
      dividerColor: Colors.white,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          faq[index].isExpanded = !isExpanded;
        });
      },
      children: faq.map<ExpansionPanel>((FaqItem item) {
        return ExpansionPanel(
          backgroundColor: lightGreen,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              tileColor: lightGreen,
              hoverColor: lightGreen,
              title: Text(
                item.headerValue,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            minVerticalPadding: 8.0,
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
