// models/faq_provider.dart

import 'package:flutter/cupertino.dart';

class FaqItem {
  final String question;
  final IconData icon;

  FaqItem({required this.question, required this.icon});
}

class FaqProvider {
  // Mock list of FAQ items
  static final List<FaqItem> faqItems = [
    FaqItem(question: "What is 'App Name'?", icon: CupertinoIcons.question),
    FaqItem(question: "Why choose 'App Name'?", icon: CupertinoIcons.question),
    FaqItem(question: "What can I do in 'App Name'?", icon: CupertinoIcons.question),
    FaqItem(question: "What properties are available in 'App Name'?", icon: CupertinoIcons.question),
    FaqItem(question: "How to save properties?", icon: CupertinoIcons.bookmark),
    FaqItem(question: "How can I add property?", icon: CupertinoIcons.add_circled),
    FaqItem(question: "Who can add property?", icon: CupertinoIcons.person_2),
    FaqItem(question: "How do I change my password?", icon: CupertinoIcons.lock),
    FaqItem(question: "How do I update my profile information?", icon: CupertinoIcons.person),
    FaqItem(question: "How do I filter search results?", icon: CupertinoIcons.search),
    FaqItem(question: "What do the property labels mean (e.g., 'Featured')?", icon: CupertinoIcons.tag),
    FaqItem(question: "How do I report maintenance issues?", icon: CupertinoIcons.wrench),
    FaqItem(question: "What are the fees for listing a property?", icon: CupertinoIcons.money_dollar),
  ];
}
