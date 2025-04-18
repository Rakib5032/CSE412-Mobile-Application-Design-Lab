import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Booknow extends StatefulWidget {
  const Booknow({super.key});

  @override
  State<Booknow> createState() => _BooknowState();
}

class _BooknowState extends State<Booknow> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _arrangementController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();
  final TextEditingController _cateringController = TextEditingController();

  String? _eventType = 'Wedding'; // Changed to nullable String for validation
  bool _agreeTerms = false;
  String _photographyOption = 'Yes';

  // List of event types
  final List<String> _eventTypes = [
    'Wedding',
    'Birthday',
    'Party',
    'Business Meeting',
    'Corporate Meeting',
    'Picnic',
    'Others',
  ];

  Future<void> _saveEventToDatabase() async {
    if (!_formKey.currentState!.validate() || !_agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please complete the form correctly"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Get reference to Firebase Database
      final databaseRef = FirebaseDatabase.instance.ref("events");

      // Generate a unique key for the event
      final newEventRef = databaseRef.push();

      // Prepare event data
      final eventData = {
        "eventType": _eventType,
        "venue": _venueController.text,
        "location": _locationController.text,
        "date": _dateController.text,
        "startTime": _startTimeController.text,
        "endTime": _endTimeController.text,
        "people": int.tryParse(_peopleController.text) ?? 0,
        "arrangements": _arrangementController.text,
        "theme": _themeController.text,
        "catering": _cateringController.text,
        "photography": _photographyOption,
        "budget": double.tryParse(_budgetController.text) ?? 0.0,
        "contact": _contactController.text,
        "email": _emailController.text,
        "notes": _noteController.text,
        "timestamp": ServerValue.timestamp, // Firebase server timestamp
      };

      // Save to database
      await newEventRef.set(eventData);

      // Close loading dialog
      Navigator.pop(context);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Event booked successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      // Reset form
      _resetForm();
    } catch (e) {
      print(e);
      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to book event: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final now = DateTime.now();
      final dt =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      controller.text = DateFormat.jm().format(dt);
    }
  }

  InputDecoration buildInputDecoration(String label, IconData icon,
      {String? hintText}) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      labelStyle: const TextStyle(color: Colors.black54, fontSize: 18),
      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 18),
      prefixIcon: Icon(icon, color: const Color(0xFF24294b), size: 28),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFD4AF37), width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _dateController.clear();
    _venueController.clear();
    _locationController.clear();
    _peopleController.clear();
    _arrangementController.clear();
    _budgetController.clear();
    _contactController.clear();
    _emailController.clear();
    _noteController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
    _themeController.clear();
    _cateringController.clear();
    setState(() {
      _eventType = 'Wedding'; // Reset to default
      _agreeTerms = false;
      _photographyOption = 'Yes';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Form has been reset"),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _venueController.dispose();
    _locationController.dispose();
    _peopleController.dispose();
    _arrangementController.dispose();
    _budgetController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _noteController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _themeController.dispose();
    _cateringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎉 Book Your Event'),
        backgroundColor: const Color(0xFF24294b),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF24294b),
              const Color(0xFFD4AF37).withOpacity(0.9),
              const Color(0xFF24294b),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -50,
                left: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                bottom: -70,
                right: -70,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD4AF37).withOpacity(0.2),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
              ),
              SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event Details",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              value: _eventType,
                              decoration: buildInputDecoration(
                                "Event Type",
                                Icons.event_available,
                                hintText: "Select event type",
                              ),
                              items: _eventTypes.map((String type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 20),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _eventType = newValue;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select an event type';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _venueController,
                              decoration: buildInputDecoration(
                                "Venue Name",
                                Icons.event,
                                hintText: "Enter venue name",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter venue name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _locationController,
                              decoration: buildInputDecoration(
                                "Location",
                                Icons.location_on,
                                hintText: "Enter event location",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter location';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _dateController,
                              readOnly: true,
                              onTap: () => _selectDate(context),
                              decoration: buildInputDecoration(
                                "Event Date",
                                Icons.calendar_today,
                                hintText: "Select date",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select event date';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _startTimeController,
                                    readOnly: true,
                                    onTap: () =>
                                        _selectTime(_startTimeController),
                                    decoration: buildInputDecoration(
                                      "Start Time",
                                      Icons.access_time,
                                      hintText: "Select start time",
                                    ),
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 20),
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextFormField(
                                    controller: _endTimeController,
                                    readOnly: true,
                                    onTap: () =>
                                        _selectTime(_endTimeController),
                                    decoration: buildInputDecoration(
                                      "End Time",
                                      Icons.access_time,
                                      hintText: "Select end time",
                                    ),
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 20),
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _peopleController,
                              decoration: buildInputDecoration(
                                "Number of People",
                                Icons.group,
                                hintText: "Enter number of attendees",
                              ),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of people';
                                }
                                if (!RegExp(r'^\d+$').hasMatch(value)) {
                                  return 'Please enter only numbers';
                                }
                                if (int.tryParse(value) == null ||
                                    int.parse(value) <= 0) {
                                  return 'Please enter a valid positive number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _arrangementController,
                              decoration: buildInputDecoration(
                                "Special Arrangements",
                                Icons.chair,
                                hintText: "Enter special requirements",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _themeController,
                              decoration: buildInputDecoration(
                                "Theme/Color Preference",
                                Icons.palette,
                                hintText: "Enter theme or color scheme",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _cateringController,
                              decoration: buildInputDecoration(
                                "Catering Details",
                                Icons.restaurant,
                                hintText: "Enter catering preferences",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Photography Services",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text("Yes",
                                    style: TextStyle(color: Colors.black)),
                                value: "Yes",
                                groupValue: _photographyOption,
                                onChanged: (value) =>
                                    setState(() => _photographyOption = value!),
                                activeColor: const Color(0xFFD4AF37),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text("No",
                                    style: TextStyle(color: Colors.black)),
                                value: "No",
                                groupValue: _photographyOption,
                                onChanged: (value) =>
                                    setState(() => _photographyOption = value!),
                                activeColor: const Color(0xFFD4AF37),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _budgetController,
                              decoration: buildInputDecoration(
                                "Estimated Budget (BDT)",
                                Icons.attach_money,
                                hintText: "Enter your budget",
                              ),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter budget';
                                }
                                if (double.tryParse(value) == null ||
                                    double.parse(value) <= 0) {
                                  return 'Please enter a valid amount';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _contactController,
                              decoration: buildInputDecoration(
                                "Contact Number",
                                Icons.phone,
                                hintText: "Enter phone number",
                              ),
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter contact number';
                                }
                                final digitsOnly =
                                    value.replaceAll(RegExp(r'\D'), '');
                                if (digitsOnly.length < 10) {
                                  return 'Please enter a valid phone number (at least 10 digits)';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              decoration: buildInputDecoration(
                                "Email",
                                Icons.email,
                                hintText: "Enter your email",
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _noteController,
                              decoration: buildInputDecoration(
                                "Additional Notes",
                                Icons.note,
                                hintText: "Enter any additional information",
                              ),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              minLines: 3,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: _agreeTerms,
                              onChanged: (val) =>
                                  setState(() => _agreeTerms = val!),
                              activeColor: const Color(0xFFD4AF37),
                            ),
                            const Expanded(
                              child: Text(
                                "I agree to the terms and conditions.",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD4AF37),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 8,
                                shadowColor: Colors.black.withOpacity(0.3),
                              ),
                              onPressed: _saveEventToDatabase,
                              child: const Text("Book Now"),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 8,
                                shadowColor: Colors.black.withOpacity(0.3),
                              ),
                              onPressed: _resetForm,
                              child: const Text("Reset"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
