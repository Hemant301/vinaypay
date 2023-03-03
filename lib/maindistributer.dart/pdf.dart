// import 'dart:io';
// import 'dart:isolate';
// import 'dart:ui';

// import 'package:android_path_provider/android_path_provider.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MypDF extends StatefulWidget with WidgetsBindingObserver {
//   const MypDF({super.key, required this.title, required this.platform});

//   final TargetPlatform? platform;

//   final String title;

//   @override
//   _MypDFState createState() => _MypDFState();
// }

// class _MypDFState extends State<MypDF> {
//   List<TaskInfo>? _tasks;
//   late List<ItemHolder> _items;
//   late bool _showContent;
//   late bool _permissionReady;
//   late bool _saveInPublicStorage;
//   late String _localPath;
//   final ReceivePort _port = ReceivePort();

//   @override
//   void initState() {
//     super.initState();

//     _bindBackgroundIsolate();

//     FlutterDownloader.registerCallback(downloadCallback, step: 1);

//     _showContent = false;
//     _permissionReady = false;
//     _saveInPublicStorage = false;

//     _prepare();
//   }

//   @override
//   void dispose() {
//     _unbindBackgroundIsolate();
//     super.dispose();
//   }

//   void _bindBackgroundIsolate() {
//     final isSuccess = IsolateNameServer.registerPortWithName(
//       _port.sendPort,
//       'downloader_send_port',
//     );
//     if (!isSuccess) {
//       _unbindBackgroundIsolate();
//       _bindBackgroundIsolate();
//       return;
//     }
//     _port.listen((dynamic data) {
//       final taskId = (data as List<dynamic>)[0] as String;
//       final status = data[1] as DownloadTaskStatus;
//       final progress = data[2] as int;

//       print(
//         'Callback on UI isolate: '
//         'task ($taskId) is in status ($status) and process ($progress)',
//       );

//       if (_tasks != null && _tasks!.isNotEmpty) {
//         final task = _tasks!.firstWhere((task) => task.taskId == taskId);
//         setState(() {
//           task
//             ..status = status
//             ..progress = progress;
//         });
//       }
//     });
//   }

//   void _unbindBackgroundIsolate() {
//     IsolateNameServer.removePortNameMapping('downloader_send_port');
//   }

//   @pragma('vm:entry-point')
//   static void downloadCallback(
//     String id,
//     DownloadTaskStatus status,
//     int progress,
//   ) {
//     print(
//       'Callback on background isolate: '
//       'task ($id) is in status ($status) and process ($progress)',
//     );

//     IsolateNameServer.lookupPortByName('downloader_send_port')
//         ?.send([id, status, progress]);
//   }

//   Widget _buildDownloadList() {
//     return ListView(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       children: [
//         Row(
//           children: [
//             Checkbox(
//               value: _saveInPublicStorage,
//               onChanged: (newValue) {
//                 setState(() => _saveInPublicStorage = newValue ?? false);
//               },
//             ),
//             const Text('Save in public storage'),
//           ],
//         ),
//         ..._items.map(
//           (item) {
//             final task = item.task;
//             if (task == null) {
//               return Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Text(
//                   item.name!,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                     fontSize: 18,
//                   ),
//                 ),
//               );
//             }

