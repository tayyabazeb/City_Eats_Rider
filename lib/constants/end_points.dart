class EndPoints {
  static const userProfile = 'v1/getUser';
  static const updateProfile = 'v1/userInfoUpdate';
  static const fcmToken = 'customer/v1/update/fcm';
  static const clearFcmToken = 'customer/v1/clear/fcm';

  ///authentication
  static const login = 'rider/v1/login';
  static const signUp = 'rider/v1/register';
  static const verifyOtp = 'rider/v1/verify_otp';
  static const generateOTP = 'rider/v1/resend_otp';

  static const deleteAccount = 'v1/delete_account';
  static const resetPassword = 'v1/password/reset';
  static const forgotPassword = 'v1/password/email';

  static const changePassword = 'v1/change-password';

  static const getIdentity = 'rider/v1/license';
  static const addIdentity = 'rider/v1/license/add';
  static const updateIdentity = 'rider/v1/license/update';

  static const getVehicleDetails = 'rider/v1/vehicle';
  static const addVehicleDetails = 'rider/v1/vehicle/add';
  static const updateVehicleDetails = 'rider/v1/vehicle/update';

  static const addAddress = 'rider/v1/address/add';
  static const getAddress = 'rider/v1/address';
  static const updateAddress = 'rider/v1/address/update';

  static const acceptOrder = 'rider/v1/order/request/accept';
  static const currentRide = 'rider/v1/order/active';
  static const updateRideStatus = 'rider/v1/order/update/status';

  static const toggleOnlineOffline = 'rider/v1/update/status';

  static const getHomeData = 'rider/v1/homeScreen';
  static const vehicleType = 'rider/v1/vehicle_types';

  static const restaurantCat = 'customer/v1/resturant/categories/products';
  static const featureRestaurant = 'customer/v1/resturant/feature';
  static const favRestaurants = 'customer/v1/favorite/restaurants';
  static const categoryRestaurants = 'v1/getRestuarantAndFoodAgainstCategory';

  static const addToCart = 'customer/v1/cart/products/add';
  static const myCart = 'customer/v1/cart';
  static const updateProductCount = 'customer/v1/cart/update/product/count';
  static const clearCart = 'customer/v1/cart/clear';
  static const removeItem = 'customer/v1/cart/remove/product';

  static const applyVoucher = '';

  static const allOrder = 'rider/v1/orders/history';

  static const specificOrder = 'v1/showOrderById';
  static const placeOrder = 'customer/v1/placeOrder';
  static const completeOrder = 'v1/user/complete_order';
  static const recentOrder = 'v1/getRecentOrder';
  static const cancelOrder = 'customer/v1/cancelOrder';

  static const location = 'v1/userAddressAdd';
  static const updateLocation = 'v1/userAddressUpdate';
  static const deleteLocation = 'v1/deleteAddress';
  static const userLocations = 'v1/userAddressList';
  static const wallet = 'rider/v1/wallet';
  static const ratings = 'rider/v1/rating/list';

  static const allCoupons = 'customer/v1/coupons/all';
  static const applyCoupon = 'customer/v1/coupon/apply';
  static const dispute = 'customer/v1/dispute/add';
  static const allGroceries = 'customer/v1/grocery_stores/all';
  static const toggleFav = 'customer/v1/add/restaurant/favorite';
  static const search = 'customer/v1/search/by/keyword';
  static const filter = 'customer/v1/filter';
}
