class AppointmentModal {
  final String patient_name;
  final String category;
  final String payment;
  final String slot_date;
  final String slot_time;
  final String message;

  AppointmentModal(
      {this.patient_name,
      this.category,
      this.payment,
      this.slot_date,
      this.slot_time,
      this.message});

  factory AppointmentModal.fromJson(Map<String, dynamic> json) {
    return AppointmentModal(
      patient_name: json['patient_name'],
      category: json['category'],
      payment: json['payment'],
      slot_date: json['slot_date'],
      slot_time: json['slot_time'],
      message: json['message'],
    );
  }
}
