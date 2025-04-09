import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Add 'pinput' to your pubspec.yaml


class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1); // Example color
    const fillColor = Color.fromRGBO(243, 246, 249, 0); // Example color
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4); // Example color

    // Define the default PIN theme
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Adjusted for less roundness
        border: Border.all(color: Colors.grey.shade400), // Grey border
        color: Colors.white, // White fill
      ),
    );

    // Define the focused PIN theme (matches the blue border in the image)
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.blue,
        width: 2,
      ), // Blue border when focused
      borderRadius: BorderRadius.circular(8),
    );

    // Define the submitted PIN theme
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(
          color: Colors.grey.shade400,
        ), // Keep grey border after submission
        // Optionally change background color on submission
        // color: fillColor,
      ),
    );

    // Define the error PIN theme
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.redAccent), // Red border on error
    );

    // --- Phone number (replace with actual logic) ---
    String maskedPhoneNumber = "******000";
    // --- End Phone number ---

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Optional: remove if no app bar is needed
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // Allows scrolling if content overflows
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Form(
            // Use Form for potential validation
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- Logo ---
                // Replace with your actual logo widget (e.g., Image.asset)
                const FlutterLogo(size: 80),
                const SizedBox(height: 8),
                const Text(
                  'TECNOFARMA', // Text below the logo
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Adjust color as needed
                  ),
                ),
                const SizedBox(height: 40), // Spacing after logo
                // --- Title ---
                const Text(
                  'Confirmação',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),

                // --- Subtitle / Instructions ---
                Text(
                  'Receba uma confirmação por código\nenviada para o número $maskedPhoneNumber',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // --- OTP Input Fields ---
                Directionality(
                  textDirection: TextDirection.ltr, // Ensure LTR for pinput
                  child: Pinput(
                    length: 5, // Number of fields based on image
                    controller: pinController,
                    focusNode: focusNode,
                    // Removed androidSmsAutofillMethod as it is not defined
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    errorPinTheme: errorPinTheme,
                    separatorBuilder:
                        (index) =>
                            const SizedBox(width: 10), // Space between boxes
                    validator: (value) {
                      // Add validation logic if needed
                      // return value == '22222' ? null : 'Pin is incorrect';
                      return null; // Example: no validation for now
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                      // Optionally trigger submit action here
                      // _submitCode(pin);
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- Submit Button ---
                SizedBox(
                  width: double.infinity, // Make button full width
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.blue,
                        ], // Example gradient
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Rounded corners
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        focusNode.unfocus(); // Unfocus the pinput
                        if (formKey.currentState!.validate()) {
                          _submitCode(pinController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors
                                .transparent, // Make button transparent to show gradient
                        shadowColor:
                            Colors
                                .transparent, // No shadow for the button itself
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // Match container radius
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // --- Resend Code Link ---
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Não recebi o código de confirmação, ',
                      ),
                      TextSpan(
                        text: 'Enviar novamente',
                        style: const TextStyle(
                          color: Colors.blue, // Link color
                          fontWeight: FontWeight.bold,
                          decoration:
                              TextDecoration.none, // Optional: remove underline
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                _resendCode();
                              },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Placeholder Functions ---
  void _submitCode(String code) {
    // Implement your logic to verify the code
    print('Submitting code: $code');
    // Example: Show a dialog or navigate
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Código $code submetido!'),
      ), // Message in Portuguese
    );
    // Navigate or update state based on verification result
  }

  void _resendCode() {
    // Implement your logic to resend the confirmation code
    print('Resending code...');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Código reenviado!'),
      ), // Message in Portuguese
    );
  }
}
