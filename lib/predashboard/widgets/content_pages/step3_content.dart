import 'package:flutter/material.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_dropdown_field.dart';
import 'package:pre_dashboard/predashboard/widgets/custom_input_field.dart';

import '../../constants/constants.dart';

class Step3Content extends StatelessWidget {
   Step3Content({super.key,
  required this.formKey,
  required this.collegeNameController,
  required this.branchNameController,
  required this.courseNameController,
  required this.yearController,
  required this.stateController,
  });

  final GlobalKey<FormState> formKey;
   final TextEditingController collegeNameController ;
  final TextEditingController branchNameController;
  final TextEditingController courseNameController ;
  final TextEditingController yearController ;
  final TextEditingController stateController;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: screenWidth*0.05),
        child: Form(
          key: formKey,
          child:   Column(
            
            children: [
              
              CustomInputField(
                controller: collegeNameController,
                label: "College Name",
              validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return 'Please enter college name';
                }
                return null;
              },
              ),
              CustomDropdownField(
                controller: stateController,
                items: AppColors.statesAndUTs,
                label: "Select State",
              validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return 'Please select state';

                }
                return null;
              },
              ),
              CustomDropdownField(
                controller: branchNameController,
                items: AppColors.branches,
                label: "Select Branch",
               validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return 'Please select branch';

                }
                return null;
              },
              ),
              CustomDropdownField(
                controller: courseNameController,
                items: AppColors.courses,
                label: "Select Course",
               validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return 'Please select course';

                }
                return null;
              },
              ),
              CustomInputField(label: "Select Year",
                controller: yearController,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
                if(value == null || value.isEmpty)
                {
                  return 'Please enter year';
                }
                return null;
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}