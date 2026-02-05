///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override String get en => '英語';
	@override String get vi => 'ベトナム語';
	@override String get site => 'サイト';
	@override String get save => '保存';
	@override String get newName => '新しい名前';
	@override String get enterName => '名前を入力';
	@override String get appTitle => 'TSPパーキング';
	@override String get complete => '完了';
	@override String get unexpectedError => '予期せぬエラーが発生しました！';
	@override String get username => 'ユーザー名';
	@override String get password => 'パスワード';
	@override String get confirmPassword => 'パスワード（確認）';
	@override String get remember => 'ログイン情報を保存';
	@override String get forgetPassword => 'パスワードをお忘れですか？';
	@override String get signUpNow => '新規登録';
	@override String get home => 'ホーム';
	@override String get activity => 'アクティビティ';
	@override String get history => '履歴';
	@override String get parkingHistory => '駐車履歴';
	@override String get statistic => '統計';
	@override String get revenue => '売上';
	@override String get account => 'アカウント';
	@override String get search => '検索';
	@override String get enterTicketNumber => 'チケット番号を入力';
	@override String get january => '1月';
	@override String get february => '2月';
	@override String get march => '3月';
	@override String get april => '4月';
	@override String get may => '5月';
	@override String get june => '6月';
	@override String get july => '7月';
	@override String get august => '8月';
	@override String get september => '9月';
	@override String get october => '10月';
	@override String get november => '11月';
	@override String get december => '12月';
	@override String get totalRevenue => '総売上';
	@override String get parkingPrice => '駐車料金';
	@override String get memberFee => '会員費';
	@override String get parkingAreaConfig => 'エリア設定';
	@override String get employeeManagement => '従業員管理';
	@override String get memberVehicles => '会員車両';
	@override String get generalConfig => '一般設定';
	@override String get changeName => '名前を変更';
	@override String get developingFeature => 'この機能は現在開発中です';
	@override String get journeyInformation => '行程情報';
	@override String get configParkingLot => '駐車場設定';
	@override String get manageTicket => 'チケット管理';
	@override String get configCapacity => '収容数設定';
	@override String get yourJourney => 'あなたの行程';
	@override String get viewDetails => '詳細を見る';
	@override String get bookTickets => 'チケットを予約';
	@override String get filter => 'フィルター';
	@override String get lightMode => 'ライトモード';
	@override String get darkMode => 'ダークモード';
	@override String get departureStation => '出発駅';
	@override String get arrivalStation => '到着駅';
	@override String get roundTrip => '往復';
	@override String station({required Object name}) => '${name} 駅';
	@override String get loginSuccess => 'ログイン成功';
	@override String get changePassword => 'パスワード変更';
	@override String get gender => '性別';
	@override String get male => '男性';
	@override String get female => '女性';
	@override String get kContinue => '次へ';
	@override String get quit => '終了';
	@override String get language => '言語';
	@override String get changeLanguage => '言語を変更';
	@override String get changeTheme => 'テーマを変更';
	@override String get drawer => 'Zusa';
	@override String get reload => '再読み込み';
	@override String get settings => '設定';
	@override String get appSettings => 'アプリ設定';
	@override String get followSystem => '端末の設定に合わせる';
	@override String get fingerprintAuthentication => '指紋認証';
	@override String get contactInfo => '連絡先情報';
	@override String get customerInfo => 'お客様情報';
	@override String get bookingInfo => '予約情報';
	@override String get bookingInProgress => '予約処理中...';
	@override String get note => '備考';
	@override String get noInfo => '情報なし';
	@override String get noAccount => '予約するにはログインしてください';
	@override String get skip => 'スキップ';
	@override String get receipt => '領収書';
	@override String get payment => '支払い';
	@override String get pay => '支払いへ進む';
	@override String get generalSettings => '一般設定';
	@override String get soldSeat => '販売済み';
	@override String get selectingSeat => '選択中';
	@override String get availableSeat => '空席';
	@override String get error => 'エラーが発生しました';
	@override String get success => '成功';
	@override String get monthlyVehicle => '月極車両';
	@override String get kIn => '入庫';
	@override String get out => '出庫';
	@override String get guest => '一般車両';
	@override String get member => '会員車両';
	@override String ticketId({required Object id}) => 'チケット番号: ${id}';
	@override String get total => '合計';
	@override String pass({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(count,
		other: '${count} パス',
	);
	@override String get time => '時間';
	@override String get reset => 'リセット';
	@override String get date => '日付';
	@override String dateOf({required Object val}) => '日付 ${val}';
	@override String get vehicleType => '車両タイプ';
	@override String get name => '名前';
	@override String get phoneNumber => '電話番号';
	@override String get licenseNumber => 'ナンバープレート';
	@override String get ticketID => 'チケットID';
	@override String get memberVehicleDetail => '会員車両詳細';
	@override String get createMemberVehicle => '会員車両を追加';
	@override String get lock => 'ロック';
	@override String get ok => 'OK';
	@override String get cancel => 'キャンセル';
	@override String get delete => '削除';
	@override String get close => '閉じる';
	@override String get apply => '適用';
	@override String get enter => '決定';
	@override String get choose => '選択';
	@override String get currentPassword => '現在のパスワード';
	@override String get enterCurrentPassword => '現在のパスワードを入力';
	@override String get newPassword => '新しいパスワード';
	@override String get enterNewPassword => '新しいパスワードを入力';
	@override String get confirmNewPassword => '新しいパスワード（確認）';
	@override String totalTime({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(count,
		zero: '合計時間: 1分未満',
		one: '合計時間: 1分',
		other: '合計時間: ${count} 分',
	);
	@override String selectedSeat({required Object current, required Object total}) => '${current}/${total} 席を選択済み';
	@override String totalCost({required Object cost}) => '合計金額: ${cost}';
	@override String get car => '自動車';
	@override String get bicycle => '自転車';
	@override String get motorbike => 'バイク';
	@override String get info => '情報';
	@override String get address => '住所';
	@override String get branchName => '支店名';
	@override String get capacity => '収容台数';
	@override String get retake => '撮り直す';
	@override String get allowIn => '入庫許可';
	@override String get allowOut => '出庫許可';
	@override String get all => 'すべて';
	@override String get inUse => '利用中';
	@override String get lost => '紛失';
	@override String get markAsLost => '紛失としてマーク';
	@override String get reportRecovered => '発見を報告';
	@override String get passenger => '乗客';
	@override String get parking => '駐車場';
	@override String seat({required Object row, required Object col}) => '座席: ${row}${col}';
	@override String get enterInteger => '整数を入力';
	@override String get ticketSearch => 'ナンバー/カードで検索';
	@override String get on => 'オン';
	@override String get off => 'オフ';
	@override String get isRemember => 'ログイン情報を保存';
	@override String get debuggerMode => 'デバッグモード';
	@override String get biometricAuth => '生体認証';
	@override String get noMoreData => 'これ以上データはありません';
	@override String get pullUpToLoad => '上にスワイプして読み込む';
	@override String get loadFailedPleaseRetry => '読み込みに失敗しました。再試行してください';
	@override String get releaseToLoadMore => '指を放して読み込む';
	@override String get loginSuccessed => 'ログインしました';
	@override String get internetConnected => 'インターネットに接続されました';
	@override String get noInternet => 'インターネット接続がありません';
	@override String remainingTicket({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(count,
		zero: '完売',
		other: '残り ${count} 枚',
	);
	@override String get email_short => 'メール';
	@override String get email_long => 'メールアドレス';
	@override String get idNumber_short => 'ID';
	@override String get idNumber_long => '身分証番号';
	@override String get phone_short => '電話';
	@override String get phone_long => '電話番号';
	@override String get errorMessage_required => 'この項目は必須です！';
	@override String get errorMessage_confirmPassword => 'パスワードが一致しません！';
	@override String get noData_search => 'データが見つかりません';
	@override String get noData_availableSeat => '空席が見つかりません';
	@override String get title_login => 'ログイン';
	@override String get title_logout => 'ログアウト';
	@override String get title_signUp => 'サインアップ';
	@override String get title_exit => '終了';
	@override String get title_sessionEnded => 'セッション終了';
	@override String get title_adult => '大人';
	@override String get title_otp => 'OTP';
	@override String get title_addInfo => 'お客様情報';
	@override String get title_createPassword => 'パスワード作成';
	@override String get title_forgetPassword => 'パスワード再設定';
	@override String get title_warningThreshold => '満車警告設定';
	@override String get title_extend => '延長';
	@override String get subtitle_login => 'アカウント情報を入力してください';
	@override String get subtitle_logout => 'ログアウトしてもよろしいですか？';
	@override String get subtitle_signUp => 'メールアドレスを入力してください';
	@override String get subtitle_exit => 'このページから移動しますか？';
	@override String get subtitle_sessionEnded => 'セッションが終了しました。セキュリティのため、再度ログインしてください。';
	@override String get subtitle_adult => '身分証/パスポートの情報を入力してください';
	@override String get subtitle_otp => 'OTP（ワンタイムパスワード）を入力してください';
	@override String get subtitle_addInfo => 'アプリを利用するために必要な情報を入力してください';
	@override String get subtitle_createPassword => 'パスワードを入力してください';
	@override String get subtitle_forgetPassword => 'メールアドレスを入力してください';
	@override String get subtitle_warningThreshold => '駐車場が満車に近づいた際、システムが警告を表示します。';
	@override String get subtitle_extend => '延長しますか？';
	@override String get tokenVerificationFailed => '認証に失敗しました';
	@override String get vi_VN => 'ベトナム語';
	@override String get en_US => '英語';
	@override String get ja => '日本語';
	@override String get ticketNumber => 'チケット番号';
	@override String get dragText => '引っ張って読み込み';
	@override String get armedText => '指を離して読み込み';
	@override String get readyText => '読み込み中';
	@override String get processingText => '読み込み中';
	@override String get processedText => '完了';
	@override String get noMoreText => 'データは以上です';
	@override String get failedText => '読み込み失敗';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'en' => '英語',
			'vi' => 'ベトナム語',
			'site' => 'サイト',
			'save' => '保存',
			'newName' => '新しい名前',
			'enterName' => '名前を入力',
			'appTitle' => 'TSPパーキング',
			'complete' => '完了',
			'unexpectedError' => '予期せぬエラーが発生しました！',
			'username' => 'ユーザー名',
			'password' => 'パスワード',
			'confirmPassword' => 'パスワード（確認）',
			'remember' => 'ログイン情報を保存',
			'forgetPassword' => 'パスワードをお忘れですか？',
			'signUpNow' => '新規登録',
			'home' => 'ホーム',
			'activity' => 'アクティビティ',
			'history' => '履歴',
			'parkingHistory' => '駐車履歴',
			'statistic' => '統計',
			'revenue' => '売上',
			'account' => 'アカウント',
			'search' => '検索',
			'enterTicketNumber' => 'チケット番号を入力',
			'january' => '1月',
			'february' => '2月',
			'march' => '3月',
			'april' => '4月',
			'may' => '5月',
			'june' => '6月',
			'july' => '7月',
			'august' => '8月',
			'september' => '9月',
			'october' => '10月',
			'november' => '11月',
			'december' => '12月',
			'totalRevenue' => '総売上',
			'parkingPrice' => '駐車料金',
			'memberFee' => '会員費',
			'parkingAreaConfig' => 'エリア設定',
			'employeeManagement' => '従業員管理',
			'memberVehicles' => '会員車両',
			'generalConfig' => '一般設定',
			'changeName' => '名前を変更',
			'developingFeature' => 'この機能は現在開発中です',
			'journeyInformation' => '行程情報',
			'configParkingLot' => '駐車場設定',
			'manageTicket' => 'チケット管理',
			'configCapacity' => '収容数設定',
			'yourJourney' => 'あなたの行程',
			'viewDetails' => '詳細を見る',
			'bookTickets' => 'チケットを予約',
			'filter' => 'フィルター',
			'lightMode' => 'ライトモード',
			'darkMode' => 'ダークモード',
			'departureStation' => '出発駅',
			'arrivalStation' => '到着駅',
			'roundTrip' => '往復',
			'station' => ({required Object name}) => '${name} 駅',
			'loginSuccess' => 'ログイン成功',
			'changePassword' => 'パスワード変更',
			'gender' => '性別',
			'male' => '男性',
			'female' => '女性',
			'kContinue' => '次へ',
			'quit' => '終了',
			'language' => '言語',
			'changeLanguage' => '言語を変更',
			'changeTheme' => 'テーマを変更',
			'drawer' => 'Zusa',
			'reload' => '再読み込み',
			'settings' => '設定',
			'appSettings' => 'アプリ設定',
			'followSystem' => '端末の設定に合わせる',
			'fingerprintAuthentication' => '指紋認証',
			'contactInfo' => '連絡先情報',
			'customerInfo' => 'お客様情報',
			'bookingInfo' => '予約情報',
			'bookingInProgress' => '予約処理中...',
			'note' => '備考',
			'noInfo' => '情報なし',
			'noAccount' => '予約するにはログインしてください',
			'skip' => 'スキップ',
			'receipt' => '領収書',
			'payment' => '支払い',
			'pay' => '支払いへ進む',
			'generalSettings' => '一般設定',
			'soldSeat' => '販売済み',
			'selectingSeat' => '選択中',
			'availableSeat' => '空席',
			'error' => 'エラーが発生しました',
			'success' => '成功',
			'monthlyVehicle' => '月極車両',
			'kIn' => '入庫',
			'out' => '出庫',
			'guest' => '一般車両',
			'member' => '会員車両',
			'ticketId' => ({required Object id}) => 'チケット番号: ${id}',
			'total' => '合計',
			'pass' => ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(count, other: '${count} パス', ), 
			'time' => '時間',
			'reset' => 'リセット',
			'date' => '日付',
			'dateOf' => ({required Object val}) => '日付 ${val}',
			'vehicleType' => '車両タイプ',
			'name' => '名前',
			'phoneNumber' => '電話番号',
			'licenseNumber' => 'ナンバープレート',
			'ticketID' => 'チケットID',
			'memberVehicleDetail' => '会員車両詳細',
			'createMemberVehicle' => '会員車両を追加',
			'lock' => 'ロック',
			'ok' => 'OK',
			'cancel' => 'キャンセル',
			'delete' => '削除',
			'close' => '閉じる',
			'apply' => '適用',
			'enter' => '決定',
			'choose' => '選択',
			'currentPassword' => '現在のパスワード',
			'enterCurrentPassword' => '現在のパスワードを入力',
			'newPassword' => '新しいパスワード',
			'enterNewPassword' => '新しいパスワードを入力',
			'confirmNewPassword' => '新しいパスワード（確認）',
			'totalTime' => ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(count, zero: '合計時間: 1分未満', one: '合計時間: 1分', other: '合計時間: ${count} 分', ), 
			'selectedSeat' => ({required Object current, required Object total}) => '${current}/${total} 席を選択済み',
			'totalCost' => ({required Object cost}) => '合計金額: ${cost}',
			'car' => '自動車',
			'bicycle' => '自転車',
			'motorbike' => 'バイク',
			'info' => '情報',
			'address' => '住所',
			'branchName' => '支店名',
			'capacity' => '収容台数',
			'retake' => '撮り直す',
			'allowIn' => '入庫許可',
			'allowOut' => '出庫許可',
			'all' => 'すべて',
			'inUse' => '利用中',
			'lost' => '紛失',
			'markAsLost' => '紛失としてマーク',
			'reportRecovered' => '発見を報告',
			'passenger' => '乗客',
			'parking' => '駐車場',
			'seat' => ({required Object row, required Object col}) => '座席: ${row}${col}',
			'enterInteger' => '整数を入力',
			'ticketSearch' => 'ナンバー/カードで検索',
			'on' => 'オン',
			'off' => 'オフ',
			'isRemember' => 'ログイン情報を保存',
			'debuggerMode' => 'デバッグモード',
			'biometricAuth' => '生体認証',
			'noMoreData' => 'これ以上データはありません',
			'pullUpToLoad' => '上にスワイプして読み込む',
			'loadFailedPleaseRetry' => '読み込みに失敗しました。再試行してください',
			'releaseToLoadMore' => '指を放して読み込む',
			'loginSuccessed' => 'ログインしました',
			'internetConnected' => 'インターネットに接続されました',
			'noInternet' => 'インターネット接続がありません',
			'remainingTicket' => ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(count, zero: '完売', other: '残り ${count} 枚', ), 
			'email_short' => 'メール',
			'email_long' => 'メールアドレス',
			'idNumber_short' => 'ID',
			'idNumber_long' => '身分証番号',
			'phone_short' => '電話',
			'phone_long' => '電話番号',
			'errorMessage_required' => 'この項目は必須です！',
			'errorMessage_confirmPassword' => 'パスワードが一致しません！',
			'noData_search' => 'データが見つかりません',
			'noData_availableSeat' => '空席が見つかりません',
			'title_login' => 'ログイン',
			'title_logout' => 'ログアウト',
			'title_signUp' => 'サインアップ',
			'title_exit' => '終了',
			'title_sessionEnded' => 'セッション終了',
			'title_adult' => '大人',
			'title_otp' => 'OTP',
			'title_addInfo' => 'お客様情報',
			'title_createPassword' => 'パスワード作成',
			'title_forgetPassword' => 'パスワード再設定',
			'title_warningThreshold' => '満車警告設定',
			'title_extend' => '延長',
			'subtitle_login' => 'アカウント情報を入力してください',
			'subtitle_logout' => 'ログアウトしてもよろしいですか？',
			'subtitle_signUp' => 'メールアドレスを入力してください',
			'subtitle_exit' => 'このページから移動しますか？',
			'subtitle_sessionEnded' => 'セッションが終了しました。セキュリティのため、再度ログインしてください。',
			'subtitle_adult' => '身分証/パスポートの情報を入力してください',
			'subtitle_otp' => 'OTP（ワンタイムパスワード）を入力してください',
			'subtitle_addInfo' => 'アプリを利用するために必要な情報を入力してください',
			'subtitle_createPassword' => 'パスワードを入力してください',
			'subtitle_forgetPassword' => 'メールアドレスを入力してください',
			'subtitle_warningThreshold' => '駐車場が満車に近づいた際、システムが警告を表示します。',
			'subtitle_extend' => '延長しますか？',
			'tokenVerificationFailed' => '認証に失敗しました',
			'vi_VN' => 'ベトナム語',
			'en_US' => '英語',
			'ja' => '日本語',
			'ticketNumber' => 'チケット番号',
			'dragText' => '引っ張って読み込み',
			'armedText' => '指を離して読み込み',
			'readyText' => '読み込み中',
			'processingText' => '読み込み中',
			'processedText' => '完了',
			'noMoreText' => 'データは以上です',
			'failedText' => '読み込み失敗',
			_ => null,
		};
	}
}
