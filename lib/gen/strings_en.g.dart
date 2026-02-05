///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'English'
	String get en => 'English';

	/// en: 'Vietnamese'
	String get vi => 'Vietnamese';

	/// en: 'Site'
	String get site => 'Site';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'New Name'
	String get newName => 'New Name';

	/// en: 'Enter Name'
	String get enterName => 'Enter Name';

	/// en: 'TSP Parking'
	String get appTitle => 'TSP Parking';

	/// en: 'Complete'
	String get complete => 'Complete';

	/// en: 'Unexpected error happened!'
	String get unexpectedError => 'Unexpected error happened!';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm password'
	String get confirmPassword => 'Confirm password';

	/// en: 'Remember me'
	String get remember => 'Remember me';

	/// en: 'Forget password?'
	String get forgetPassword => 'Forget password?';

	/// en: 'Sign up now'
	String get signUpNow => 'Sign up now';

	/// en: 'Home page'
	String get home => 'Home page';

	/// en: 'Activity'
	String get activity => 'Activity';

	/// en: 'History'
	String get history => 'History';

	/// en: 'Parking history'
	String get parkingHistory => 'Parking history';

	/// en: 'Statistic'
	String get statistic => 'Statistic';

	/// en: 'Revenue'
	String get revenue => 'Revenue';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Enter ticket number here'
	String get enterTicketNumber => 'Enter ticket number here';

	/// en: 'January'
	String get january => 'January';

	/// en: 'February'
	String get february => 'February';

	/// en: 'March'
	String get march => 'March';

	/// en: 'April'
	String get april => 'April';

	/// en: 'May'
	String get may => 'May';

	/// en: 'June'
	String get june => 'June';

	/// en: 'July'
	String get july => 'July';

	/// en: 'August'
	String get august => 'August';

	/// en: 'September'
	String get september => 'September';

	/// en: 'October'
	String get october => 'October';

	/// en: 'November'
	String get november => 'November';

	/// en: 'December'
	String get december => 'December';

	/// en: 'Total revenue'
	String get totalRevenue => 'Total revenue';

	/// en: 'Parking price'
	String get parkingPrice => 'Parking price';

	/// en: 'Member fee'
	String get memberFee => 'Member fee';

	/// en: 'Parking area configuration'
	String get parkingAreaConfig => 'Parking area configuration';

	/// en: 'Employee management'
	String get employeeManagement => 'Employee management';

	/// en: 'Member vehicles'
	String get memberVehicles => 'Member vehicles';

	/// en: 'General configuration'
	String get generalConfig => 'General configuration';

	/// en: 'Change name'
	String get changeName => 'Change name';

	/// en: 'This feature is under development'
	String get developingFeature => 'This feature is under development';

	/// en: 'Journey's information'
	String get journeyInformation => 'Journey\'s information';

	/// en: 'Parking lot configuration'
	String get configParkingLot => 'Parking lot configuration';

	/// en: 'Ticket management'
	String get manageTicket => 'Ticket management';

	/// en: 'Capacity configuration'
	String get configCapacity => 'Capacity configuration';

	/// en: 'Your journey'
	String get yourJourney => 'Your journey';

	/// en: 'View details'
	String get viewDetails => 'View details';

	/// en: 'Book tickets'
	String get bookTickets => 'Book tickets';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Light mode'
	String get lightMode => 'Light mode';

	/// en: 'Dark mode'
	String get darkMode => 'Dark mode';

	/// en: 'Departure station'
	String get departureStation => 'Departure station';

	/// en: 'Arrival station'
	String get arrivalStation => 'Arrival station';

	/// en: 'Round-trip'
	String get roundTrip => 'Round-trip';

	/// en: '{name} Station'
	String station({required Object name}) => '${name} Station';

	/// en: 'Login success'
	String get loginSuccess => 'Login success';

	/// en: 'Change password'
	String get changePassword => 'Change password';

	/// en: 'Gender'
	String get gender => 'Gender';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Change app language'
	String get changeLanguage => 'Change app language';

	/// en: 'Change app theme'
	String get changeTheme => 'Change app theme';

	/// en: 'Zusa'
	String get drawer => 'Zusa';

	/// en: 'Reload'
	String get reload => 'Reload';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'App settings'
	String get appSettings => 'App settings';

	/// en: 'Follow system'
	String get followSystem => 'Follow system';

	/// en: 'Fingerprint authentication'
	String get fingerprintAuthentication => 'Fingerprint authentication';

	/// en: 'Contact information'
	String get contactInfo => 'Contact information';

	/// en: 'Customer information'
	String get customerInfo => 'Customer information';

	/// en: 'Booking information'
	String get bookingInfo => 'Booking information';

	/// en: 'Booking in progress...'
	String get bookingInProgress => 'Booking in progress...';

	/// en: 'Note'
	String get note => 'Note';

	/// en: 'No information'
	String get noInfo => 'No information';

	/// en: 'Login to book tickets'
	String get noAccount => 'Login to book tickets';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Receipt'
	String get receipt => 'Receipt';

	/// en: 'Payment'
	String get payment => 'Payment';

	/// en: 'Go to payment'
	String get pay => 'Go to payment';

	/// en: 'General settings'
	String get generalSettings => 'General settings';

	/// en: 'Sold seat'
	String get soldSeat => 'Sold seat';

	/// en: 'Selecting seat'
	String get selectingSeat => 'Selecting seat';

	/// en: 'Available seat'
	String get availableSeat => 'Available seat';

	/// en: 'Error happened'
	String get error => 'Error happened';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Monthly vehicle'
	String get monthlyVehicle => 'Monthly vehicle';

	/// en: 'In'
	String get kIn => 'In';

	/// en: 'Out'
	String get out => 'Out';

	/// en: 'Guest vehicle'
	String get guest => 'Guest vehicle';

	/// en: 'Member vehicle'
	String get member => 'Member vehicle';

	/// en: 'Ticket number: {id}'
	String ticketId({required Object id}) => 'Ticket number: ${id}';

	/// en: 'Total'
	String get total => 'Total';

	/// en: '(zero) {{count} pass} (one) {{count} pass} (many) {{count} passes} (other) {{count} pass(es)}'
	String pass({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		zero: '${count} pass',
		one: '${count} pass',
		many: '${count} passes',
		other: '${count} pass(es)',
	);

	/// en: 'Time'
	String get time => 'Time';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Date {val}'
	String dateOf({required Object val}) => 'Date ${val}';

	/// en: 'Vehicle type'
	String get vehicleType => 'Vehicle type';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Phone number'
	String get phoneNumber => 'Phone number';

	/// en: 'License number'
	String get licenseNumber => 'License number';

	/// en: 'Ticket ID'
	String get ticketID => 'Ticket ID';

	/// en: 'Member vehicle detail'
	String get memberVehicleDetail => 'Member vehicle detail';

	/// en: 'Add member vehicle'
	String get createMemberVehicle => 'Add member vehicle';

	/// en: 'Lock'
	String get lock => 'Lock';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Apply'
	String get apply => 'Apply';

	/// en: 'Enter'
	String get enter => 'Enter';

	/// en: 'Choose'
	String get choose => 'Choose';

	/// en: 'Current password'
	String get currentPassword => 'Current password';

	/// en: 'Enter current password'
	String get enterCurrentPassword => 'Enter current password';

	/// en: 'New password'
	String get newPassword => 'New password';

	/// en: 'Enter new password'
	String get enterNewPassword => 'Enter new password';

	/// en: 'Confirm new password'
	String get confirmNewPassword => 'Confirm new password';

	/// en: '(zero) {Total time: under a minute} (one) {Total time: 1 minute} (many) {Total time: {count} minutes} (other) {Total time: {count} minute(s)}'
	String totalTime({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		zero: 'Total time: under a minute',
		one: 'Total time: 1 minute',
		many: 'Total time: ${count} minutes',
		other: 'Total time: ${count} minute(s)',
	);

	/// en: 'Selected {current}/{total} seat(s)'
	String selectedSeat({required Object current, required Object total}) => 'Selected ${current}/${total} seat(s)';

	/// en: 'Total cost: {cost}'
	String totalCost({required Object cost}) => 'Total cost: ${cost}';

	/// en: 'Car'
	String get car => 'Car';

	/// en: 'Bicycle'
	String get bicycle => 'Bicycle';

	/// en: 'Motorbike'
	String get motorbike => 'Motorbike';

	/// en: 'Information'
	String get info => 'Information';

	/// en: 'Address'
	String get address => 'Address';

	/// en: 'Branch name'
	String get branchName => 'Branch name';

	/// en: 'Capacity'
	String get capacity => 'Capacity';

	/// en: 'Retake'
	String get retake => 'Retake';

	/// en: 'Allow in'
	String get allowIn => 'Allow in';

	/// en: 'Allow out'
	String get allowOut => 'Allow out';

	/// en: 'All'
	String get all => 'All';

	/// en: 'In use'
	String get inUse => 'In use';

	/// en: 'Lost'
	String get lost => 'Lost';

	/// en: 'Mark as lost'
	String get markAsLost => 'Mark as lost';

	/// en: 'Report recovered'
	String get reportRecovered => 'Report recovered';

	/// en: 'Passenger'
	String get passenger => 'Passenger';

	/// en: 'Parking'
	String get parking => 'Parking';

	/// en: 'Seat: {row}{col}'
	String seat({required Object row, required Object col}) => 'Seat: ${row}${col}';

	/// en: 'Enter integer'
	String get enterInteger => 'Enter integer';

	/// en: 'Search by plate/card'
	String get ticketSearch => 'Search by plate/card';

	/// en: 'On'
	String get on => 'On';

	/// en: 'Off'
	String get off => 'Off';

	/// en: 'Remember me'
	String get isRemember => 'Remember me';

	/// en: 'Debugging mode'
	String get debuggerMode => 'Debugging mode';

	/// en: 'Biometric authentication'
	String get biometricAuth => 'Biometric authentication';

	/// en: 'No more data'
	String get noMoreData => 'No more data';

	/// en: 'Pull up to load more'
	String get pullUpToLoad => 'Pull up to load more';

	/// en: 'Load failed! Please retry'
	String get loadFailedPleaseRetry => 'Load failed! Please retry';

	/// en: 'Release to load more'
	String get releaseToLoadMore => 'Release to load more';

	/// en: 'Login successed'
	String get loginSuccessed => 'Login successed';

	/// en: 'Internet connected'
	String get internetConnected => 'Internet connected';

	/// en: 'No internet connection'
	String get noInternet => 'No internet connection';

	/// en: '(zero) {Sold out} (one) {{count} ticket remain} (many) {{count} tickets remain} (other) {{count} tickets remain}'
	String remainingTicket({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		zero: 'Sold out',
		one: '${count} ticket remain',
		many: '${count} tickets remain',
		other: '${count} tickets remain',
	);

	/// en: 'Email'
	String get email_short => 'Email';

	/// en: 'Email address'
	String get email_long => 'Email address';

	/// en: 'ID'
	String get idNumber_short => 'ID';

	/// en: 'ID Number'
	String get idNumber_long => 'ID Number';

	/// en: 'Phone'
	String get phone_short => 'Phone';

	/// en: 'Phone'
	String get phone_long => 'Phone';

	/// en: 'Please do not leave blank!'
	String get errorMessage_required => 'Please do not leave blank!';

	/// en: 'Re-entered password does not match!'
	String get errorMessage_confirmPassword => 'Re-entered password does not match!';

	/// en: 'No data found'
	String get noData_search => 'No data found';

	/// en: 'No available seats found'
	String get noData_availableSeat => 'No available seats found';

	/// en: 'Login'
	String get title_login => 'Login';

	/// en: 'Log out'
	String get title_logout => 'Log out';

	/// en: 'Sign Up'
	String get title_signUp => 'Sign Up';

	/// en: 'Exit'
	String get title_exit => 'Exit';

	/// en: 'Login session ended'
	String get title_sessionEnded => 'Login session ended';

	/// en: 'Adult'
	String get title_adult => 'Adult';

	/// en: 'OTP'
	String get title_otp => 'OTP';

	/// en: 'Customer Information'
	String get title_addInfo => 'Customer Information';

	/// en: 'Create Password'
	String get title_createPassword => 'Create Password';

	/// en: 'Forgot Password'
	String get title_forgetPassword => 'Forgot Password';

	/// en: 'Warning when space is running out'
	String get title_warningThreshold => 'Warning when space is running out';

	/// en: 'Extend'
	String get title_extend => 'Extend';

	/// en: 'Enter your account information'
	String get subtitle_login => 'Enter your account information';

	/// en: 'Are you sure you want to log out from this account?'
	String get subtitle_logout => 'Are you sure you want to log out from this account?';

	/// en: 'Enter your email address'
	String get subtitle_signUp => 'Enter your email address';

	/// en: 'You about to exit this page'
	String get subtitle_exit => 'You about to exit this page';

	/// en: 'Your login session has ended. For your security, please log in again to continue using the app.'
	String get subtitle_sessionEnded => 'Your login session has ended. For your security, please log in again to continue using the app.';

	/// en: 'Add information as on Citizen ID/Passport'
	String get subtitle_adult => 'Add information as on Citizen ID/Passport';

	/// en: 'Please enter the OTP'
	String get subtitle_otp => 'Please enter the OTP';

	/// en: 'Enter the required information to use the app'
	String get subtitle_addInfo => 'Enter the required information to use the app';

	/// en: 'Enter your password'
	String get subtitle_createPassword => 'Enter your password';

	/// en: 'Enter your email address'
	String get subtitle_forgetPassword => 'Enter your email address';

	/// en: 'When the parking lot is almost full, the system will display a warning.'
	String get subtitle_warningThreshold => 'When the parking lot is almost full, the system will display a warning.';

	/// en: 'Do you want to extend?'
	String get subtitle_extend => 'Do you want to extend?';

	/// en: 'Verification failed'
	String get tokenVerificationFailed => 'Verification failed';

	/// en: 'Vietnamese'
	String get vi_VN => 'Vietnamese';

	/// en: 'English'
	String get en_US => 'English';

	/// en: 'Japanese'
	String get ja => 'Japanese';

	/// en: 'Ticket number'
	String get ticketNumber => 'Ticket number';

	/// en: 'Pull to load'
	String get dragText => 'Pull to load';

	/// en: 'Release to load'
	String get armedText => 'Release to load';

	/// en: 'Loading'
	String get readyText => 'Loading';

	/// en: 'Loading'
	String get processingText => 'Loading';

	/// en: 'Success'
	String get processedText => 'Success';

	/// en: 'No more data'
	String get noMoreText => 'No more data';

	/// en: 'Load failed'
	String get failedText => 'Load failed';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'en' => 'English',
			'vi' => 'Vietnamese',
			'site' => 'Site',
			'save' => 'Save',
			'newName' => 'New Name',
			'enterName' => 'Enter Name',
			'appTitle' => 'TSP Parking',
			'complete' => 'Complete',
			'unexpectedError' => 'Unexpected error happened!',
			'username' => 'Username',
			'password' => 'Password',
			'confirmPassword' => 'Confirm password',
			'remember' => 'Remember me',
			'forgetPassword' => 'Forget password?',
			'signUpNow' => 'Sign up now',
			'home' => 'Home page',
			'activity' => 'Activity',
			'history' => 'History',
			'parkingHistory' => 'Parking history',
			'statistic' => 'Statistic',
			'revenue' => 'Revenue',
			'account' => 'Account',
			'search' => 'Search',
			'enterTicketNumber' => 'Enter ticket number here',
			'january' => 'January',
			'february' => 'February',
			'march' => 'March',
			'april' => 'April',
			'may' => 'May',
			'june' => 'June',
			'july' => 'July',
			'august' => 'August',
			'september' => 'September',
			'october' => 'October',
			'november' => 'November',
			'december' => 'December',
			'totalRevenue' => 'Total revenue',
			'parkingPrice' => 'Parking price',
			'memberFee' => 'Member fee',
			'parkingAreaConfig' => 'Parking area configuration',
			'employeeManagement' => 'Employee management',
			'memberVehicles' => 'Member vehicles',
			'generalConfig' => 'General configuration',
			'changeName' => 'Change name',
			'developingFeature' => 'This feature is under development',
			'journeyInformation' => 'Journey\'s information',
			'configParkingLot' => 'Parking lot configuration',
			'manageTicket' => 'Ticket management',
			'configCapacity' => 'Capacity configuration',
			'yourJourney' => 'Your journey',
			'viewDetails' => 'View details',
			'bookTickets' => 'Book tickets',
			'filter' => 'Filter',
			'lightMode' => 'Light mode',
			'darkMode' => 'Dark mode',
			'departureStation' => 'Departure station',
			'arrivalStation' => 'Arrival station',
			'roundTrip' => 'Round-trip',
			'station' => ({required Object name}) => '${name} Station',
			'loginSuccess' => 'Login success',
			'changePassword' => 'Change password',
			'gender' => 'Gender',
			'male' => 'Male',
			'female' => 'Female',
			'kContinue' => 'Continue',
			'quit' => 'Quit',
			'language' => 'Language',
			'changeLanguage' => 'Change app language',
			'changeTheme' => 'Change app theme',
			'drawer' => 'Zusa',
			'reload' => 'Reload',
			'settings' => 'Settings',
			'appSettings' => 'App settings',
			'followSystem' => 'Follow system',
			'fingerprintAuthentication' => 'Fingerprint authentication',
			'contactInfo' => 'Contact information',
			'customerInfo' => 'Customer information',
			'bookingInfo' => 'Booking information',
			'bookingInProgress' => 'Booking in progress...',
			'note' => 'Note',
			'noInfo' => 'No information',
			'noAccount' => 'Login to book tickets',
			'skip' => 'Skip',
			'receipt' => 'Receipt',
			'payment' => 'Payment',
			'pay' => 'Go to payment',
			'generalSettings' => 'General settings',
			'soldSeat' => 'Sold seat',
			'selectingSeat' => 'Selecting seat',
			'availableSeat' => 'Available seat',
			'error' => 'Error happened',
			'success' => 'Success',
			'monthlyVehicle' => 'Monthly vehicle',
			'kIn' => 'In',
			'out' => 'Out',
			'guest' => 'Guest vehicle',
			'member' => 'Member vehicle',
			'ticketId' => ({required Object id}) => 'Ticket number: ${id}',
			'total' => 'Total',
			'pass' => ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count, zero: '${count} pass', one: '${count} pass', many: '${count} passes', other: '${count} pass(es)', ), 
			'time' => 'Time',
			'reset' => 'Reset',
			'date' => 'Date',
			'dateOf' => ({required Object val}) => 'Date ${val}',
			'vehicleType' => 'Vehicle type',
			'name' => 'Name',
			'phoneNumber' => 'Phone number',
			'licenseNumber' => 'License number',
			'ticketID' => 'Ticket ID',
			'memberVehicleDetail' => 'Member vehicle detail',
			'createMemberVehicle' => 'Add member vehicle',
			'lock' => 'Lock',
			'ok' => 'OK',
			'cancel' => 'Cancel',
			'delete' => 'Delete',
			'close' => 'Close',
			'apply' => 'Apply',
			'enter' => 'Enter',
			'choose' => 'Choose',
			'currentPassword' => 'Current password',
			'enterCurrentPassword' => 'Enter current password',
			'newPassword' => 'New password',
			'enterNewPassword' => 'Enter new password',
			'confirmNewPassword' => 'Confirm new password',
			'totalTime' => ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count, zero: 'Total time: under a minute', one: 'Total time: 1 minute', many: 'Total time: ${count} minutes', other: 'Total time: ${count} minute(s)', ), 
			'selectedSeat' => ({required Object current, required Object total}) => 'Selected ${current}/${total} seat(s)',
			'totalCost' => ({required Object cost}) => 'Total cost: ${cost}',
			'car' => 'Car',
			'bicycle' => 'Bicycle',
			'motorbike' => 'Motorbike',
			'info' => 'Information',
			'address' => 'Address',
			'branchName' => 'Branch name',
			'capacity' => 'Capacity',
			'retake' => 'Retake',
			'allowIn' => 'Allow in',
			'allowOut' => 'Allow out',
			'all' => 'All',
			'inUse' => 'In use',
			'lost' => 'Lost',
			'markAsLost' => 'Mark as lost',
			'reportRecovered' => 'Report recovered',
			'passenger' => 'Passenger',
			'parking' => 'Parking',
			'seat' => ({required Object row, required Object col}) => 'Seat: ${row}${col}',
			'enterInteger' => 'Enter integer',
			'ticketSearch' => 'Search by plate/card',
			'on' => 'On',
			'off' => 'Off',
			'isRemember' => 'Remember me',
			'debuggerMode' => 'Debugging mode',
			'biometricAuth' => 'Biometric authentication',
			'noMoreData' => 'No more data',
			'pullUpToLoad' => 'Pull up to load more',
			'loadFailedPleaseRetry' => 'Load failed! Please retry',
			'releaseToLoadMore' => 'Release to load more',
			'loginSuccessed' => 'Login successed',
			'internetConnected' => 'Internet connected',
			'noInternet' => 'No internet connection',
			'remainingTicket' => ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count, zero: 'Sold out', one: '${count} ticket remain', many: '${count} tickets remain', other: '${count} tickets remain', ), 
			'email_short' => 'Email',
			'email_long' => 'Email address',
			'idNumber_short' => 'ID',
			'idNumber_long' => 'ID Number',
			'phone_short' => 'Phone',
			'phone_long' => 'Phone',
			'errorMessage_required' => 'Please do not leave blank!',
			'errorMessage_confirmPassword' => 'Re-entered password does not match!',
			'noData_search' => 'No data found',
			'noData_availableSeat' => 'No available seats found',
			'title_login' => 'Login',
			'title_logout' => 'Log out',
			'title_signUp' => 'Sign Up',
			'title_exit' => 'Exit',
			'title_sessionEnded' => 'Login session ended',
			'title_adult' => 'Adult',
			'title_otp' => 'OTP',
			'title_addInfo' => 'Customer Information',
			'title_createPassword' => 'Create Password',
			'title_forgetPassword' => 'Forgot Password',
			'title_warningThreshold' => 'Warning when space is running out',
			'title_extend' => 'Extend',
			'subtitle_login' => 'Enter your account information',
			'subtitle_logout' => 'Are you sure you want to log out from this account?',
			'subtitle_signUp' => 'Enter your email address',
			'subtitle_exit' => 'You about to exit this page',
			'subtitle_sessionEnded' => 'Your login session has ended. For your security, please log in again to continue using the app.',
			'subtitle_adult' => 'Add information as on Citizen ID/Passport',
			'subtitle_otp' => 'Please enter the OTP',
			'subtitle_addInfo' => 'Enter the required information to use the app',
			'subtitle_createPassword' => 'Enter your password',
			'subtitle_forgetPassword' => 'Enter your email address',
			'subtitle_warningThreshold' => 'When the parking lot is almost full, the system will display a warning.',
			'subtitle_extend' => 'Do you want to extend?',
			'tokenVerificationFailed' => 'Verification failed',
			'vi_VN' => 'Vietnamese',
			'en_US' => 'English',
			'ja' => 'Japanese',
			'ticketNumber' => 'Ticket number',
			'dragText' => 'Pull to load',
			'armedText' => 'Release to load',
			'readyText' => 'Loading',
			'processingText' => 'Loading',
			'processedText' => 'Success',
			'noMoreText' => 'No more data',
			'failedText' => 'Load failed',
			_ => null,
		};
	}
}
