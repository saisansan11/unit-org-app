import 'package:flutter/material.dart';
import '../app/constants.dart';
import '../data/rta_signal_corps.dart';
import '../services/favorites_service.dart';
import '../services/recent_units_service.dart';
import 'map_screen.dart';

class UnitDetailScreen extends StatefulWidget {
  final SignalUnit unit;

  const UnitDetailScreen({super.key, required this.unit});

  @override
  State<UnitDetailScreen> createState() => _UnitDetailScreenState();
}

class _UnitDetailScreenState extends State<UnitDetailScreen> {
  bool _isFavorite = false;

  SignalUnit get unit => widget.unit;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    await FavoritesService.instance.init();
    await RecentUnitsService.instance.init();

    // Track this unit as recently viewed
    await RecentUnitsService.instance.addRecent(unit.id);

    setState(() {
      _isFavorite = FavoritesService.instance.isFavorite(unit.id);
    });
  }

  Future<void> _toggleFavorite() async {
    final newStatus = await FavoritesService.instance.toggleFavorite(unit.id);
    setState(() {
      _isFavorite = newStatus;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newStatus
                ? 'เพิ่ม ${unit.abbreviation} ไปยังรายการโปรด'
                : 'นำ ${unit.abbreviation} ออกจากรายการโปรด',
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final subUnits = unit.childUnitIds
        .map((id) => RTASignalCorps.getUnitById(id))
        .where((u) => u != null)
        .cast<SignalUnit>()
        .toList();

    final parentUnit = unit.parentId != null
        ? RTASignalCorps.getUnitById(unit.parentId!)
        : null;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar with unit info
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: unit.color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? AppColors.accentPink : Colors.white,
                ),
                onPressed: _toggleFavorite,
                tooltip: _isFavorite ? 'นำออกจากรายการโปรด' : 'เพิ่มเป็นรายการโปรด',
              ),
              IconButton(
                icon: const Icon(Icons.map, color: Colors.white),
                onPressed: () => _showOnMap(context),
                tooltip: 'ดูบนแผนที่',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      unit.color,
                      unit.color.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Icon(
                                _getUnitIcon(unit),
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '${unit.level.symbol} ${unit.level.thaiName}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    unit.abbreviation,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Unit Name Card
                  _buildInfoCard(
                    title: 'ชื่อหน่วย',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          unit.name,
                          style: AppTextStyles.headlineMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          unit.nameEn,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Location Card
                  _buildInfoCard(
                    title: 'ที่ตั้ง',
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          unit.location.name,
                          style: AppTextStyles.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${unit.location.district}, ${unit.location.province}',
                          style: AppTextStyles.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.gps_fixed, size: 14, color: AppColors.textMuted),
                            const SizedBox(width: 4),
                            Text(
                              '${unit.location.latitude.toStringAsFixed(4)}°N, ${unit.location.longitude.toStringAsFixed(4)}°E',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Commander & Personnel Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          title: 'ผู้บังคับบัญชา',
                          icon: Icons.military_tech,
                          iconColor: AppColors.officer,
                          child: Text(
                            unit.commanderRank,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.officer,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoCard(
                          title: 'กำลังพล',
                          icon: Icons.people,
                          iconColor: AppColors.primary,
                          child: Text(
                            unit.personnelRange,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Army Area Badge (if applicable)
                  if (unit.armyArea != null) ...[
                    _buildArmyAreaBadge(unit.armyArea!),
                    const SizedBox(height: 16),
                  ],

                  // Description Card
                  _buildInfoCard(
                    title: 'รายละเอียด',
                    icon: Icons.info_outline,
                    iconColor: unit.color,
                    child: Text(
                      unit.description,
                      style: AppTextStyles.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Missions Card
                  if (unit.missions.isNotEmpty) ...[
                    _buildInfoCard(
                      title: 'ภารกิจ',
                      icon: Icons.flag,
                      iconColor: unit.color,
                      child: Column(
                        children: unit.missions.asMap().entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: unit.color.withValues(alpha: 0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${entry.key + 1}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: unit.color,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    entry.value,
                                    style: AppTextStyles.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Parent Unit
                  if (parentUnit != null) ...[
                    _buildInfoCard(
                      title: 'หน่วยเหนือ',
                      icon: Icons.arrow_upward,
                      iconColor: parentUnit.color,
                      child: _buildUnitChip(context, parentUnit),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Sub Units
                  if (subUnits.isNotEmpty) ...[
                    _buildInfoCard(
                      title: 'หน่วยรอง (${subUnits.length} หน่วย)',
                      icon: Icons.arrow_downward,
                      iconColor: unit.color,
                      child: Column(
                        children: subUnits.map((subUnit) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _buildUnitChip(context, subUnit),
                          );
                        }).toList(),
                      ),
                    ),
                  ],

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    IconData? icon,
    Color? iconColor,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: iconColor ?? AppColors.textMuted),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildArmyAreaBadge(int armyArea) {
    final areaInfo = RTASignalCorps.getArmyAreaInfo(armyArea);
    if (areaInfo == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            areaInfo.color.withValues(alpha: 0.15),
            areaInfo.color.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: areaInfo.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: areaInfo.color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${areaInfo.id}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  areaInfo.abbreviation,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: areaInfo.color,
                  ),
                ),
                Text(
                  areaInfo.region,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                Text(
                  'บก.: ${areaInfo.headquarters}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitChip(BuildContext context, SignalUnit unit) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UnitDetailScreen(unit: unit),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: unit.color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: unit.color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: unit.color.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  unit.level.symbol,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: unit.color,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    unit.name,
                    style: AppTextStyles.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        unit.abbreviation,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: unit.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        unit.commanderRank,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: unit.color.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }

  void _showOnMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MapScreen(focusUnit: unit),
      ),
    );
  }

  IconData _getUnitIcon(SignalUnit unit) {
    switch (unit.level) {
      case UnitLevel.school:
        return Icons.school;
      case UnitLevel.factory:
        return Icons.precision_manufacturing;
      case UnitLevel.center:
        return unit.id.contains('ew') ? Icons.radar : Icons.hub;
      case UnitLevel.battalion:
        return Icons.groups;
      case UnitLevel.company:
        return Icons.group;
      case UnitLevel.department:
        return Icons.cell_tower;
      default:
        return Icons.radio;
    }
  }
}
