import 'package:excise_e_auction/utils/text_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excise_e_auction/utils/app_colors.dart';
import 'package:excise_e_auction/utils/constants.dart';
import 'package:excise_e_auction/utils/text_field_manager.dart';

class GeneralTextField extends StatelessWidget {

  final TextFieldManager tfManager;
  final IconData? prefixIcon;
  final Function(String)? callback;
  final int maxLines;
  final double paddingHorizontal;
  final bool readOnly;
  final TextAlign textAlign;
  final RxBool _obscure = false.obs;

  GeneralTextField.withBorder({Key? key,required this.tfManager, this.callback, this.prefixIcon, this.maxLines=1, this.paddingHorizontal=0, this.readOnly=false,this.textAlign = TextAlign.start}) : super(key: key);

  GeneralTextField.withShadow({Key? key,required this.tfManager, this.callback, this.prefixIcon, this.maxLines=1, this.paddingHorizontal=4, this.readOnly=false,this.textAlign = TextAlign.start}) : super(key: key) {
    // _withShadow.value=true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: kFieldVerticalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(tfManager.fieldName.isNotEmpty)
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
            padding: const EdgeInsets.only(left: 8, right: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kFieldRadius),
                  border: Border.all(color: kFieldBorderColor),
                  color: kFieldBGColor,
              ),
              child: SizedBox(
                width: Get.width,
                height: 54,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom + 120),
                          keyboardType: tfManager.keyboardType,
                          maxLines: maxLines,
                          minLines: maxLines>2 ? 3 : null,
                          readOnly: readOnly,
                          maxLength: tfManager.length,
                          controller: tfManager.controller,
                          focusNode: tfManager.focusNode,
                          textCapitalization: tfManager.textCapitalization,
                          textAlign: textAlign,
                          obscureText: _obscure.value,
                          onChanged: (value) {
                            tfManager.validate();
                            if(value.isEmpty && tfManager.errorMessage.isEmpty){
                              callback?.call(value);
                            }
                          },
                        cursorColor: kPrimaryColor,
                          textInputAction: maxLines == 1 ? TextInputAction.done : TextInputAction.newline,
                          inputFormatters: tfManager.formatters,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: "Enter ${tfManager.hint??tfManager.fieldName}",
                            contentPadding: const EdgeInsets.all(16),
                            border: InputBorder.none,
                            prefixIcon: prefixIcon!=null ? Icon(prefixIcon, color: kTextHintColor,size: 32) : null,
                            hintStyle: const TextStyle(color: kTextHintColor),
                            suffixIcon: tfManager.filter != TextFilter.password ? null :
                            GestureDetector(
                                onTap: ()=>_obscure.toggle(),
                                child: Icon(
                                  _obscure.isTrue ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                                  color: kTextHintColor,
                                  // size: 24,
                                )
                            ),
                          ),
                          style: TextStyle(
                              color: readOnly ? kTextHintColor : kTextColor,
                              decorationColor: kPrimaryColor,
                          ),
                        ),
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
