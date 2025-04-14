import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int? selectedEmojiIndex;
  final TextEditingController _feedbackController = TextEditingController();
  final List<Map<String, dynamic>> emojis = [
    {'emoji': '😊', 'label': 'Excellent'},
    {'emoji': '🙂', 'label': 'Good'},
    {'emoji': '😐', 'label': 'Average'},
    {'emoji': '😟', 'label': 'Poor'},
    {'emoji': '😡', 'label': 'Very Bad'},
  ];

  void _submitFeedback() {
    // Show thanks popup if either feedback or emoji is selected
    if (_feedbackController.text.isNotEmpty || selectedEmojiIndex != null) {
      String selectedEmoji = selectedEmojiIndex != null
          ? emojis[selectedEmojiIndex!]['emoji']
          : '👍';

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF24294b),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Thanks for your feedback!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFD4AF37),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                selectedEmoji,
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: TextStyle(color: const Color(0xFFD4AF37)),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD4AF37)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        //backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Write Your Feedback',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Say what you think about our services',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _feedbackController,
                    maxLines: null,
                    expands: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Write your feedback here...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'How was your experience with us?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(emojis.length, (index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedEmojiIndex == index) {
                                selectedEmojiIndex =
                                null; // Unmark if same emoji is clicked
                              } else {
                                selectedEmojiIndex = index;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedEmojiIndex == index
                                    ? const Color(0xFFD4AF37)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              emojis[index]['emoji'],
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          emojis[index]['label'],
                          style: TextStyle(
                            color: selectedEmojiIndex == index
                                ? const Color(0xFFD4AF37)
                                : Colors.white,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitFeedback,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Send Feedback',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
