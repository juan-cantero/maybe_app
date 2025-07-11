# Maybe App - Flutter Learning Repository

## 🎯 Purpose

This repository serves as a **comprehensive Flutter learning reference** and documents my journey through advanced Flutter development concepts. It contains a practical implementation of a chat application that demonstrates state management, HTTP requests, custom widgets, and modern Flutter architecture patterns. The app is designed for educational purposes to help understand how different Flutter components work together in a real-world scenario.

## 📚 Learning Objectives

This project covers intermediate to advanced Flutter concepts through hands-on implementation, making it perfect for developers looking to understand Flutter's ecosystem, state management patterns, API integration, and modern app architecture.

## 🔧 Flutter Knowledge Practiced

### 1. **State Management with Provider**
Understanding how to manage application state using the Provider pattern for scalable Flutter applications.

```dart
class ChatProvider extends ChangeNotifier {
  List<Message> messages = [];
  
  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    notifyListeners(); // Notify UI to rebuild
  }
}
```

**Key Concepts:**
- **ChangeNotifier**: Base class for objects that provide change notifications
- **Provider.of(context)**: Accessing state from widgets
- **context.watch()**: Listening to state changes and rebuilding UI
- **notifyListeners()**: Triggering UI updates when state changes

### 2. **HTTP Requests and API Integration**
Making network requests to external APIs and handling responses properly.

```dart
Future<String> _fetchGifUrl(String query) async {
  final url = Uri.https('api.giphy.com', '/v1/gifs/search', {
    'api_key': _giphyApiKey,
    'q': query,
    'limit': '10',
    'rating': 'g',
  });
  
  final response = await http.get(url);
  
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['url'];
  } else {
    throw Exception('Failed to load data');
  }
}
```

**Key Concepts:**
- **http package**: Making HTTP requests in Flutter
- **Uri.https()**: Constructing URLs with query parameters
- **async/await**: Handling asynchronous operations
- **jsonDecode()**: Parsing JSON responses
- **Error handling**: Managing network failures and exceptions

### 3. **Factory Constructors and JSON Parsing**
Creating objects from JSON data using factory constructors for type-safe data modeling.

```dart
class GiphyResponse {
  final List<GifData> data;
  
  GiphyResponse({required this.data});
  
  factory GiphyResponse.fromJson(Map<String, dynamic> json) {
    return GiphyResponse(
      data: (json['data'] as List)
          .map((gifJson) => GifData.fromJson(gifJson))
          .toList(),
    );
  }
}
```

**Key Concepts:**
- **Factory constructors**: Creating instances with custom logic
- **JSON mapping**: Converting JSON to Dart objects
- **Type safety**: Ensuring correct data types during parsing
- **Model classes**: Structured data representation

### 4. **Environment Variables and Security**
Managing sensitive data like API keys using environment variables.

```dart
// .env file
GIPHY_API_KEY=your_api_key_here

// In Dart code
static String get _giphyApiKey => dotenv.env['GIPHY_API_KEY'] ?? '';
```

**Key Concepts:**
- **flutter_dotenv**: Loading environment variables
- **API key security**: Protecting sensitive credentials
- **Platform considerations**: Understanding web vs mobile security
- **Configuration management**: Separating config from code

### 5. **Callback Functions and Event Handling**
Passing functions as parameters to enable communication between widgets.

```dart
class MessagedFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue; // Callback function
  
  const MessagedFieldBox({required this.onValue});
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        onValue(value); // Calling the callback
      },
    );
  }
}
```

**Key Concepts:**
- **ValueChanged<T>**: Typedef for callback functions
- **Function parameters**: Passing behavior between widgets
- **Event delegation**: Parent widgets handling child events
- **Decoupling**: Separating widget logic from business logic

### 6. **Scroll Controllers and List Management**
Controlling scrollable widgets programmatically for better UX.

```dart
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  
  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
```

