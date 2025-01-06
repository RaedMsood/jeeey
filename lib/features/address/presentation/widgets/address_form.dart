import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../data/model/address_model.dart';

class AddressFormController {
  final AddressModel address;

  AddressFormController(this.address) {
    fillForm(address);
  }

  final key = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final group = FormGroup({
    'address': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'city_id': FormControl<int>(),
    'city_name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'district_id': FormControl<int>(),
    'district_name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'nearest_landmark': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  void fillForm(AddressModel address) {
    group.patchValue({
      'address': address.address,
      'city_name': address.cityName.toString(),
      'city_id': address.cityId,
      'district_name': address.districtName.toString(),
      'district_id': address.districtId,
      'nearest_landmark': address.nearestLandmark,
    });
  }
}
