/*
 * Created by Farouk MOHAMED on 07/10/2025 10:09
 * Copyright (c) 2025 | Cauridor. All rights reserved.
 * Last modified 07/10/2025 10:09
 */

String normalize(String phone) {
  final cleaned = phone.replaceAll(RegExp('[^0-9+]'), '');
  if (cleaned.startsWith('00')) {
    return '+${cleaned.substring(2)}';
  }
  return cleaned;
}

String stripPlus(String phone) {
  return phone.startsWith('+') ? phone.substring(1) : phone;
}
