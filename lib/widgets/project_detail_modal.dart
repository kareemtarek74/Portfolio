import 'dart:js' as js;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kareem_portfolio/constants/app_colors.dart';
import 'package:kareem_portfolio/constants/app_theme.dart';
import 'package:kareem_portfolio/utils/project_utils.dart';

class ProjectDetailModal extends StatefulWidget {
  final ProjectUtils project;

  const ProjectDetailModal({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailModal> createState() => _ProjectDetailModalState();
}

class _ProjectDetailModalState extends State<ProjectDetailModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _closeModal() {
    _controller.reverse().then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _closeModal,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.7),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: _buildModalContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModalContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
      decoration: BoxDecoration(
        borderRadius: AppTheme.radiusXl,
        gradient: LinearGradient(
          colors: [
            CustomColor.scaffoldBg,
            CustomColor.bgLightk,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: CustomColor.glassBorder,
          width: 1.5,
        ),
        boxShadow: [
          ...AppTheme.shadowXl,
          BoxShadow(
            color: CustomColor.glowPurple.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppTheme.radiusXl,
        child: Column(
          children: [
            _buildHeader(),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProjectImage(),
                    const SizedBox(height: 32),
                    _buildTitle(),
                    const SizedBox(height: 16),
                    _buildDescription(),
                    const SizedBox(height: 32),
                    _buildPlatformLinks(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.glassBg,
            CustomColor.glassHighlight,
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: CustomColor.glassBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                CustomColor.primaryGradient.createShader(bounds),
            child: const Icon(
              Icons.folder_open,
              size: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Project Details',
              style: AppTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: _closeModal,
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    CustomColor.glassBg,
                    Colors.transparent,
                  ],
                ),
              ),
              child: const Icon(
                Icons.close,
                color: CustomColor.whitePrimary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImage() {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: AppTheme.radiusLg,
        boxShadow: AppTheme.shadowLg,
      ),
      child: ClipRRect(
        borderRadius: AppTheme.radiusLg,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.project.image,
              fit: BoxFit.fill,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    CustomColor.scaffoldBg.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return ShaderMask(
      shaderCallback: (bounds) =>
          CustomColor.primaryGradient.createShader(bounds),
      child: Text(
        widget.project.title,
        style: AppTheme.displaySmall.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: AppTheme.radiusLg,
        gradient: LinearGradient(
          colors: [
            CustomColor.bgLight2.withOpacity(0.5),
            CustomColor.bgLightk.withOpacity(0.5),
          ],
        ),
        border: Border.all(
          color: CustomColor.glassBorder.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: CustomColor.accentGradient,
                  borderRadius: AppTheme.radiusMd,
                ),
                child: const Icon(
                  Icons.description,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Description',
                style: AppTheme.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.project.subTitle,
            style: AppTheme.bodyLarge.copyWith(
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformLinks() {
    final links = <Map<String, dynamic>>[];

    if (widget.project.androidLink != null &&
        widget.project.androidLink!.isNotEmpty) {
      links.add({
        'icon': 'assets/images/uil_android.svg',
        'label': 'Android',
        'url': widget.project.androidLink,
        'color': CustomColor.accentGreen,
      });
    }

    if (widget.project.iosLink != null && widget.project.iosLink!.isNotEmpty) {
      links.add({
        'icon': 'assets/images/ic_baseline-apple.svg',
        'label': 'iOS',
        'url': widget.project.iosLink,
        'color': CustomColor.whiteSecondary,
      });
    }

    if (widget.project.githubLink != null &&
        widget.project.githubLink!.isNotEmpty) {
      links.add({
        'icon': 'assets/images/github.svg',
        'label': 'GitHub',
        'url': widget.project.githubLink,
        'color': CustomColor.whitePrimary,
      });
    }

    if (widget.project.linkedInLink != null &&
        widget.project.linkedInLink!.isNotEmpty) {
      links.add({
        'icon': 'assets/images/linkedin.svg',
        'label': 'LinkedIn',
        'url': widget.project.linkedInLink,
        'color': CustomColor.accentBlue,
      });
    }

    if (links.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available On',
          style: AppTheme.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: links.map((link) => _buildPlatformButton(link)).toList(),
        ),
      ],
    );
  }

  Widget _buildPlatformButton(Map<String, dynamic> link) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => js.context.callMethod("open", [link['url']]),
        borderRadius: AppTheme.radiusMd,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColor.bgLight2,
                CustomColor.bgLightk,
              ],
            ),
            borderRadius: AppTheme.radiusMd,
            border: Border.all(
              color: CustomColor.glassBorder,
              width: 1,
            ),
            boxShadow: AppTheme.shadowSm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: link['color'].withOpacity(0.2),
                  borderRadius: AppTheme.radiusSm,
                ),
                child: SvgPicture.asset(
                  link['icon'],
                  color: link['color'],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                link['label'],
                style: AppTheme.labelLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.open_in_new,
                size: 16,
                color: CustomColor.whiteSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