**Key Concepts:**
- **ScrollController**: Programmatic scroll control
- **ListView.builder**: Efficient list rendering
- **Animation curves**: Smooth scrolling transitions
- **Position management**: Tracking scroll position

### 7. **Custom Widget Architecture**
Creating reusable, composable widgets with proper separation of concerns.

```dart
class HerMessageBubble extends StatelessWidget {
  final Message message;
  
  const HerMessageBubble({required this.message});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextBubble(),
        if (message.imageUrl != null) _buildImageBubble(),
      ],
    );
  }
}
```

**Key Concepts:**
- **Widget composition**: Building complex UI from simple widgets
- **Conditional rendering**: Showing widgets based on data
- **Private methods**: Organizing widget building logic
- **Parameterized widgets**: Making widgets flexible and reusable

### 8. **Form Handling and Input Management**
Managing user input with proper validation and state control.

```dart
class MessagedFieldBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
```

**Key Concepts:**
- **TextEditingController**: Managing text input state
- **FocusNode**: Controlling keyboard focus
- **Form validation**: Ensuring data integrity
- **User experience**: Smooth input interactions

### 9. **Error Handling and Loading States**
Providing user feedback during async operations and handling failures gracefully.

```dart
Image.network(
  imageUrl,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return CircularProgressIndicator();
  },
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error);
  },
)
```

**Key Concepts:**
- **Loading states**: Showing progress indicators
- **Error boundaries**: Graceful error handling
- **User feedback**: Informing users of app state
- **Fallback UI**: Alternative content when things fail

### 10. **Dart Language Features**
Leveraging Dart's powerful language features for clean, maintainable code.

```dart
// Enums for type safety
enum FromWho { me, hers }

// Extension methods
extension StringExtensions on String {
  bool get isQuestion => endsWith('?');
}

// Null safety
String? get imageUrl => message.imageUrl;
```

**Key Concepts:**
- **Enums**: Type-safe constants
- **Extension methods**: Adding functionality to existing types
- **Null safety**: Preventing null reference errors
- **Getters**: Computed properties

## 🧱 Widgets Implemented

### **Layout & Structure Widgets**

