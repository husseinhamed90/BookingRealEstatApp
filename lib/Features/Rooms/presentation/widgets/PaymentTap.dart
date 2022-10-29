import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tap_payment/flutter_tap_payment.dart';
import 'package:realestate/Core/AppTheme/Strings.dart';
import 'package:realestate/Features/BookedRooms/presentation/manager/booked_rooms_bloc.dart';
import 'package:realestate/Features/BookedRooms/presentation/manager/booked_rooms_state.dart';
import 'package:realestate/Features/FlatDetails/domain/entities/HotelRooms.dart';
import '../../../../Core/NavigationService/NavigationService.dart';
import '../../../../DependencyInjection.dart';
import '../../../Authentication/presentation/manager/auth_bloc.dart';
import '../../../BookedRooms/presentation/manager/booked_rooms_event.dart';
import '../../../FlatDetails/data/remote/models/HotelBlocksModel.dart';

class PaymentTap extends StatelessWidget {
  const PaymentTap({
    Key? key,
    required this.block,
  }) : super(key: key);

  final Block block;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookedRoomsBloc,BookedRoomsState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state.message==loading){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return TapPayment(
              apiKey: "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
              redirectUrl: "www.facebook.com",
              postUrl: "www.facebook.com",
              paymentData: {
                "amount": block.productPriceBreakdown!.grossAmount!.value!.toStringAsFixed(2),
                "currency": block.productPriceBreakdown!.grossAmount!.currency,
                "threeDSecure": true,
                "save_card": false,
                "description": "Test Description",
                "statement_descriptor": "Sample",
                "metadata": const {"udf1": "test 1", "udf2": "test 2"},
                "reference": const {
                  "transaction": "txn_0001",
                  "order": "ord_0001"
                },
                "receipt": const {"email": false, "sms": true},
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
                "source": const {"id": "src_card"},
              },
              onSuccess: (Map data)async{
                dl.get<BookedRoomsBloc>().add(BookHotel(block: block));
                await dl.get<NavigationService>().navigateTo('/PaymentDone');
              },
              onError: (error) {
              });

        }
      },
    );
  }
}