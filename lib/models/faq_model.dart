import 'package:flutter/cupertino.dart';

class FaqItem {
  final String question;
  final String answer;
  final IconData icon;

  FaqItem({required this.question, required this.answer, required this.icon});
}

class FaqProvider {
  static final List<FaqItem> faqItems = [
    FaqItem(
      question: "How do I list my property for sale or rent on the app?",
      answer:
          "Sellers and renters can easily list their properties by navigating to the 'Add Property' section, filling out the necessary details like property type, location, price, and uploading relevant images and documents. Once submitted, the listing will be reviewed before it goes live.",
      icon: CupertinoIcons.add_circled,
    ),
    FaqItem(
      question: "What documents are required to list a property?",
      answer:
          "To list a property, you’ll need to provide ownership proof, property documents (such as title deeds), and any legal documents that validate the sale or rent agreement. Make sure these are uploaded during the property listing process.",
      icon: CupertinoIcons.doc_text,
    ),
    FaqItem(
      question:
          "How can I search for properties under 50% development for investment?",
      answer:
          "Investors can explore properties under development by navigating to the 'For Investment' section on the homepage. This section highlights properties that are marked as 'under 50% development,' making it easy to find investment opportunities without needing additional filters for development stage.",
      icon: CupertinoIcons.search,
    ),
    FaqItem(
      question:
          "What should I do if I find a property I'm interested in renting or buying?",
      answer:
          "When you find a property of interest, you can contact the seller or landlord directly via the app. The app provides options to schedule a visit, ask for more details, and negotiate terms before finalizing your decision.",
      icon: CupertinoIcons.chat_bubble,
    ),
    FaqItem(
      question:
          "How do I ensure my investment in a property under development is secure?",
      answer:
          "For properties under development, it’s important to check the developer’s reputation and the legal agreements attached. Our app also provides a verification system for developers and listings to ensure authenticity and security in your investments.",
      icon: CupertinoIcons.shield,
    ),
    FaqItem(
      question: "How can I track the status of my listed property?",
      answer:
          "Once you’ve listed your property, you can track its status through the 'My Listings' section in your account. This section allows you to see if your property is under review, live, or requires additional information for approval.",
      icon: CupertinoIcons.list_bullet,
    ),
    FaqItem(
      question: "Can I edit my property listing after submitting it?",
      answer:
          "Yes, you can edit your property listing at any time. Simply go to the 'My Listings' section, select the property you want to update, and modify the details such as price, description, or images before saving the changes.",
      icon: CupertinoIcons.pencil,
    ),
  ];
}
