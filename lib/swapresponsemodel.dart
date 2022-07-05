// To parse this JSON data, do
//
//     final swapStatus = swapStatusFromJson(jsonString);

import 'dart:convert';

SwapStatus swapStatusFromJson(String str) => SwapStatus.fromJson(json.decode(str));

String swapStatusToJson(SwapStatus data) => json.encode(data.toJson());

class SwapStatus {
    SwapStatus({
        this.status,
        this.payinAddress,
        this.payoutAddress,
        this.fromCurrency,
        this.toCurrency,
        this.id,
        this.updatedAt,
        this.expectedSendAmount,
        this.expectedReceiveAmount,
        this.createdAt,
        this.isPartner,
    });

    String? status;
    String? payinAddress;
    String ?payoutAddress;
    String ?fromCurrency;
    String? toCurrency;
    String? id;
    DateTime? updatedAt;
    int? expectedSendAmount;
    double ?expectedReceiveAmount;
    DateTime? createdAt;
    bool ?isPartner;

    factory SwapStatus.fromJson(Map<String, dynamic> json) => SwapStatus(
        status: json["status"],
        payinAddress: json["payinAddress"],
        payoutAddress: json["payoutAddress"],
        fromCurrency: json["fromCurrency"],
        toCurrency: json["toCurrency"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        expectedSendAmount: json["expectedSendAmount"],
        expectedReceiveAmount: json["expectedReceiveAmount"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        isPartner: json["isPartner"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "payinAddress": payinAddress,
        "payoutAddress": payoutAddress,
        "fromCurrency": fromCurrency,
        "toCurrency": toCurrency,
        "id": id,
        "updatedAt": updatedAt!.toIso8601String(),
        "expectedSendAmount": expectedSendAmount,
        "expectedReceiveAmount": expectedReceiveAmount,
        "createdAt": createdAt!.toIso8601String(),
        "isPartner": isPartner,
    };
}
