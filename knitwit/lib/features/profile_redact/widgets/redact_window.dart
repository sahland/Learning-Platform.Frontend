import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/bloc.dart';

class RedactWindow extends StatefulWidget {
  const RedactWindow({
    super.key,
    this.username,
    this.userId,
    required this.imageUrl
  });

  final String? username;
  final String? userId;
  final String imageUrl;

  @override
  State<RedactWindow> createState() => _RedactWindowState();
}

class _RedactWindowState extends State<RedactWindow> {
  final TextEditingController _newNickname = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _newEmail = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      BlocProvider.of<ProfileRedactBloc>(context).add(ChangeAvatarEvent(File(pickedFile.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 63,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.username ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buttonRedactProfile(
            'Смена аватара', 
            Colors.white, 
            '', 
            _pickImage, 
            null, 
            false, 
            null,
          ),
          _buttonRedactProfile(
            'Смена имени пользователя',
            Colors.white,
            'Введите новое имя пользователя',
            () => _showBottomSheet('Введите новое имя пользователя', _newNickname, (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<ProfileRedactBloc>(context).add(ChangeNicknameEvent(newNickname: value));
              } else {
                _showErrorSnackBar('Имя пользователя не может быть пустым');
              }
            }),
            _newNickname,
            true,
            (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<ProfileRedactBloc>(context).add(ChangeNicknameEvent(newNickname: value));
              } else {
                _showErrorSnackBar('Имя пользователя не может быть пустым');
              }
            },
          ),
          _buttonRedactProfile(
            'Смена почты',
            Colors.white,
            'Введите новую почту',
            () => _showBottomSheet('Введите новую почту', _newEmail, (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<ProfileRedactBloc>(context).add(ChangeEmailEvent(newEmail: value));
              } else {
                _showErrorSnackBar('Почта не может быть пустой');
              }
            }),
            _newEmail,
            true,
            (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<ProfileRedactBloc>(context).add(ChangeEmailEvent(newEmail: value));
              } else {
                _showErrorSnackBar('Почта не может быть пустой');
              }
            },
          ),
          _buttonRedactProfile(
            'Сброс пароля',
            Colors.white,
            'Введите новый пароль',
            () => _showBottomSheet('Введите новый пароль', _newPassword, (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<ProfileRedactBloc>(context).add(ResetPasswordEvent(newPassword: value));
              } else {
                _showErrorSnackBar('Пароль не может быть пустым');
              }
            }),
            _newPassword,
            true,
            (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<ProfileRedactBloc>(context).add(ResetPasswordEvent(newPassword: value));
              } else {
                _showErrorSnackBar('Пароль не может быть пустым');
              }
            },
          ),
          _buttonRedactProfile(
            'Удалить аккаунт', 
            const Color(0xFFBE1257), 
            '', 
            _showDeleteAccountConfirmation, 
            null, 
            false, 
            null,
          ),
        ],
      ),
    );
  }

  ElevatedButton _buttonRedactProfile(
      String buttonName,
      Color color,
      String hintText,
      Function() onPressed,
      TextEditingController? controller,
      bool shouldShowBottomSheet,
      Function(String)? onSave,
      ) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {
          if (shouldShowBottomSheet) {
            _showBottomSheet(hintText, controller, onSave);
          } else {
            onPressed();
          }
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              buttonName,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );

  void _showBottomSheet(String hintText, TextEditingController? controller, Function(String)? onSave) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF1C202A),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Введите данные',
                    style: TextStyle(
                      color: Color(0xFFA3ABC3),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.white54),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (onSave != null && controller != null) {
                      onSave(controller.text);
                    }
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFBE1257), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Сохранить',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteAccountConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Удаление аккаунта',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBE1257),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          content: const Text(
              'Администрация рассмотрит вашу заявку на удаление аккаунта.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          backgroundColor: Color(0xFFF1C202A),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFBE1257),
      ),
    );
  }
}