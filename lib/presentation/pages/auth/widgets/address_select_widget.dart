import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vdiary_internship/core/constants/fontsize/font_size_app.dart';
import 'package:vdiary_internship/presentation/pages/auth/controller/auth_controller.dart';
import 'package:vdiary_internship/presentation/themes/theme/app-color/app_color.dart';
import 'package:vdiary_internship/presentation/themes/theme/app_theme.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_responsive_size.dart';
import 'package:vdiary_internship/presentation/themes/theme/responsive/app_space_size.dart';

class AddressSelectFormWidget extends StatefulWidget {
  const AddressSelectFormWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.authController,
  });

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final AuthController authController;

  @override
  State<AddressSelectFormWidget> createState() =>
      _AddressSelectFormWidgetState();
}

class _AddressSelectFormWidgetState extends State<AddressSelectFormWidget> {
  String? _selectedValue;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.authController.loadVietNamProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        try {
          
          if (widget.authController.listProvinces == null ||
              widget.authController.listProvinces!.isEmpty) {
            return _buildTextNone(context);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select location',
                    style: TextStyle(
                      fontSize: FontSizeApp.fontSizeSubMedium,
                      fontWeight: FontWeight.w400,
                      color: AppColor.LightBlue,
                    ),
                  ),
                  items:
                      widget.authController.listProvinces!
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item.name,
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: FontSizeApp.fontSizeSubMedium,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ).toList(),
                  value: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: AppColor.LightBlue),
                    ),
                  ),
                  dropdownStyleData: const DropdownStyleData(maxHeight: 350),
                  menuItemStyleData: const MenuItemStyleData(height: 40),
                  dropdownSearchData: DropdownSearchData(
                    searchController: _searchController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 70,
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: _searchController,
                        decoration: _buildInputDecoration(),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value.toString().contains(searchValue);
                    },
                  ),
                  // Xóa giá trị search sau khi đóng dropdown
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      _searchController.clear();
                    }
                  },
                ),
              ),
            ],
          );
        } catch (e) {
          return _buildTextError(e.toString(), context);
        }
      },
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintText: 'Search for an item...',
      hintStyle: const TextStyle(fontSize: FontSizeApp.fontSizeSubMedium),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

Widget _buildTextError(String error, BuildContext context) {
  return Container(
    height: ResponsiveSizeApp(context).heightPercent(50),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.ErrorRed),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text('Lỗi: $error', style: context.textTheme.bodyMedium),
    ),
  );
}

Widget _buildTextNone(BuildContext context) {
  return Container(
    height: ResponsiveSizeApp(context).heightPercent(50),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.LightBlue),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Không có dữ liệu tỉnh thành',
            style: context.textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}