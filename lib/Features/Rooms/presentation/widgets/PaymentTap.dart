import 'package:flutter/material.dart';
import 'package:flutter_tap_payment/flutter_tap_payment.dart';
import '../../../../Core/NavigationService.dart';
import '../../../../DependencyInjection.dart';
import '../../../Authentication/presentation/manager/auth_bloc.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';

class PaymentTap extends StatelessWidget {
  const PaymentTap({
    Key? key,
    required this.hotelBlocksModel,
    required this.blockIndex,
  }) : super(key: key);

  final HotelBlocksModel hotelBlocksModel;
  final int? blockIndex;

  @override
  Widget build(BuildContext context) {
    return TapPayment(
        apiKey: "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
        redirectUrl: "www.facebook.com",
        postUrl: "www.facebook.com",
        paymentData: {
          "amount": hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2),
          "currency": hotelBlocksModel.block![blockIndex!].productPriceBreakdown!.grossAmount!.currency,
          "threeDSecure": true,
          "save_card": false,
          "description": "Test Description",
          "statement_descriptor": "Sample",
          "metadata": {"udf1": "test 1", "udf2": "test 2"},
          "reference": {
            "transaction": "txn_0001",
            "order": "ord_0001"
          },
          "receipt": {"email": false, "sms": true},
          "customer": {
            "first_name": dl.get<AuthBloc>().userEntity!.userName,
            "middle_name": "",
            "last_name": "",
            "email": dl.get<AuthBloc>().userEntity!.email,
            "phone": {
              "country_code": "965",
              "number": dl.get<AuthBloc>().userEntity!.phoneNumber
            }
          },
          "source": {"id": "src_card"},
        },
        onSuccess: (Map data)async{
          await dl.get<NavigationService>().navigateTo('/PaymentDone');
        },
        onError: (error) {
        });
  }
}