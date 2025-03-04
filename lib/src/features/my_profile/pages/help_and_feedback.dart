import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/global_variables.dart';

class HelpFeedbackScreen extends StatelessWidget {
  const HelpFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> data = [
      Item(question: "Q1: How to get rubies and zircons?", answer: ""),
      Item(question: "Q2: How to cash out?", answer: ""),
      Item(
        question: "Q3: How to level up?",
        answer: "There are a few ways to level up:\n"
            "1. You can get Exp. by logging in every day.\n"
            "2. Watching and sharing lives will help you get more Exp.\n"
            "3. The best way to get Exp. is to send more gifts.",
      ),
      Item(question: "Q4: How to make a video call?", answer: ""),
      Item(question: "Q5: I have been banned, what should I do?", answer: ""),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "Help & Feedback",
          style: textTheme(context)
              .titleSmall
              ?.copyWith(color: colorScheme(context).onPrimary),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return HelpFeedbackTile(item: data[index]);
        },
      ),
    );
  }
}

class HelpFeedbackTile extends StatelessWidget {
  final Item item;

  const HelpFeedbackTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: colorScheme(context).outlineVariant,
              width: 0.5), // Bottom border only
        ),
      ),
      child: ExpansionTile(
        collapsedIconColor: colorScheme(context).onSurface.withOpacity(0.5),
        iconColor: colorScheme(context).onSurface,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent)),
        tilePadding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Customize padding as needed
        title: Text(
          item.question,
          style: textTheme(context).titleSmall,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.answer.isNotEmpty
                  ? item.answer
                  : "Answer not available at this time.",
              style: textTheme(context).bodyMedium?.copyWith(
                  color: colorScheme(context).onSurface.withOpacity(0.4)),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
}
