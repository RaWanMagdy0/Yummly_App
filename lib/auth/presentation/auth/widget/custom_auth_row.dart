import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/images/app_images.dart';
import '../view_model/auth_states.dart';
import '../view_model/auth_view_model.dart';

class CustomAuthRow extends StatefulWidget {
  const CustomAuthRow({super.key});

  @override
  State<CustomAuthRow> createState() => _CustomAuthRowState();
}

class _CustomAuthRowState extends State<CustomAuthRow> {
  late AuthCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) => _handelStateChange(state),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(140.w, 50.h),
              backgroundColor: AppColors.kBaseColor.withValues(alpha: 0.2),
              overlayColor: Colors.white.withValues(alpha: 0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: Colors.transparent, width: 1.w),
              ),
            ),
            onPressed: () => viewModel.signInWithGoogle(),
            child: Image.asset(AppImages.google, scale: 15),
          ),
          10.horizontalSpace,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(140.w, 50.h),
              backgroundColor: AppColors.kBaseColor.withValues(alpha: 0.2),
              overlayColor: Colors.white.withValues(alpha: 0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: Colors.transparent, width: 1.w),
              ),
            ),
            onPressed: () {},
            child: Image.asset(AppImages.apple, scale: 25),
          ),
        ],
      ),
    );
  }

  void _handelStateChange(AuthState state) {
    if (state is SignInWithGoogleSuccess) {
      Navigator.pushNamed(context, PageRouteName.categoryScreen);
    } else if (state is SignInWithGoogleFail) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMassage ?? ""),
          backgroundColor: AppColors.kRed,
        ),
      );
    } else if (state is SignInWithGoogleLoading) {}
  }
}
