import 'package:reactive_forms/reactive_forms.dart';

class OrderDataFormController {
  final group = FormGroup(
    {
      'address_id': FormControl<int>(),
      'address': FormControl<String>(
        validators: [Validators.required],
      ),
      'recipients_phone_number': FormControl<String>(
        validators: [
          Validators.required,
          Validators.pattern(
              r'^(((\+|00)9677|0?7)[01378]\d{7}|((\+|00)967|0)[1-7]\d{6})$')
        ],
        value: '',
      ),
      'shipping_method_id': FormControl<int>(
        validators: [Validators.required],
      ),
      'payment_method': FormControl<int>(
        validators: [Validators.required],
      ),
    },
  );

  void reset() {
    group.reset();
  }
}
