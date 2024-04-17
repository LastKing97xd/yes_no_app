import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future <Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModelAqui = YesNoModel.fromJsonMap(response.data);

    return yesNoModelAqui.toMessageEntity();
    // return Message(
    //   text: yesNoModelAqui.answer,
    //   fromWho: FromWho.hers,
    //   imageUrl: yesNoModelAqui.image
    // );
    // return Message(
    //   text: response.data['answer'],
    //   fromWho: FromWho.hers,
    //   imageUrl: response.data['image'],
    // );
  }
}
