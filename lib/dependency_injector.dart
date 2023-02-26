import 'package:balinasoft_test_app/data/database_data_source.dart';
import 'package:balinasoft_test_app/data/interfaces/i_local_data_source.dart';
import 'package:balinasoft_test_app/data/interfaces/i_remote_data_source.dart';
import 'package:balinasoft_test_app/data/remote_data_source.dart';
import 'package:balinasoft_test_app/data/repositories/comment_repository.dart';
import 'package:balinasoft_test_app/data/repositories/image_repository.dart';
import 'package:balinasoft_test_app/data/repositories/interfaces/i_comment_repository.dart';
import 'package:balinasoft_test_app/data/repositories/interfaces/i_image_repository.dart';
import 'package:balinasoft_test_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:balinasoft_test_app/data/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  initDataSources();
  initRepositories();
}

void initDataSources() {
  i.registerSingleton<IRemoteDataSource>(
    RemoteDataSource(),
  );
  i.registerSingleton<ILocalDataSource>(
    DatabaseDataSource(),
  );
}

void initRepositories() {
  i.registerSingleton<IImageRepository>(
    ImageRepository(i.get(), i.get()),
  );
  i.registerSingleton<ICommentRepository>(
    CommentRepository(i.get()),
  );
  i.registerSingleton<IUserRepository>(
    UserRepository(i.get()),
  );
}