//             return DownloadListItem(
//               data: item,
//               onTap: (task) async {
//                 final success = await _openDownloadedFile(task);
//                 if (!success) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Cannot open this file'),
//                     ),
//                   );
//                 }
//               },
//               onActionTap: (task) {
//                 if (task.status == DownloadTaskStatus.undefined) {
//                   _requestDownload(task);
//                 } else if (task.status == DownloadTaskStatus.running) {
//                   _pauseDownload(task);
//                 } else if (task.status == DownloadTaskStatus.paused) {
//                   _resumeDownload(task);
//                 } else if (task.status == DownloadTaskStatus.complete ||
//                     task.status == DownloadTaskStatus.canceled) {
//                   _delete(task);
//                 } else if (task.status == DownloadTaskStatus.failed) {
//                   _retryDownload(task);
//                 }
//               },
//               onCancel: _delete,
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildNoPermissionWarning() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Text(
//               'Grant storage permission to continue',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.blueGrey, fontSize: 18),
//             ),
//           ),
//           const SizedBox(height: 32),
//           TextButton(
//             onPressed: _retryRequestPermission,
//             child: const Text(
//               'Retry',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _retryRequestPermission() async {
//     final hasGranted = await _checkPermission();

//     if (hasGranted) {
//       await _prepareSaveDir();
//     }

//     setState(() {
//       _permissionReady = hasGranted;
//     });
//   }

//   Future<void> _requestDownload(TaskInfo task) async {
//     task.taskId = await FlutterDownloader.enqueue(
//       url: task.link!,
//       headers: {'auth': 'test_for_sql_encoding'},
//       savedDir: _localPath,
//       saveInPublicStorage: _saveInPublicStorage,
//     );
//   }

//   Future<void> _pauseDownload(TaskInfo task) async {
//     await FlutterDownloader.pause(taskId: task.taskId!);
//   }

//   Future<void> _resumeDownload(TaskInfo task) async {
//     final newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
//     task.taskId = newTaskId;
//   }

//   Future<void> _retryDownload(TaskInfo task) async {
//     final newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
//     task.taskId = newTaskId;
//   }

//   Future<bool> _openDownloadedFile(TaskInfo? task) async {
//     final taskId = task?.taskId;
//     if (taskId == null) {
//       return false;
//     }

//     return FlutterDownloader.open(taskId: taskId);
//   }

//   Future<void> _delete(TaskInfo task) async {
//     await FlutterDownloader.remove(
//       taskId: task.taskId!,
//       shouldDeleteContent: true,
//     );
//     await _prepare();
//     setState(() {});
//   }

//   Future<bool> _checkPermission() async {
//     if (Platform.isIOS) {
//       return true;
//     }

//     if (Platform.isAndroid) {
//       final info = await DeviceInfoPlugin().androidInfo;
//       if (info.version.sdkInt > 28) {
//         return true;
//       }

//       final status = await Permission.storage.status;
//       if (status == PermissionStatus.granted) {
//         return true;
//       }

//       final result = await Permission.storage.request();
//       return result == PermissionStatus.granted;
//     }

//     throw StateError('unknown platform');
//   }

//   Future<void> _prepare() async {
//     final tasks = await FlutterDownloader.loadTasks();

//     if (tasks == null) {
//       print('No tasks were retrieved from the database.');
//       return;
//     }

//     var count = 0;
//     _tasks = [];
//     _items = [];

//     _tasks!.addAll(
//       DownloadItems.documents.map(
//         (document) => TaskInfo(name: document.name, link: document.url),
//       ),
//     );

//     _items.add(ItemHolder(name: 'Documents'));
//     for (var i = count; i < _tasks!.length; i++) {
//       _items.add(ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     _tasks!.addAll(
//       DownloadItems.images
//           .map((image) => TaskInfo(name: image.name, link: image.url)),
//     );

//     _items.add(ItemHolder(name: 'Images'));
//     for (var i = count; i < _tasks!.length; i++) {
//       _items.add(ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     _tasks!.addAll(
//       DownloadItems.videos
//           .map((video) => TaskInfo(name: video.name, link: video.url)),
//     );

//     _items.add(ItemHolder(name: 'Videos'));
//     for (var i = count; i < _tasks!.length; i++) {
//       _items.add(ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     _tasks!.addAll(
//       DownloadItems.apks
//           .map((video) => TaskInfo(name: video.name, link: video.url)),
//     );

//     _items.add(ItemHolder(name: 'APKs'));
//     for (var i = count; i < _tasks!.length; i++) {
//       _items.add(ItemHolder(name: _tasks![i].name, task: _tasks![i]));
//       count++;
//     }

//     for (final task in tasks) {
//       for (final info in _tasks!) {
//         if (info.link == task.url) {
//           info
//             ..taskId = task.taskId
//             ..status = task.status
//             ..progress = task.progress;
//         }
//       }
//     }

//     _permissionReady = await _checkPermission();
//     if (_permissionReady) {
//       await _prepareSaveDir();
//     }

//     setState(() {
//       _showContent = true;
//     });
//   }

//   Future<void> _prepareSaveDir() async {
//     _localPath = (await _getSavedDir())!;
//     final savedDir = Directory(_localPath);
//     if (!savedDir.existsSync()) {
//       await savedDir.create();
//     }
//   }

//   Future<String?> _getSavedDir() async {
//     String? externalStorageDirPath;

//     if (Platform.isAndroid) {
//       try {
//         externalStorageDirPath = await AndroidPathProvider.downloadsPath;
//       } catch (err, st) {
//         print('failed to get downloads path: $err, $st');

//         final directory = await getExternalStorageDirectory();
//         externalStorageDirPath = directory?.path;
//       }
//     } else if (Platform.isIOS) {
//       externalStorageDirPath =
//           (await getApplicationDocumentsDirectory()).absolute.path;
//     }
//     return externalStorageDirPath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           if (Platform.isIOS)
//             PopupMenuButton<Function>(
//               icon: const Icon(Icons.more_vert, color: Colors.white),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                   onTap: () => exit(0),
//                   child: const ListTile(
//                     title: Text(
//                       'Simulate App Backgrounded',
//                       style: TextStyle(fontSize: 15),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//         ],
//       ),
//       body: Builder(
//         builder: (context) {
//           if (!_showContent) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return _permissionReady
//               ? _buildDownloadList()
//               : _buildNoPermissionWarning();
//         },
//       ),
//     );
//   }
// }

// class ItemHolder {
//   ItemHolder({this.name, this.task});

//   final String? name;
//   final TaskInfo? task;
// }

// class TaskInfo {
//   TaskInfo({this.name, this.link});

//   final String? name;
//   final String? link;

//   String? taskId;
//   int? progress = 0;
//   DownloadTaskStatus? status = DownloadTaskStatus.undefined;
// }

// class DownloadListItem extends StatelessWidget {
//   const DownloadListItem({
//     super.key,
//     this.data,
//     this.onTap,
//     this.onActionTap,
//     this.onCancel,
//   });

//   final ItemHolder? data;
//   final Function(TaskInfo?)? onTap;
//   final Function(TaskInfo)? onActionTap;
//   final Function(TaskInfo)? onCancel;

//   Widget? _buildTrailing(TaskInfo task) {
//     if (task.status == DownloadTaskStatus.undefined) {
//       return IconButton(
//         onPressed: () => onActionTap?.call(task),
//         constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//         icon: const Icon(Icons.file_download),
//         tooltip: 'Start',
//       );
//     } else if (task.status == DownloadTaskStatus.running) {
//       return Row(
//         children: [
//           Text('${task.progress}%'),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.pause, color: Colors.yellow),
//             tooltip: 'Pause',
//           ),
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.paused) {
//       return Row(
//         children: [
//           Text('${task.progress}%'),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.play_arrow, color: Colors.green),
//             tooltip: 'Resume',
//           ),
//           if (onCancel != null)
//             IconButton(
//               onPressed: () => onCancel?.call(task),
//               constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//               icon: const Icon(Icons.cancel, color: Colors.red),
//               tooltip: 'Cancel',
//             ),
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.complete) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text('Ready', style: TextStyle(color: Colors.green)),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.delete),
//             tooltip: 'Delete',
//           )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.canceled) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text('Canceled', style: TextStyle(color: Colors.red)),
//           if (onActionTap != null)
//             IconButton(
//               onPressed: () => onActionTap?.call(task),
//               constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//               icon: const Icon(Icons.cancel),
//               tooltip: 'Cancel',
//             )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.failed) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text('Failed', style: TextStyle(color: Colors.red)),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.refresh, color: Colors.green),
//             tooltip: 'Refresh',
//           )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.enqueued) {
//       return const Text('Pending', style: TextStyle(color: Colors.orange));
//     } else {
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: data!.task!.status == DownloadTaskStatus.complete
//           ? () {
//               onTap!(data!.task);
//             }
//           : null,
//       child: Container(
//         padding: const EdgeInsets.only(left: 16, right: 8),
//         child: InkWell(
//           child: Stack(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: 64,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         data!.name!,
//                         maxLines: 1,
//                         softWrap: true,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8),
//                       child: _buildTrailing(data!.task!),
//                     ),
//                   ],
//                 ),
//               ),
//               if (data!.task!.status == DownloadTaskStatus.running ||
//                   data!.task!.status == DownloadTaskStatus.paused)
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: 0,
//                   child: LinearProgressIndicator(
//                     value: data!.task!.progress! / 100,
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DownloadItems {
//   static const documents = [
//     DownloadItem(
//       name: 'Android Programming Cookbook',
//       url:
//           'http://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf',
//     ),
//     DownloadItem(
//       name: 'iOS Programming Guide',
//       url:
//           'http://englishonlineclub.com/pdf/iOS%20Programming%20-%20The%20Big%20Nerd%20Ranch%20Guide%20(6th%20Edition)%20[EnglishOnlineClub.com].pdf',
//     ),
//   ];

//   static const images = [
//     DownloadItem(
//       name: 'Arches National Park',
//       url:
//           'https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
//     ),
//     DownloadItem(
//       name: 'Canyonlands National Park',
//       url:
//           'https://upload.wikimedia.org/wikipedia/commons/7/78/Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg',
//     ),
//     DownloadItem(
//       name: 'Death Valley National Park',
//       url:
//           'https://upload.wikimedia.org/wikipedia/commons/b/b2/Sand_Dunes_in_Death_Valley_National_Park.jpg',
//     ),
//     DownloadItem(
//       name: 'Gates of the Arctic National Park and Preserve',
//       url:
//           'https://upload.wikimedia.org/wikipedia/commons/e/e4/GatesofArctic.jpg',
//     ),
//   ];

//   static const videos = [
//     DownloadItem(
//       name: 'Big Buck Bunny',
//       url:
//           'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//     ),
//     DownloadItem(
//       name: 'Elephant Dream',
//       url:
//           'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
//     ),
//   ];

//   static const apks = [
//     DownloadItem(
//       name: 'Spitfire',
//       url:
//           'https://github.com/bartekpacia/spitfire/releases/download/v1.2.0/spitfire.apk',
//     )
//   ];
// }

// class DownloadItem {
//   const DownloadItem({required this.name, required this.url});

//   final String name;
//   final String url;
// }
