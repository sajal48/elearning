import 'package:meta/meta.dart';
import 'dart:convert';

PurchaseResponse purchaseResponseFromJson(String str) =>
    PurchaseResponse.fromJson(json.decode(str));

String purchaseResponseToJson(PurchaseResponse data) =>
    json.encode(data.toJson());

class PurchaseResponse {
  PurchaseResponse({
    required this.statuscode,
    required this.message,
    this.result,
  });

  final int statuscode;
  final String message;
  final Result? result;

  factory PurchaseResponse.fromJson(Map<String, dynamic> json) =>
      PurchaseResponse(
        statuscode: json["statuscode"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "message": message,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.externalId,
    this.userId,
    this.status,
    this.merchantName,
    this.amount,
    this.payerEmail,
    this.description,
    this.expiryDate,
    this.invoiceUrl,
  });

  final String? id;
  final String? externalId;
  final String? userId;
  final String? status;
  final String? merchantName;
  final int? amount;
  final String? payerEmail;
  final String? description;
  final DateTime? expiryDate;
  final String? invoiceUrl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        externalId: json["external_id"],
        userId: json["user_id"],
        status: json["status"],
        merchantName: json["merchant_name"],
        amount: json["amount"],
        payerEmail: json["payer_email"],
        description: json["description"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        invoiceUrl: json["invoice_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "external_id": externalId,
        "user_id": userId,
        "status": status,
        "merchant_name": merchantName,
        "amount": amount,
        "payer_email": payerEmail,
        "description": description,
        "expiry_date": expiryDate!.toIso8601String(),
        "invoice_url": invoiceUrl,
      };
}
