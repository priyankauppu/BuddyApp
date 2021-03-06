// Generated by Apple Swift version 3.0.1 (swiftlang-800.0.58.6 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import MapKit;
@import CoreLocation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UILabel;
@class NSCoder;

SWIFT_CLASS("_TtC5Buddy29AcceptedRequestsTableViewCell")
@interface AcceptedRequestsTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyEmail;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyRestaurant;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyCuisine;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyTime;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSMutableDictionary;
@class UITableView;
@class UIBarButtonItem;
@class NSBundle;

SWIFT_CLASS("_TtC5Buddy35AcceptedRequestsTableViewController")
@interface AcceptedRequestsTableViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyName;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyEmail;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyCuisine;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyRestaurant;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyTime;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)getAcceptedRequestsWithUserEmail:(NSString * _Nonnull)userEmail;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC5Buddy11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;

SWIFT_CLASS("_TtC5Buddy25BuddiesGoingTableViewCell")
@interface BuddiesGoingTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyRestaurant;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyCuisine;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyEmail;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified sendInviteButton;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class CLLocationManager;
@class CLLocation;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC5Buddy31BuddiesGoingTableViewController")
@interface BuddiesGoingTableViewController : UITableViewController
@property (nonatomic, copy) NSString * _Nonnull restaurant;
@property (nonatomic, copy) NSString * _Nonnull cuisine;
@property (nonatomic) double restaurantLatitude;
@property (nonatomic) double restaurantLongitude;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyName;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyCuisine;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyRestaurant;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyEmail;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, strong) CLLocation * _Nonnull location;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para1;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull prefsName;
@property (nonatomic, copy) NSString * _Nonnull testEmail;
@property (nonatomic, copy) NSString * _Nonnull testName;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)findNearByBuddies;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)sendInviteButtonClickedWithTestName:(NSString * _Nonnull)testName testEmail:(NSString * _Nonnull)testEmail;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy35BuddiesWithHealthGoingTableViewCell")
@interface BuddiesWithHealthGoingTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyRestaurant;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyCuisine;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified sendInviteButton;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyEmail;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy41BuddiesWithHealthGoingTableViewController")
@interface BuddiesWithHealthGoingTableViewController : UITableViewController
@property (nonatomic, copy) NSString * _Nonnull restaurant;
@property (nonatomic, copy) NSString * _Nonnull cuisine;
@property (nonatomic) double restaurantLatitude;
@property (nonatomic) double restaurantLongitude;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyName;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyCuisine;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyRestaurant;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyEmail;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, strong) CLLocation * _Nonnull location;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para1;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull prefsName;
@property (nonatomic, copy) NSString * _Nonnull testName;
@property (nonatomic, copy) NSString * _Nonnull testEmail;
@property (nonatomic, copy) NSString * _Nonnull testCuisine;
@property (nonatomic, copy) NSString * _Nonnull testRestaurant;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)sendInvite;
- (void)findNearByBuddies;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)sendInviteButtonClickedWithTestName:(NSString * _Nonnull)testName testEmail:(NSString * _Nonnull)testEmail;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class MKMapView;
@protocol MKOverlay;
@class MKOverlayRenderer;

SWIFT_CLASS("_TtC5Buddy23DirectionViewController")
@interface DirectionViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet MKMapView * _Null_unspecified mapView;
@property (nonatomic) double restaurantLatitude;
@property (nonatomic) double restaurantLongitude;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull displayMessage;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified message;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (MKOverlayRenderer * _Nonnull)mapView:(MKMapView * _Nonnull)mapView rendererForOverlay:(id <MKOverlay> _Nonnull)overlay;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy33DirectionWithHealthViewController")
@interface DirectionWithHealthViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, weak) IBOutlet MKMapView * _Null_unspecified mapView;
@property (nonatomic) double restaurantLatitude;
@property (nonatomic) double restaurantLongitude;
@property (nonatomic, copy) NSString * _Nonnull displayMessage;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified message;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (MKOverlayRenderer * _Nonnull)mapView:(MKMapView * _Nonnull)mapView rendererForOverlay:(id <MKOverlay> _Nonnull)overlay;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class MKPointAnnotation;
@class MKPolygon;
@protocol MKAnnotation;
@class MKAnnotationView;
@class UIControl;
@class UISlider;
@class UIGestureRecognizer;
@class UITextField;
@class UIPickerView;

SWIFT_CLASS("_TtC5Buddy17GeoViewController")
@interface GeoViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, weak) IBOutlet MKMapView * _Null_unspecified mapView;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, strong) CLLocation * _Nonnull location;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, weak) IBOutlet UISlider * _Null_unspecified slider;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified sliderValue;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified knn;
@property (nonatomic, weak) IBOutlet UIPickerView * _Null_unspecified picker;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull pickerData;
@property (nonatomic, copy) NSString * _Nonnull selectedPickerData;
@property (nonatomic, copy) NSArray<MKPointAnnotation *> * _Nonnull annotations;
@property (nonatomic, strong) MKPolygon * _Nullable polygon;
@property (nonatomic) NSInteger radius;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull prefsName;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)drawCircleWithLocation:(CLLocation * _Nonnull)location radius:(NSInteger)radius;
- (void)addRadiusCircleWithLocation:(CLLocation * _Nonnull)location radius:(double)radius;
- (MKOverlayRenderer * _Nonnull)mapView:(MKMapView * _Nonnull)mapView rendererForOverlay:(id <MKOverlay> _Nonnull)overlay;
- (MKAnnotationView * _Nullable)mapView:(MKMapView * _Nonnull)mapView viewForAnnotation:(id <MKAnnotation> _Nonnull)annotation;
- (void)mapView:(MKMapView * _Nonnull)mapView annotationView:(MKAnnotationView * _Nonnull)view calloutAccessoryControlTapped:(UIControl * _Nonnull)control;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (IBAction)sliderMoved:(UISlider * _Nonnull)sender;
- (void)addLongPressGesture;
- (void)handleLongPressWithGestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer;
- (void)mapView:(MKMapView * _Nonnull)mapView annotationView:(MKAnnotationView * _Nonnull)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState;
- (void)updateOverlay;
- (NSArray<NSValue *> * _Nonnull)sortConvexWithInput:(NSArray<NSValue *> * _Nonnull)input;
- (IBAction)knnChanged:(UITextField * _Nonnull)sender;
- (void)plotKnnWithLocation:(CLLocation * _Nonnull)location k:(NSInteger)k;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class HKHealthStore;
@class HKQuantityType;

