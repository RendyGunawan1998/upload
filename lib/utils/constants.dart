// ------- config App ---------
const bool APP_DEV = false;
// if true, means APP in development mode

// ------- App Name ---------
const String APP_NAME = "Puskeu";
const String SECONDARY_APP_NAME = "Online";

const APP_LINK_UPDATE_ANDROID =
    "http://www.puskeuonline.com/share/puskeu-online.apk";
const APP_LINK_UPDATE_IOS = "";

// ------- config Endpoint ---------
const String BASE_URL =
APP_DEV ? "http://api1.puskeuonline.com" : "http://api1.puskeuonline.com";
const String CLIENT_ID_CUSTOMER = APP_DEV ? "1" : "1";
const String CLIENT_SECRET_CUSTOMER = APP_DEV
    ? "WlUB9O2rkEqdkpDRitlS3iEtrDVzJlCQad737ZtO"
    : "WlUB9O2rkEqdkpDRitlS3iEtrDVzJlCQad737ZtO";

const String API_ENDPOINT = "";
const String PAGE_PAGINATION = "10";
const String PER_PAGE = "per_page=" + PAGE_PAGINATION;
const String LOGIN_ENDPOINT = BASE_URL + "/api/login";
const String T_C_FORGOT_PASSWORD_URL = BASE_URL + "/password/reset";
const String DRIVER_FORGOT_PASSWORD_URL = BASE_URL + "/drivers/password/reset";
const String REGISTER_URL = BASE_URL + "/register";

const String COMMON_API_ENDPOINT = "/api/v1/";
const String DRIVER_API_ENDPOINT = "/api/driver/v1/";
const String TRANSPORTER_API_ENDPOINT = "/api/transporter/v1/";
const String CUSTOMER_API_ENDPOINT = "/api/customer/v1/";

const double SCREEN_SIZE_320 = 320;
const double SCREEN_SIZE_360 = 360;

// ------- mode config ---------
const String COUNTRY_CODE = "ID";
const String MODE_PICK = "Pick";
const String MODE_DETAILS = "Details";
const String MODE_VIEW = "View";
const String STATUS_FAIL = "Fail";
const String STATUS_PASS = "Pass";
const String STATUS_ONTRIP = "On Trip";
const String STATUS_COMPLETED = "Completed";
const String MODE_UPDATE = "UPDATE";
const String MODE_INSERT = "INSERT";

// ------- Local Storage Key ---------
const String APP_OAUTHDATA_KEY = "oAuthData";
const String APP_USERDATA_KEY = "userData";
const String APP_USERMODE_KEY = "userMode";
const String APP_SEARCH_HISTORY_KEY = "searchHistory";

// ------- config OneSignal ---------
const String FB_SENDER_ID = "496322084529";
const String ONESIGNAL_APP_ID = "1c0ca2d1-c1e3-4102-93e0-7d14f4285b7e";

// ------- AppBar -------
const double APPBAR_ELEVATION = 1;

// ------- Image Assets ---------
const double IMAGES_HEIGHT = 180;
const String BACKGROUND_PROFILE = "assets/img/bg-map-min.png";
const String BACKGROUND_BUILDING = "assets/img/building.png";
const String LOGO = "assets/img/logo.png";
const String LOGO_WHITE = "assets/img/login-logo.png";
const String LOGO_ORANGE = "assets/img/logo-orange.png";
const String DEFAULT_PROFILE_IMAGE = "assets/img/profile-pic.png";
const String DEFAULT_NO_IMAGE = "assets/img/ic_no_image.png";
const String DEFAULT_NO_DATA = "assets/img/no-data.png";
const String GMAP_ICON = "assets/img/google-maps-48.png";
const String CAMERA_SHUTTER = "assets/img/ic_shutter.png";
const String CAMERA_SHUTTER_1 = "assets/img/ic_shutter_1.png";
const String CAMERA_SWITCH = "assets/img/ic_switch_camera.png";
const String ICON_PICK_UP = "assets/img/1-pick-up.png";
const String ICON_PICK_UP_CHECK = "assets/img/1-pick-up-check.png";
const String ICON_PICK_UP_OFF = "assets/img/1-pick-up-off.png";
const String ICON_IN_PLANT = "assets/img/2-in-plant.png";
const String ICON_IN_PLANT_CHECK = "assets/img/2-in-plant-check.png";
const String ICON_IN_PLANT_OFF = "assets/img/2-in-plant-off.png";
const String ICON_ON_TRIP = "assets/img/3-on-trip.png";
const String ICON_ON_TRIP_CHECK = "assets/img/3-on-trip-check.png";
const String ICON_ON_TRIP_OFF = "assets/img/3-on-trip-off.png";
const String ICON_RECEIVE = "assets/img/4-receive.png";
const String ICON_RECEIVE_CHECK = "assets/img/4-receive-check.png";
const String ICON_RECEIVE_OFF = "assets/img/4-receive-off.png";

const String CIRCLE_IMAGE = "assets/img/circle.png";
const String TRIANGLE_LEFT = "assets/img/triangle_left.png";
const String TRIANGLE_RIGHT = "assets/img/triangle_right.png";
const String TRIANGLE_INV_LEFT = "assets/img/triangle_inv_left.png";
const String TRIANGLE_INV_RIGHT = "assets/img/triangle_inv_right.png";
const String QR_SCAN = "assets/img/icon_scan.png";
