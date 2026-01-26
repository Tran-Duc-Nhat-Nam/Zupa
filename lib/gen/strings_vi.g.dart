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
class TranslationsVi with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override String get en => 'Tiếng Anh';
	@override String get vi => 'Tiếng Việt';
	@override String get site => 'Địa điểm';
	@override String get save => 'Lưu';
	@override String get newName => 'Tên mới';
	@override String get enterName => 'Nhập tên';
	@override String get appTitle => 'Đỗ xe TSP';
	@override String get complete => 'Hoàn thành';
	@override String get unexpectedError => 'Đã xảy lỗi không xác định!';
	@override String get username => 'Tên tài khoản';
	@override String get password => 'Mật khẩu';
	@override String get confirmPassword => 'Nhập lại mật khẩu';
	@override String get remember => 'Ghi nhớ';
	@override String get forgetPassword => 'Quên mật khẩu?';
	@override String get signUpNow => 'Đăng ký ngay';
	@override String get home => 'Trang chủ';
	@override String get activity => 'Hoạt động';
	@override String get history => 'Lịch sử';
	@override String get parkingHistory => 'Lịch sử gửi xe';
	@override String get statistic => 'Thống kê';
	@override String get revenue => 'Doanh thu';
	@override String get account => 'Tài khoản';
	@override String get search => 'Tìm kiếm';
	@override String get enterTicketNumber => 'Nhập số xe tại đây';
	@override String get january => 'Tháng Một';
	@override String get february => 'Tháng Hai';
	@override String get march => 'Tháng Ba';
	@override String get april => 'Tháng Tư';
	@override String get may => 'Tháng Năm';
	@override String get june => 'Tháng Sáu';
	@override String get july => 'Tháng Bảy';
	@override String get august => 'Tháng Tám';
	@override String get september => 'Tháng Chín';
	@override String get october => 'Tháng Mười';
	@override String get november => 'Tháng Mười Một';
	@override String get december => 'Tháng Mười Hai';
	@override String get totalRevenue => 'Tổng doanh thu';
	@override String get parkingPrice => 'Giá đỗ xe';
	@override String get memberFee => 'Phí xe tháng';
	@override String get parkingAreaConfig => 'Thiết lập nhà xe';
	@override String get employeeManagement => 'Quản lý nhân viên';
	@override String get memberVehicles => 'Xe tháng';
	@override String get generalConfig => 'Cấu hình chung';
	@override String get changeName => 'Đổi tên';
	@override String get developingFeature => 'Tính năng này đang được phát triển';
	@override String get journeyInformation => 'Thông tin hành trình';
	@override String get configParkingLot => 'Cấu hình bãi xe';
	@override String get manageTicket => 'Quản lý vé tháng';
	@override String get configCapacity => 'Cấu hình ';
	@override String get yourJourney => 'Chuyến đi của bạn';
	@override String get viewDetails => 'Xem chi tiết';
	@override String get bookTickets => 'Đặt vé';
	@override String get filter => 'Bộ lọc';
	@override String get lightMode => 'Chế độ sáng';
	@override String get darkMode => 'Chế độ tối';
	@override String get departureStation => 'Ga đi';
	@override String get arrivalStation => 'Ga đến';
	@override String get roundTrip => 'Khứ hồi';
	@override String get station => 'Ga {}';
	@override String get loginSuccess => 'Đăng nhập thành công';
	@override String get changePassword => 'Đổi mật khẩu';
	@override String get gender => 'Giới tính';
	@override String get male => 'Nam';
	@override String get female => 'Nữ';
	@override String get kContinue => 'Tiếp tục';
	@override String get quit => 'Thoát';
	@override String get language => 'Ngôn ngữ';
	@override String get changeLanguage => 'Đổi ngôn ngữ';
	@override String get changeTheme => 'Đổi màu nền';
	@override String get drawer => 'Zusa';
	@override String get reload => 'Tải lại';
	@override String get settings => 'Cài đặt';
	@override String get appSettings => 'Cài đặt ứng dụng';
	@override String get followSystem => 'Theo hệ thống';
	@override String get fingerprintAuthentication => 'Xác thực vân tay';
	@override String get contactInfo => 'Thông tin liên hệ';
	@override String get customerInfo => 'Thông tin khách hàng';
	@override String get bookingInfo => 'Thông tin đặt vé';
	@override String get bookingInProgress => 'Đang tiến hành đặt vé...';
	@override String get note => 'Ghi chú';
	@override String get noInfo => 'Không có thông tin';
	@override String get noAccount => 'Đăng nhập để đặt vé';
	@override String get skip => 'Bỏ qua';
	@override String get receipt => 'Hóa đơn';
	@override String get payment => 'Thanh toán';
	@override String get pay => 'Thanh toán';
	@override String get error => 'Đã có lỗi xảy ra';
	@override String get success => 'Thành công';
	@override String get monthlyVehicle => 'Xe tháng';
	@override String get kIn => 'Vào';
	@override String get out => 'Ra';
	@override String get guest => 'Xe vãng lai';
	@override String get member => 'Xe khách';
	@override String get ticketId => 'Số thẻ: {}';
	@override String get time => 'Thời gian';
	@override String get reset => 'Đặt lại';
	@override String get date => 'Ngày';
	@override String get dateOf => 'Ngày {}';
	@override String get vehicleType => 'Loại xe';
	@override String get total => 'Tổng cộng';
	@override String pass({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		zero: '{} lượt',
		one: '{} lượt',
		many: '{} lượt',
		other: '{} lượt',
	);
	@override String get name => 'Tên';
	@override String get phoneNumber => 'Số điện thoại';
	@override String get licenseNumber => 'Biển số xe';
	@override String get ticketID => 'Mã số thẻ';
	@override String get memberVehicleDetail => 'Chi tiết xe tháng';
	@override String get createMemberVehicle => 'Thêm xe tháng';
	@override String get lock => 'Khóa';
	@override String get ok => 'OK';
	@override String get cancel => 'Hủy';
	@override String get delete => 'Xoá';
	@override String get close => 'Đóng';
	@override String get apply => 'Áp dụng';
	@override String get enter => 'Nhập';
	@override String get choose => 'Chọn';
	@override String get currentPassword => 'Mật khẩu hiện tại';
	@override String get enterCurrentPassword => 'Nhập mật khẩu hiện tại';
	@override String get newPassword => 'Mật khẩu mới';
	@override String get enterNewPassword => 'Nhập mật khẩu mới';
	@override String get confirmNewPassword => 'Nhập lại mật khẩu mới';
	@override String totalTime({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		zero: 'Giờ gửi: dưới 1 phút',
		one: 'Giờ gửi: 1 phút',
		many: 'Giờ gửi: {} phút',
		other: 'Giờ gửi: {} phút',
	);
	@override String get generalSettings => 'Cài đặt chung';
	@override String get soldSeat => 'Chỗ đã bán';
	@override String get selectingSeat => 'Chỗ đang chọn';
	@override String get availableSeat => 'Chỗ trống';
	@override String get selectedSeat => 'Đã chọn {}/{} chỗ';
	@override String get totalCost => 'Tổng tiền: {}';
	@override String get car => 'Xe ô tô';
	@override String get bicycle => 'Xe đạp';
	@override String get motorbike => 'Xe máy';
	@override String get info => 'Thông tin';
	@override String get address => 'Địa chỉ';
	@override String get branchName => 'Tên chi nhánh';
	@override String get capacity => 'Sức chứa';
	@override String get retake => 'Chụp lại';
	@override String get allowIn => 'Cho vào';
	@override String get allowOut => 'Cho ra';
	@override String get all => 'Tất cả';
	@override String get inUse => 'Đang dùng';
	@override String get lost => 'Thất lạc';
	@override String get markAsLost => 'Báo thất lạc';
	@override String get reportRecovered => 'Báo khôi phục';
	@override String get passenger => 'Khách vãng lai';
	@override String get parking => 'Đang đỗ';
	@override String get enterInteger => 'Nhập số nguyên';
	@override String get ticketSearch => 'Tìm theo số xe/mã thẻ';
	@override String get on => 'Bật';
	@override String get off => 'Tắt';
	@override String get isRemember => 'Ghi nhớ tài khoản';
	@override String get debuggerMode => 'Chế độ gỡ lỗi';
	@override String get biometricAuth => 'Xác thực bằng vân tay';
	@override String get seat => 'Chỗ ngồi: {}{}';
	@override String get loginSuccessed => 'Đăng nhập thành công';
	@override String get internetConnected => 'Đã kết nối internet';
	@override String get noInternet => 'Không có kết nối internet';
	@override String get noMoreData => 'Không còn dữ liệu';
	@override String get pullUpToLoad => 'Kéo lên để tải thêm';
	@override String get loadFailedPleaseRetry => 'Tải thất bại! Vui lòng thử lại';
	@override String get releaseToLoadMore => 'Thả ra để tải thêm';
	@override String remainingTicket({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n,
		zero: 'Hết vé',
		one: 'Còn {} vé',
		many: 'Còn {} vé',
		other: 'Còn {} vé',
	);
	@override late final _TranslationsEmailVi email = _TranslationsEmailVi._(_root);
	@override late final _TranslationsIdNumberVi idNumber = _TranslationsIdNumberVi._(_root);
	@override late final _TranslationsPhoneVi phone = _TranslationsPhoneVi._(_root);
	@override late final _TranslationsErrorMessageVi errorMessage = _TranslationsErrorMessageVi._(_root);
	@override late final _TranslationsNoDataVi noData = _TranslationsNoDataVi._(_root);
	@override late final _TranslationsTitleVi title = _TranslationsTitleVi._(_root);
	@override late final _TranslationsSubtitleVi subtitle = _TranslationsSubtitleVi._(_root);
	@override String get tokenVerificationFailed => 'Xác thực thất bại';
	@override String get vi_VN => 'Tiếng Việt';
	@override String get en_US => 'Tiếng Anh';
	@override String get ja => 'Tiếng Nhật';
	@override String get ticketNumber => 'Mã vé';
	@override String get dragText => 'Kéo để tải';
	@override String get armedText => 'Thả ra để tải';
	@override String get readyText => 'Đang tải';
	@override String get processingText => 'Đang tải';
	@override String get processedText => 'Thành công';
	@override String get noMoreText => 'Không còn dữ liệu';
	@override String get failedText => 'Tải thất bại';
}

// Path: email
class _TranslationsEmailVi implements TranslationsEmailEn {
	_TranslationsEmailVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get short => 'Email';
	@override String get long => 'Địa chỉ email';
}

// Path: idNumber
class _TranslationsIdNumberVi implements TranslationsIdNumberEn {
	_TranslationsIdNumberVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get short => 'CCCD';
	@override String get long => 'CCCD';
}

// Path: phone
class _TranslationsPhoneVi implements TranslationsPhoneEn {
	_TranslationsPhoneVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get short => 'SĐT';
	@override String get long => 'Số điện thoại';
}

// Path: errorMessage
class _TranslationsErrorMessageVi implements TranslationsErrorMessageEn {
	_TranslationsErrorMessageVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get required => 'Vui lòng không để trống!';
	@override String get confirmPassword => 'Mật khẩu nhập lại không trùng khớp!';
}

// Path: noData
class _TranslationsNoDataVi implements TranslationsNoDataEn {
	_TranslationsNoDataVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get search => 'Không có dữ liệu';
	@override String get availableSeat => 'Không còn chỗ trống';
}

// Path: title
class _TranslationsTitleVi implements TranslationsTitleEn {
	_TranslationsTitleVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get login => 'Đăng nhập';
	@override String get logout => 'Đăng xuất';
	@override String get signUp => 'Đăng ký';
	@override String get exit => 'Thoát';
	@override String get sessionEnded => 'Phiên đăng nhập đã kết thúc.';
	@override String get adult => 'Người lớn';
	@override String get otp => 'OTP';
	@override String get addInfo => 'Thông tin hành khách';
	@override String get createPassword => 'Tạo mật khẩu';
	@override String get forgetPassword => 'Quên mật khẩu';
	@override String get warningThreshold => 'Cảnh báo khi sắp hết chỗ';
	@override String get extend => 'Gia hạn';
}

// Path: subtitle
class _TranslationsSubtitleVi implements TranslationsSubtitleEn {
	_TranslationsSubtitleVi._(this._root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get login => 'Nhập thông tin tài khoản của bạn';
	@override String get logout => 'Bạn có muốn đăng xuất khỏi tài khoản hay không?';
	@override String get signUp => 'Nhập địa chỉ email của bạn';
	@override String get exit => 'Bạn đang rời khỏi trang';
	@override String get sessionEnded => 'Phiên đăng nhập của bạn đã kết thúc. Nhằm đảm bảo bảo mật, hãy đăng nhập lại để tiếp tục sử dụng ứng dụng.';
	@override String get adult => 'Thêm thông tin như trên CCCD/hộ chiếu';
	@override String get otp => 'Nhập mã OTP';
	@override String get addInfo => 'Nhập những thông tin cần thiết để sử dụng ứng dụng';
	@override String get createPassword => 'Nhập mật khẩu của bạn';
	@override String get forgetPassword => 'Nhập địa chỉ email của bạn';
	@override String get warningThreshold => 'Khi nhà xe sắp hết chỗ, hệ thống sẽ hiển thị cảnh báo.';
	@override String get extend => 'Bạn có muốn gia hạn không?';
}

/// The flat map containing all translations for locale <vi>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsVi {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'en' => 'Tiếng Anh',
			'vi' => 'Tiếng Việt',
			'site' => 'Địa điểm',
			'save' => 'Lưu',
			'newName' => 'Tên mới',
			'enterName' => 'Nhập tên',
			'appTitle' => 'Đỗ xe TSP',
			'complete' => 'Hoàn thành',
			'unexpectedError' => 'Đã xảy lỗi không xác định!',
			'username' => 'Tên tài khoản',
			'password' => 'Mật khẩu',
			'confirmPassword' => 'Nhập lại mật khẩu',
			'remember' => 'Ghi nhớ',
			'forgetPassword' => 'Quên mật khẩu?',
			'signUpNow' => 'Đăng ký ngay',
			'home' => 'Trang chủ',
			'activity' => 'Hoạt động',
			'history' => 'Lịch sử',
			'parkingHistory' => 'Lịch sử gửi xe',
			'statistic' => 'Thống kê',
			'revenue' => 'Doanh thu',
			'account' => 'Tài khoản',
			'search' => 'Tìm kiếm',
			'enterTicketNumber' => 'Nhập số xe tại đây',
			'january' => 'Tháng Một',
			'february' => 'Tháng Hai',
			'march' => 'Tháng Ba',
			'april' => 'Tháng Tư',
			'may' => 'Tháng Năm',
			'june' => 'Tháng Sáu',
			'july' => 'Tháng Bảy',
			'august' => 'Tháng Tám',
			'september' => 'Tháng Chín',
			'october' => 'Tháng Mười',
			'november' => 'Tháng Mười Một',
			'december' => 'Tháng Mười Hai',
			'totalRevenue' => 'Tổng doanh thu',
			'parkingPrice' => 'Giá đỗ xe',
			'memberFee' => 'Phí xe tháng',
			'parkingAreaConfig' => 'Thiết lập nhà xe',
			'employeeManagement' => 'Quản lý nhân viên',
			'memberVehicles' => 'Xe tháng',
			'generalConfig' => 'Cấu hình chung',
			'changeName' => 'Đổi tên',
			'developingFeature' => 'Tính năng này đang được phát triển',
			'journeyInformation' => 'Thông tin hành trình',
			'configParkingLot' => 'Cấu hình bãi xe',
			'manageTicket' => 'Quản lý vé tháng',
			'configCapacity' => 'Cấu hình ',
			'yourJourney' => 'Chuyến đi của bạn',
			'viewDetails' => 'Xem chi tiết',
			'bookTickets' => 'Đặt vé',
			'filter' => 'Bộ lọc',
			'lightMode' => 'Chế độ sáng',
			'darkMode' => 'Chế độ tối',
			'departureStation' => 'Ga đi',
			'arrivalStation' => 'Ga đến',
			'roundTrip' => 'Khứ hồi',
			'station' => 'Ga {}',
			'loginSuccess' => 'Đăng nhập thành công',
			'changePassword' => 'Đổi mật khẩu',
			'gender' => 'Giới tính',
			'male' => 'Nam',
			'female' => 'Nữ',
			'kContinue' => 'Tiếp tục',
			'quit' => 'Thoát',
			'language' => 'Ngôn ngữ',
			'changeLanguage' => 'Đổi ngôn ngữ',
			'changeTheme' => 'Đổi màu nền',
			'drawer' => 'Zusa',
			'reload' => 'Tải lại',
			'settings' => 'Cài đặt',
			'appSettings' => 'Cài đặt ứng dụng',
			'followSystem' => 'Theo hệ thống',
			'fingerprintAuthentication' => 'Xác thực vân tay',
			'contactInfo' => 'Thông tin liên hệ',
			'customerInfo' => 'Thông tin khách hàng',
			'bookingInfo' => 'Thông tin đặt vé',
			'bookingInProgress' => 'Đang tiến hành đặt vé...',
			'note' => 'Ghi chú',
			'noInfo' => 'Không có thông tin',
			'noAccount' => 'Đăng nhập để đặt vé',
			'skip' => 'Bỏ qua',
			'receipt' => 'Hóa đơn',
			'payment' => 'Thanh toán',
			'pay' => 'Thanh toán',
			'error' => 'Đã có lỗi xảy ra',
			'success' => 'Thành công',
			'monthlyVehicle' => 'Xe tháng',
			'kIn' => 'Vào',
			'out' => 'Ra',
			'guest' => 'Xe vãng lai',
			'member' => 'Xe khách',
			'ticketId' => 'Số thẻ: {}',
			'time' => 'Thời gian',
			'reset' => 'Đặt lại',
			'date' => 'Ngày',
			'dateOf' => 'Ngày {}',
			'vehicleType' => 'Loại xe',
			'total' => 'Tổng cộng',
			'pass' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n, zero: '{} lượt', one: '{} lượt', many: '{} lượt', other: '{} lượt', ), 
			'name' => 'Tên',
			'phoneNumber' => 'Số điện thoại',
			'licenseNumber' => 'Biển số xe',
			'ticketID' => 'Mã số thẻ',
			'memberVehicleDetail' => 'Chi tiết xe tháng',
			'createMemberVehicle' => 'Thêm xe tháng',
			'lock' => 'Khóa',
			'ok' => 'OK',
			'cancel' => 'Hủy',
			'delete' => 'Xoá',
			'close' => 'Đóng',
			'apply' => 'Áp dụng',
			'enter' => 'Nhập',
			'choose' => 'Chọn',
			'currentPassword' => 'Mật khẩu hiện tại',
			'enterCurrentPassword' => 'Nhập mật khẩu hiện tại',
			'newPassword' => 'Mật khẩu mới',
			'enterNewPassword' => 'Nhập mật khẩu mới',
			'confirmNewPassword' => 'Nhập lại mật khẩu mới',
			'totalTime' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n, zero: 'Giờ gửi: dưới 1 phút', one: 'Giờ gửi: 1 phút', many: 'Giờ gửi: {} phút', other: 'Giờ gửi: {} phút', ), 
			'generalSettings' => 'Cài đặt chung',
			'soldSeat' => 'Chỗ đã bán',
			'selectingSeat' => 'Chỗ đang chọn',
			'availableSeat' => 'Chỗ trống',
			'selectedSeat' => 'Đã chọn {}/{} chỗ',
			'totalCost' => 'Tổng tiền: {}',
			'car' => 'Xe ô tô',
			'bicycle' => 'Xe đạp',
			'motorbike' => 'Xe máy',
			'info' => 'Thông tin',
			'address' => 'Địa chỉ',
			'branchName' => 'Tên chi nhánh',
			'capacity' => 'Sức chứa',
			'retake' => 'Chụp lại',
			'allowIn' => 'Cho vào',
			'allowOut' => 'Cho ra',
			'all' => 'Tất cả',
			'inUse' => 'Đang dùng',
			'lost' => 'Thất lạc',
			'markAsLost' => 'Báo thất lạc',
			'reportRecovered' => 'Báo khôi phục',
			'passenger' => 'Khách vãng lai',
			'parking' => 'Đang đỗ',
			'enterInteger' => 'Nhập số nguyên',
			'ticketSearch' => 'Tìm theo số xe/mã thẻ',
			'on' => 'Bật',
			'off' => 'Tắt',
			'isRemember' => 'Ghi nhớ tài khoản',
			'debuggerMode' => 'Chế độ gỡ lỗi',
			'biometricAuth' => 'Xác thực bằng vân tay',
			'seat' => 'Chỗ ngồi: {}{}',
			'loginSuccessed' => 'Đăng nhập thành công',
			'internetConnected' => 'Đã kết nối internet',
			'noInternet' => 'Không có kết nối internet',
			'noMoreData' => 'Không còn dữ liệu',
			'pullUpToLoad' => 'Kéo lên để tải thêm',
			'loadFailedPleaseRetry' => 'Tải thất bại! Vui lòng thử lại',
			'releaseToLoadMore' => 'Thả ra để tải thêm',
			'remainingTicket' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('vi'))(n, zero: 'Hết vé', one: 'Còn {} vé', many: 'Còn {} vé', other: 'Còn {} vé', ), 
			'email.short' => 'Email',
			'email.long' => 'Địa chỉ email',
			'idNumber.short' => 'CCCD',
			'idNumber.long' => 'CCCD',
			'phone.short' => 'SĐT',
			'phone.long' => 'Số điện thoại',
			'errorMessage.required' => 'Vui lòng không để trống!',
			'errorMessage.confirmPassword' => 'Mật khẩu nhập lại không trùng khớp!',
			'noData.search' => 'Không có dữ liệu',
			'noData.availableSeat' => 'Không còn chỗ trống',
			'title.login' => 'Đăng nhập',
			'title.logout' => 'Đăng xuất',
			'title.signUp' => 'Đăng ký',
			'title.exit' => 'Thoát',
			'title.sessionEnded' => 'Phiên đăng nhập đã kết thúc.',
			'title.adult' => 'Người lớn',
			'title.otp' => 'OTP',
			'title.addInfo' => 'Thông tin hành khách',
			'title.createPassword' => 'Tạo mật khẩu',
			'title.forgetPassword' => 'Quên mật khẩu',
			'title.warningThreshold' => 'Cảnh báo khi sắp hết chỗ',
			'title.extend' => 'Gia hạn',
			'subtitle.login' => 'Nhập thông tin tài khoản của bạn',
			'subtitle.logout' => 'Bạn có muốn đăng xuất khỏi tài khoản hay không?',
			'subtitle.signUp' => 'Nhập địa chỉ email của bạn',
			'subtitle.exit' => 'Bạn đang rời khỏi trang',
			'subtitle.sessionEnded' => 'Phiên đăng nhập của bạn đã kết thúc. Nhằm đảm bảo bảo mật, hãy đăng nhập lại để tiếp tục sử dụng ứng dụng.',
			'subtitle.adult' => 'Thêm thông tin như trên CCCD/hộ chiếu',
			'subtitle.otp' => 'Nhập mã OTP',
			'subtitle.addInfo' => 'Nhập những thông tin cần thiết để sử dụng ứng dụng',
			'subtitle.createPassword' => 'Nhập mật khẩu của bạn',
			'subtitle.forgetPassword' => 'Nhập địa chỉ email của bạn',
			'subtitle.warningThreshold' => 'Khi nhà xe sắp hết chỗ, hệ thống sẽ hiển thị cảnh báo.',
			'subtitle.extend' => 'Bạn có muốn gia hạn không?',
			'tokenVerificationFailed' => 'Xác thực thất bại',
			'vi_VN' => 'Tiếng Việt',
			'en_US' => 'Tiếng Anh',
			'ja' => 'Tiếng Nhật',
			'ticketNumber' => 'Mã vé',
			'dragText' => 'Kéo để tải',
			'armedText' => 'Thả ra để tải',
			'readyText' => 'Đang tải',
			'processingText' => 'Đang tải',
			'processedText' => 'Thành công',
			'noMoreText' => 'Không còn dữ liệu',
			'failedText' => 'Tải thất bại',
			_ => null,
		};
	}
}