#### **Scaffold**
- Provides basic Material Design layout structure
- Contains AppBar, body, and other structural elements
- **Documentation**: [Scaffold - Flutter](https://docs.flutter.dev/ui/layout/scaffold)

#### **Column**
- Arranges child widgets vertically
- Uses `crossAxisAlignment` for precise alignment
- **Documentation**: [Column - Flutter](https://docs.flutter.dev/ui/layout/flex)

#### **SafeArea**
- Ensures content doesn't overlap with system UI (notches, status bars)
- Essential for modern device compatibility
- **Documentation**: [SafeArea - Flutter](https://docs.flutter.dev/ui/layout/safe-area)

#### **Expanded**
- Makes child widgets take up remaining available space
- Crucial for responsive layouts
- **Documentation**: [Expanded - Flutter](https://docs.flutter.dev/ui/layout/flex)

#### **Padding**
- Adds spacing around widgets
- Uses `EdgeInsets` for consistent spacing patterns
- **Documentation**: [Padding - Flutter](https://docs.flutter.dev/ui/layout/padding)

#### **SizedBox**
- Creates fixed-size spacing between widgets
- Used for both width and height spacing
- **Documentation**: [SizedBox - Flutter](https://docs.flutter.dev/ui/layout/box-constraints)

### **Interactive Widgets**

#### **TextFormField**
- Advanced text input with validation capabilities
- Customizable appearance and behavior
- **Documentation**: [TextFormField - Flutter](https://docs.flutter.dev/ui/text-input/text-form-field)

#### **IconButton**
- Clickable icon widgets for actions
- Provides visual feedback and touch targets
- **Documentation**: [IconButton - Flutter](https://docs.flutter.dev/ui/widgets/material/icon-button)

### **Visual & Styling Widgets**

#### **Container**
- Versatile widget for styling and layout
- Combines decoration, padding, and constraints
- **Documentation**: [Container - Flutter](https://docs.flutter.dev/ui/layout/container)

#### **CircleAvatar**
- Circular widget perfect for user profile images
- Supports both local and network images
- **Documentation**: [CircleAvatar - Flutter](https://docs.flutter.dev/ui/widgets/material/circle-avatar)

#### **ClipRRect**
- Clips child widgets with rounded corners
- Essential for consistent visual styling
- **Documentation**: [ClipRRect - Flutter](https://docs.flutter.dev/ui/widgets/clip)

### **List & Data Display**

#### **ListView.builder**
- Efficiently renders scrollable lists
- Uses lazy loading for performance optimization
- **Documentation**: [ListView - Flutter](https://docs.flutter.dev/ui/layout/list)

#### **Image.network**
- Displays images from internet URLs
- Includes loading states and error handling
- **Documentation**: [Image - Flutter](https://docs.flutter.dev/ui/widgets/image)

### **Custom Widgets Created**

#### **HerMessageBubble**
- Custom widget for displaying received messages
- Includes both text and image display capabilities
- Left-aligned with secondary theme colors

#### **MyMessageBubble** 
- Custom widget for sent messages
- Right-aligned with primary theme colors
- Simpler structure focused on text display

#### **MessagedFieldBox**
- Custom input field component
- Combines text field, send button, and styling
- Handles text submission and clearing

## 📦 Packages Used

### **Core Dependencies**
- **provider**: `^6.1.5` - State management solution
- **http**: `^1.4.0` - HTTP client for API requests
- **flutter_dotenv**: `^5.1.0` - Environment variable management

### **Development Dependencies**
- **flutter_test**: Testing framework
- **flutter_lints**: Code analysis and linting rules

## 📁 Project Architecture

```
lib/
├── config/
│   ├── helpers/
│   │   └── get_yes_no_answer.dart    # API service layer
│   └── theme/
│       └── app_theme.dart            # Theme configuration
├── domain/
│   ├── entities/
│   │   └── message.dart              # Core business entities
│   └── infrastructure/
│       └── models/
│           └── giphy_response.dart   # API response models
├── presentation/
│   ├── providers/
│   │   └── chat_provider.dart        # State management
│   ├── screens/
│   │   └── chat/
│   │       └── chat_screen.dart      # Main chat interface
│   └── widgets/
│       ├── chat/
│       │   ├── her_message_bubble.dart    # Received messages
│       │   └── my_message_bubble.dart     # Sent messages
│       └── shared/
│           └── messaged_field_box.dart    # Input field component
└── main.dart                         # App entry point
```

## 🚀 Key Learning Takeaways

1. **State Management**: Understanding Provider pattern for scalable app state
2. **API Integration**: Making HTTP requests and handling responses
3. **Data Modeling**: Creating type-safe models with factory constructors
4. **Security**: Managing sensitive data with environment variables
5. **Widget Architecture**: Building reusable, composable custom widgets
6. **User Experience**: Implementing smooth interactions and feedback
7. **Error Handling**: Graceful failure management and user communication
8. **Performance**: Efficient list rendering and image loading
9. **Code Organization**: Structuring Flutter projects for maintainability
10. **Modern Flutter**: Using latest patterns and best practices

## 🔗 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [HTTP Package](https://pub.dev/packages/http)
- [Flutter Environment Variables](https://pub.dev/packages/flutter_dotenv)
- [Material Design Guidelines](https://material.io/design)
- [Dart Language Guide](https://dart.dev/guides/language)

## 📖 How to Use This Repository

1. **Study the Code**: Examine how different concepts are implemented
2. **Run the App**: Test the functionality on different platforms
3. **Experiment**: Modify state management, API calls, and UI components
4. **Reference**: Use as a starting point for similar projects
5. **Learn**: Understand the relationship between widgets, state, and data

This repository serves as a practical reference for intermediate Flutter development, demonstrating real-world implementation of state management, API integration, and modern Flutter architecture patterns in a functional chat application.