SWIFT_CLASS("_TtC5Buddy27GeoWithHealthViewController")
@interface GeoWithHealthViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified healthData;
@property (nonatomic, readonly, strong) HKHealthStore * _Nonnull healthStore;
@property (nonatomic, readonly, strong) HKQuantityType * _Nullable activeEnergyBurnedType;
@property (nonatomic, weak) IBOutlet MKMapView * _Null_unspecified mapView;
@property (nonatomic, readonly, strong) CLLocationManager * _Nonnull locationManager;
@property (nonatomic, strong) CLLocation * _Nonnull location;
@property (nonatomic, weak) IBOutlet UISlider * _Null_unspecified slider;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified sliderValue;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified knn;
@property (nonatomic, weak) IBOutlet UIPickerView * _Null_unspecified picker;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull pickerData;
@property (nonatomic, copy) NSString * _Nonnull selectedPickerData;
@property (nonatomic, copy) NSArray<MKPointAnnotation *> * _Nonnull annotations;
@property (nonatomic, strong) MKPolygon * _Nullable polygon;
@property (nonatomic) NSInteger radius;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull prefsName;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)drawCircleWithLocation:(CLLocation * _Nonnull)location radius:(NSInteger)radius;
- (void)addRadiusCircleWithLocation:(CLLocation * _Nonnull)location radius:(double)radius;
- (MKOverlayRenderer * _Nonnull)mapView:(MKMapView * _Nonnull)mapView rendererForOverlay:(id <MKOverlay> _Nonnull)overlay;
- (MKAnnotationView * _Nullable)mapView:(MKMapView * _Nonnull)mapView viewForAnnotation:(id <MKAnnotation> _Nonnull)annotation;
- (void)mapView:(MKMapView * _Nonnull)mapView annotationView:(MKAnnotationView * _Nonnull)view calloutAccessoryControlTapped:(UIControl * _Nonnull)control;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (IBAction)sliderMoved:(UISlider * _Nonnull)sender;
- (void)addLongPressGesture;
- (void)handleLongPressWithGestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer;
- (void)mapView:(MKMapView * _Nonnull)mapView annotationView:(MKAnnotationView * _Nonnull)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState;
- (void)updateOverlay;
- (NSArray<NSValue *> * _Nonnull)sortConvexWithInput:(NSArray<NSValue *> * _Nonnull)input;
- (IBAction)knnChanged:(UITextField * _Nonnull)sender;
- (void)plotKnnWithLocation:(CLLocation * _Nonnull)location k:(NSInteger)k;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy19LoginViewController")
@interface LoginViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified username;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified password;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)Submit:(id _Nonnull)sender;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy28PendingRequestsTableViewCell")
@interface PendingRequestsTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyEmail;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyRestaurant;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyCuisine;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified acceptInviteButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified declineInviteButton;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyId;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified buddyDate;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy34PendingRequestsTableViewController")
@interface PendingRequestsTableViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull prefsName;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyName;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyEmail;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyCuisine;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyRestaurant;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyDate;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull buddyId;
@property (nonatomic, copy) NSString * _Nonnull testDate;
@property (nonatomic, copy) NSString * _Nonnull testId;
@property (nonatomic, copy) NSString * _Nonnull testCuisine;
@property (nonatomic, copy) NSString * _Nonnull testRestaurant;
@property (nonatomic, copy) NSString * _Nonnull testBuddyName;
@property (nonatomic, copy) NSString * _Nonnull testBuddyEmail;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)getPendingRequestsWithUserEmail:(NSString * _Nonnull)userEmail;
- (IBAction)acceptInvite:(id _Nonnull)sender;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)buddyAccepted;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy22PriyankaViewController")
@interface PriyankaViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, copy) NSString * _Nonnull trytext;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImageView;

SWIFT_CLASS("_TtC5Buddy20ProfileTableViewCell")
@interface ProfileTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified key;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified value;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified img;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy21ProfileViewController")
@interface ProfileViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified menuButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified updateButton;
@property (nonatomic, copy) NSString * _Nonnull urll;
@property (nonatomic, readonly, strong) NSMutableDictionary * _Nonnull para;
@property (nonatomic, copy) NSString * _Nonnull prefsEmail;
@property (nonatomic, copy) NSString * _Nonnull fullName;
@property (nonatomic, copy) NSString * _Nonnull email;
@property (nonatomic, copy) NSString * _Nonnull gender;
@property (nonatomic, copy) NSString * _Nonnull height;
@property (nonatomic, copy) NSString * _Nonnull weight;
@property (nonatomic, copy) NSString * _Nonnull dailyGoal;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (IBAction)updateButtonClicked:(UIBarButtonItem * _Nonnull)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC5Buddy14ViewController")
@interface ViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
