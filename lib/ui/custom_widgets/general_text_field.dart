import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/text_field_manager.dart';

class GeneralTextField extends StatelessWidget {

  final TextFieldManager tfManager;
  final IconData? suffixIcon;
  final Function()? onSuffixIconPressed;
  final Function(String)? callback;
  final int maxLines;
  final double paddingHorizontal;
  final bool readOnly;
  final RxBool _withShadow=RxBool(false);
  final TextAlign textAlign;

  GeneralTextField.withBorder({Key? key,required this.tfManager, this.callback, this.onSuffixIconPressed, this.suffixIcon, this.maxLines=1, this.paddingHorizontal=0, this.readOnly=false,this.textAlign = TextAlign.start}) : super(key: key);

  GeneralTextField.withShadow({Key? key,required this.tfManager, this.callback, this.onSuffixIconPressed, this.suffixIcon, this.maxLines=1, this.paddingHorizontal=4, this.readOnly=false,this.textAlign = TextAlign.start}) : super(key: key) {
    // _withShadow.value=true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: kFieldVerticalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text: TextSpan(text: tfManager.fieldName,
            style: const TextStyle(color: kTextColor, fontSize: 12, fontWeight: FontWeight.w400),
            children: tfManager.mandatory ? [
              const TextSpan(text: '*', style: TextStyle(color: kRejectedColor, fontWeight: FontWeight.bold))
            ] : null,
          ),),
          // Text(tfManager.fieldName, style: const TextStyle(color: kBlackColor, fontSize: 14),),
          Obx(()=> Container(
            width: Get.width,
            margin: const EdgeInsets.only(top: 4),
            padding: EdgeInsets.only(left: _withShadow.isFalse ? 12 : 8, right: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_withShadow.isTrue ? 4 : kFieldRadius),
                  border: _withShadow.isTrue ? null : Border.all(color: /*tfManager.errorMessage.isNotEmpty ? kRequiredRedColor : */kFieldBorderColor ),
                  color: readOnly ? kFieldBGColor : _withShadow.isTrue ? kWhiteColor : kWhiteColor,
                  boxShadow: _withShadow.isTrue ? [
                    const BoxShadow(blurRadius: 3,spreadRadius: 1, color: kFieldShadowColor)
                  ] : null

              ),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom + 40),
                          keyboardType: tfManager.keyboardType,
                          maxLines: maxLines,
                          minLines: maxLines>2 ? 3 : null,
                          readOnly: readOnly,
                          maxLength: tfManager.length,
                          controller: tfManager.controller,
                          focusNode: tfManager.focusNode,
                          textCapitalization: tfManager.textCapitalization,
                          textAlign: textAlign,
                          onChanged: (value) {
                            tfManager.validate();
                            if(value.isEmpty && tfManager.errorMessage.isEmpty){
                              callback?.call(value);
                            }
                          },
                          textInputAction: maxLines == 1 ? TextInputAction.done : TextInputAction.newline,
                          inputFormatters: tfManager.formatters,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: tfManager.hint??tfManager.fieldName,
                            // contentPadding: const EdgeInsets.all(0),
                            border: InputBorder.none,
                            hintStyle: const TextStyle(color: kTextHintColor),
                          ),
                          style: TextStyle(
                              color: readOnly ? kTextHintColor : kTextColor,
                              decorationColor: kPrimaryColor
                          ),
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: maxLines == 1 ? 11: 6),
                      child: suffixIcon!=null && tfManager.errorMessage.isEmpty
                          ? GestureDetector(onTap: onSuffixIconPressed, child: Icon(suffixIcon, color:readOnly ? kTextHintColor: kPrimaryColor))
                          // : tfManager.errorMessage.isNotEmpty && _withShadow.isFalse
                          // ? const Icon(Icons.info, color: kRequiredRedColor)
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Visibility(
            visible: tfManager.errorMessage.value.isNotEmpty,
            child: Text(tfManager.errorMessage.value, style: const TextStyle(color: kRejectedColor, fontSize: 12),),
          )),
        ],
      ),
    );
  }
}
