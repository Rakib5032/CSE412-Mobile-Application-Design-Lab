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

  String _eventType = 'Wedding';
  bool _agreeTerms = false;
  String _photographyOption = 'Yes';

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

  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF24294b)),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
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
        backgroundColor: Color(0xFF24294b),
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
              padding: const EdgeInsets.fromLTRB(15, 80, 15, 20),
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
                          TextFormField(
                            controller: _venueController,
                            decoration:
                                buildInputDecoration("Venue Name", Icons.event),
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 20),
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
                                "Location", Icons.location_on),
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 20),
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
                                "Event Date", Icons.calendar_today),
                            style: const TextStyle(color: Colors.black87),
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
                                      "Start Time", Icons.access_time),
                                  style: const TextStyle(color: Colors.black87),
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
                                  onTap: () => _selectTime(_endTimeController),
                                  decoration: buildInputDecoration(
                                      "End Time", Icons.access_time),
                                  style: const TextStyle(color: Colors.black87),
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
                                "Number of People", Icons.group),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black87),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter number of people';
                              }
                              // Check if the input contains only integers
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
                                "Special Arrangements", Icons.chair),
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _themeController,
                            decoration: buildInputDecoration(
                                "Theme/Color Preference", Icons.palette),
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _cateringController,
                            decoration: buildInputDecoration(
                                "Catering Details", Icons.restaurant),
                            style: const TextStyle(color: Colors.black87),
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
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text("Yes",
                                  style: TextStyle(color: Colors.white)),
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
                                  style: TextStyle(color: Colors.white)),
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
                                "Estimated Budget (BDT)", Icons.attach_money),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black87),
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
                                "Contact Number", Icons.phone),
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(color: Colors.black87),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter contact number';
                              }
                              if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration:
                                buildInputDecoration("Email", Icons.email),
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black87),
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
                                "Additional Notes", Icons.note),
                            maxLines: 3,
                            style: const TextStyle(color: Colors.black87),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              _agreeTerms) {
                            // Additional check for people field to contain only integers
                            final peopleValue = _peopleController.text;
                            if (!RegExp(r'^\d+$').hasMatch(peopleValue)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Number of people must contain only integers"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFD4AF37),
                                ),
                              ),
                            );

                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("🎉 Event booked successfully!"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            _formKey.currentState!.reset();
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
                              _agreeTerms = false;
                              _photographyOption = 'Yes';
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "⚠️ Please complete the form correctly and agree to the terms"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const Text("Book Now"),
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
    );
  }
}
