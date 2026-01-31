import 'package:flutter/material.dart';

/// โครงสร้างหน่วยทหารสื่อสาร กองทัพบก (ข้อมูลถูกต้อง 100% จาก PDF)
/// Royal Thai Army Signal Corps Organization
/// อ้างอิง: ผังการจัดหน่วย ทบ. และ นขต.

class RTASignalCorps {
  // =============================================
  // หน่วยทหารสื่อสาร ส่วนกลาง (กรมการทหารสื่อสาร)
  // =============================================

  static const List<SignalUnit> centralUnits = [
    // กรมการทหารสื่อสาร
    SignalUnit(
      id: 'signal_dept',
      name: 'กรมการทหารสื่อสาร',
      nameEn: 'Signal Department',
      abbreviation: 'กส.',
      level: UnitLevel.department,
      parentId: null,
      location: UnitLocation(
        name: 'สะพานแดง',
        province: 'กรุงเทพมหานคร',
        district: 'บางซื่อ',
        latitude: 13.8191,
        longitude: 100.5150,
      ),
      commanderRank: 'พลโท',
      description: 'เป็นหน่วยขึ้นตรงกองทัพบก (นขต.ทบ.) รับผิดชอบงานสื่อสารทั้งปวงของกองทัพบก',
      missions: [
        'วางแผน อำนวยการ ประสานงาน กำกับการ และดำเนินการด้านการสื่อสาร',
        'พัฒนาระบบสื่อสารและสารสนเทศของกองทัพบก',
        'ผลิต จัดหา ซ่อมบำรุงยุทโธปกรณ์สายสื่อสาร',
        'ฝึกศึกษาบุคลากรด้านการสื่อสาร',
        'ดำเนินการด้านสงครามอิเล็กทรอนิกส์',
      ],
      childUnitIds: ['signal_center', 'signal_school', 'signal_factory', 'ew_center'],
      color: Color(0xFFFF9500),
    ),

    // ศูนย์การสื่อสาร กส.
    SignalUnit(
      id: 'signal_center',
      name: 'ศูนย์การสื่อสาร',
      nameEn: 'Signal Center',
      abbreviation: 'ศส.กส.',
      level: UnitLevel.center,
      parentId: 'signal_dept',
      location: UnitLocation(
        name: 'สะพานแดง',
        province: 'กรุงเทพมหานคร',
        district: 'บางซื่อ',
        latitude: 13.8191,
        longitude: 100.5150,
      ),
      commanderRank: 'พันเอก',
      description: 'ศูนย์ควบคุมและปฏิบัติการสื่อสารหลักของกองทัพบก',
      missions: [
        'ควบคุมการสื่อสารของกองทัพบก',
        'ดำเนินการระบบสื่อสารดาวเทียมทหาร',
        'ดำเนินการระบบโทรคมนาคมทหาร',
        'บริการข่ายสื่อสารทางทหาร',
      ],
      childUnitIds: [],
      color: Color(0xFFFF9500),
    ),

    // โรงเรียนทหารสื่อสาร
    SignalUnit(
      id: 'signal_school',
      name: 'โรงเรียนทหารสื่อสาร',
      nameEn: 'Signal School',
      abbreviation: 'รร.ส.สส.',
      level: UnitLevel.school,
      parentId: 'signal_dept',
      location: UnitLocation(
        name: 'สะพานแดง',
        province: 'กรุงเทพมหานคร',
        district: 'บางซื่อ',
        latitude: 13.8185,
        longitude: 100.5145,
      ),
      commanderRank: 'พลตรี',
      description: 'สถาบันการศึกษาและฝึกอบรมด้านการสื่อสารทหารบก',
      missions: [
        'ผลิตนายทหารสื่อสาร (หลักสูตรชั้นนายร้อย-นายพัน)',
        'อบรมหลักสูตรเฉพาะทางด้านการสื่อสาร',
        'วิจัยและพัฒนาด้านการสื่อสารทหาร',
        'เป็นศูนย์กลางความรู้ด้านการสื่อสาร',
      ],
      childUnitIds: [],
      color: Color(0xFFFF9500),
    ),

    // กองโรงงานซ่อมสร้างเครื่องสื่อสาร
    SignalUnit(
      id: 'signal_factory',
      name: 'กองโรงงานซ่อมสร้างเครื่องสื่อสาร',
      nameEn: 'Signal Equipment Factory',
      abbreviation: 'กรส.กส.',
      level: UnitLevel.factory,
      parentId: 'signal_dept',
      location: UnitLocation(
        name: 'สะพานแดง',
        province: 'กรุงเทพมหานคร',
        district: 'บางซื่อ',
        latitude: 13.8195,
        longitude: 100.5155,
      ),
      commanderRank: 'พันเอก',
      description: 'หน่วยซ่อมสร้างและผลิตอุปกรณ์สื่อสาร',
      missions: [
        'ซ่อมบำรุงยุทโธปกรณ์สายสื่อสารขั้นคลัง',
        'ผลิตอุปกรณ์สื่อสาร',
        'ดัดแปลง ปรับปรุงอุปกรณ์สื่อสาร',
        'ทดสอบและควบคุมคุณภาพ',
      ],
      childUnitIds: [],
      color: Color(0xFFFF9500),
    ),

    // ศูนย์สงครามอิเล็กทรอนิกส์
    SignalUnit(
      id: 'ew_center',
      name: 'ศูนย์สงครามอิเล็กทรอนิกส์',
      nameEn: 'Electronic Warfare Center',
      abbreviation: 'ศสอ.',
      level: UnitLevel.center,
      parentId: 'signal_dept',
      location: UnitLocation(
        name: 'สะพานแดง',
        province: 'กรุงเทพมหานคร',
        district: 'บางซื่อ',
        latitude: 13.8192,
        longitude: 100.5151,
      ),
      commanderRank: 'พันเอก',
      description: 'ศูนย์ปฏิบัติการสงครามอิเล็กทรอนิกส์ของกองทัพบก',
      missions: [
        'วางแผนและปฏิบัติการสงครามอิเล็กทรอนิกส์',
        'ดำเนินการ ESM/ECM/ECCM',
        'วิเคราะห์และข่าวกรองสัญญาณ',
        'ฝึกอบรมด้านสงครามอิเล็กทรอนิกส์',
      ],
      childUnitIds: [],
      color: Color(0xFFFF5722),
    ),
  ];

  // =============================================
  // หน่วยสื่อสารประจำกองทัพภาค (ข้อมูลจาก PDF)
  // กองพันทหารสื่อสาร (ส.พัน.) ขึ้นตรง ทภ.
  // =============================================

  static const List<SignalUnit> armyAreaUnits = [
    // =============================================
    // กองทัพภาคที่ 1 (ภาคกลาง/ภาคตะวันออก)
    // ส.พัน.1, ส.พัน.2, ส.พัน.9, ส.พัน.21
    // =============================================

    SignalUnit(
      id: 'signal_bn_1',
      name: 'กองพันทหารสื่อสารที่ 1',
      nameEn: '1st Signal Battalion',
      abbreviation: 'ส.พัน.1',
      level: UnitLevel.battalion,
      parentId: '1st_army_area',
      location: UnitLocation(
        name: 'กรุงเทพมหานคร',
        province: 'กรุงเทพมหานคร',
        district: 'ดุสิต',
        latitude: 13.7780,
        longitude: 100.5120,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 1 สนับสนุน ทภ.1',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.1'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 1,
      color: Color(0xFF4CAF50),
    ),

    SignalUnit(
      id: 'signal_bn_2',
      name: 'กองพันทหารสื่อสารที่ 2',
      nameEn: '2nd Signal Battalion',
      abbreviation: 'ส.พัน.2',
      level: UnitLevel.battalion,
      parentId: '1st_army_area',
      location: UnitLocation(
        name: 'ค่ายจักรพงษ์',
        province: 'ปราจีนบุรี',
        district: 'เมืองปราจีนบุรี',
        latitude: 14.0579,
        longitude: 101.3731,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 2 สนับสนุน ทภ.1',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.1'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 1,
      color: Color(0xFF4CAF50),
    ),

    SignalUnit(
      id: 'signal_bn_9',
      name: 'กองพันทหารสื่อสารที่ 9',
      nameEn: '9th Signal Battalion',
      abbreviation: 'ส.พัน.9',
      level: UnitLevel.battalion,
      parentId: '1st_army_area',
      location: UnitLocation(
        name: 'ค่ายสุรสีห์',
        province: 'กาญจนบุรี',
        district: 'เมืองกาญจนบุรี',
        latitude: 14.0200,
        longitude: 99.5300,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 9 สนับสนุน ทภ.1',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.1'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 1,
      color: Color(0xFF4CAF50),
    ),

    SignalUnit(
      id: 'signal_bn_21',
      name: 'กองพันทหารสื่อสารที่ 21',
      nameEn: '21st Signal Battalion',
      abbreviation: 'ส.พัน.21',
      level: UnitLevel.battalion,
      parentId: '1st_army_area',
      location: UnitLocation(
        name: 'ค่ายนวมินทราชินี',
        province: 'ชลบุรี',
        district: 'เมืองชลบุรี',
        latitude: 13.3622,
        longitude: 100.9847,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 21 สนับสนุน ทภ.1',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.1'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 1,
      color: Color(0xFF4CAF50),
    ),

    // =============================================
    // กองทัพภาคที่ 2 (ภาคตะวันออกเฉียงเหนือ/อีสาน)
    // ส.พัน.3, ส.พัน.6, ส.พัน.22
    // =============================================

    SignalUnit(
      id: 'signal_bn_3',
      name: 'กองพันทหารสื่อสารที่ 3',
      nameEn: '3rd Signal Battalion',
      abbreviation: 'ส.พัน.3',
      level: UnitLevel.battalion,
      parentId: '2nd_army_area',
      location: UnitLocation(
        name: 'ค่ายสุรนารี',
        province: 'นครราชสีมา',
        district: 'เมืองนครราชสีมา',
        latitude: 14.9707,
        longitude: 102.1018,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 3 สนับสนุน ทภ.2',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.2'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 2,
      color: Color(0xFF2196F3),
    ),

    SignalUnit(
      id: 'signal_bn_6',
      name: 'กองพันทหารสื่อสารที่ 6',
      nameEn: '6th Signal Battalion',
      abbreviation: 'ส.พัน.6',
      level: UnitLevel.battalion,
      parentId: '2nd_army_area',
      location: UnitLocation(
        name: 'ค่ายสรรพสิทธิประสงค์',
        province: 'อุบลราชธานี',
        district: 'วารินชำราบ',
        latitude: 15.2000,
        longitude: 104.8700,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 6 สนับสนุน ทภ.2',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.2'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 2,
      color: Color(0xFF2196F3),
    ),

    SignalUnit(
      id: 'signal_bn_22',
      name: 'กองพันทหารสื่อสารที่ 22',
      nameEn: '22nd Signal Battalion',
      abbreviation: 'ส.พัน.22',
      level: UnitLevel.battalion,
      parentId: '2nd_army_area',
      location: UnitLocation(
        name: 'ค่ายประจักษ์ศิลปาคม',
        province: 'อุดรธานี',
        district: 'เมืองอุดรธานี',
        latitude: 17.4156,
        longitude: 102.7872,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 22 สนับสนุน ทภ.2',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.2'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 2,
      color: Color(0xFF2196F3),
    ),

    // =============================================
    // กองทัพภาคที่ 3 (ภาคเหนือ)
    // ส.พัน.4, ส.พัน.11, ส.พัน.23
    // =============================================

    SignalUnit(
      id: 'signal_bn_4',
      name: 'กองพันทหารสื่อสารที่ 4',
      nameEn: '4th Signal Battalion',
      abbreviation: 'ส.พัน.4',
      level: UnitLevel.battalion,
      parentId: '3rd_army_area',
      location: UnitLocation(
        name: 'ค่ายสมเด็จพระนเรศวรมหาราช',
        province: 'พิษณุโลก',
        district: 'เมืองพิษณุโลก',
        latitude: 16.8211,
        longitude: 100.2659,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 4 สนับสนุน ทภ.3',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.3'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 3,
      color: Color(0xFFFF9800),
    ),

    SignalUnit(
      id: 'signal_bn_11',
      name: 'กองพันทหารสื่อสารที่ 11',
      nameEn: '11th Signal Battalion',
      abbreviation: 'ส.พัน.11',
      level: UnitLevel.battalion,
      parentId: '3rd_army_area',
      location: UnitLocation(
        name: 'ค่ายกาวิละ',
        province: 'เชียงใหม่',
        district: 'เมืองเชียงใหม่',
        latitude: 18.7883,
        longitude: 98.9853,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 11 สนับสนุน ทภ.3',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.3'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 3,
      color: Color(0xFFFF9800),
    ),

    SignalUnit(
      id: 'signal_bn_23',
      name: 'กองพันทหารสื่อสารที่ 23',
      nameEn: '23rd Signal Battalion',
      abbreviation: 'ส.พัน.23',
      level: UnitLevel.battalion,
      parentId: '3rd_army_area',
      location: UnitLocation(
        name: 'ค่ายเม็งรายมหาราช',
        province: 'เชียงราย',
        district: 'เมืองเชียงราย',
        latitude: 19.9071,
        longitude: 99.8310,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 23 สนับสนุน ทภ.3',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.3'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 3,
      color: Color(0xFFFF9800),
    ),

    // =============================================
    // กองทัพภาคที่ 4 (ภาคใต้)
    // ส.พัน.5, ส.พัน.15, ส.พัน.24
    // =============================================

    SignalUnit(
      id: 'signal_bn_5',
      name: 'กองพันทหารสื่อสารที่ 5',
      nameEn: '5th Signal Battalion',
      abbreviation: 'ส.พัน.5',
      level: UnitLevel.battalion,
      parentId: '4th_army_area',
      location: UnitLocation(
        name: 'ค่ายวชิราวุธ',
        province: 'นครศรีธรรมราช',
        district: 'เมืองนครศรีธรรมราช',
        latitude: 8.4304,
        longitude: 99.9632,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 5 สนับสนุน ทภ.4',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.4'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 4,
      color: Color(0xFFE91E63),
    ),

    SignalUnit(
      id: 'signal_bn_15',
      name: 'กองพันทหารสื่อสารที่ 15',
      nameEn: '15th Signal Battalion',
      abbreviation: 'ส.พัน.15',
      level: UnitLevel.battalion,
      parentId: '4th_army_area',
      location: UnitLocation(
        name: 'ค่ายเสนาณรงค์',
        province: 'สงขลา',
        district: 'หาดใหญ่',
        latitude: 7.0086,
        longitude: 100.4747,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 15 สนับสนุน ทภ.4',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.4'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 4,
      color: Color(0xFFE91E63),
    ),

    SignalUnit(
      id: 'signal_bn_24',
      name: 'กองพันทหารสื่อสารที่ 24',
      nameEn: '24th Signal Battalion',
      abbreviation: 'ส.พัน.24',
      level: UnitLevel.battalion,
      parentId: '4th_army_area',
      location: UnitLocation(
        name: 'ค่ายอิงคยุทธบริหาร',
        province: 'ปัตตานี',
        district: 'หนองจิก',
        latitude: 6.8691,
        longitude: 101.2501,
      ),
      commanderRank: 'พันโท',
      description: 'กองพันทหารสื่อสารที่ 24 สนับสนุน ทภ.4',
      missions: ['สนับสนุนการสื่อสารให้ ทภ.4'],
      childUnitIds: [],
      personnelMin: 300,
      personnelMax: 500,
      armyArea: 4,
      color: Color(0xFFE91E63),
    ),
  ];

  // =============================================
  // ข้อมูลสรุปกองทัพภาค (สำหรับการแสดงผล)
  // =============================================

  static const List<ArmyAreaInfo> armyAreaInfo = [
    ArmyAreaInfo(
      id: 1,
      name: 'กองทัพภาคที่ 1',
      nameEn: '1st Army Area',
      abbreviation: 'ทภ.1',
      region: 'ภาคกลาง/ตะวันออก',
      headquarters: 'กรุงเทพมหานคร',
      signalBattalions: ['ส.พัน.1', 'ส.พัน.2', 'ส.พัน.9', 'ส.พัน.21'],
      color: Color(0xFF4CAF50),
      latitude: 13.7563,
      longitude: 100.5018,
    ),
    ArmyAreaInfo(
      id: 2,
      name: 'กองทัพภาคที่ 2',
      nameEn: '2nd Army Area',
      abbreviation: 'ทภ.2',
      region: 'ภาคตะวันออกเฉียงเหนือ',
      headquarters: 'ค่ายสุรนารี นครราชสีมา',
      signalBattalions: ['ส.พัน.3', 'ส.พัน.6', 'ส.พัน.22'],
      color: Color(0xFF2196F3),
      latitude: 14.9707,
      longitude: 102.1018,
    ),
    ArmyAreaInfo(
      id: 3,
      name: 'กองทัพภาคที่ 3',
      nameEn: '3rd Army Area',
      abbreviation: 'ทภ.3',
      region: 'ภาคเหนือ',
      headquarters: 'ค่ายสมเด็จพระนเรศวรมหาราช พิษณุโลก',
      signalBattalions: ['ส.พัน.4', 'ส.พัน.11', 'ส.พัน.23'],
      color: Color(0xFFFF9800),
      latitude: 16.8211,
      longitude: 100.2659,
    ),
    ArmyAreaInfo(
      id: 4,
      name: 'กองทัพภาคที่ 4',
      nameEn: '4th Army Area',
      abbreviation: 'ทภ.4',
      region: 'ภาคใต้',
      headquarters: 'ค่ายวชิราวุธ นครศรีธรรมราช',
      signalBattalions: ['ส.พัน.5', 'ส.พัน.15', 'ส.พัน.24'],
      color: Color(0xFFE91E63),
      latitude: 8.4304,
      longitude: 99.9632,
    ),
  ];

  /// Get all units combined
  static List<SignalUnit> get allUnits => [
    ...centralUnits,
  ];

  static List<SignalUnit> get allCombinedUnits => [
    ...centralUnits,
    ...armyAreaUnits,
  ];

  /// Get unit by ID
  static SignalUnit? getUnitById(String id) {
    try {
      return allCombinedUnits.firstWhere((u) => u.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Get child units
  static List<SignalUnit> getChildUnits(String parentId) {
    return allCombinedUnits.where((u) => u.parentId == parentId).toList();
  }

  /// Get units by level
  static List<SignalUnit> getUnitsByLevel(UnitLevel level) {
    return allCombinedUnits.where((u) => u.level == level).toList();
  }

  /// Get units by army area
  static List<SignalUnit> getUnitsByArmyArea(int armyArea) {
    return armyAreaUnits.where((u) => u.armyArea == armyArea).toList();
  }

  /// Get root unit (Signal Department)
  static SignalUnit get rootUnit => centralUnits.first;

  /// Get units for map display (main units only)
  static List<SignalUnit> get mapDisplayUnits => [
    ...centralUnits.where((u) => u.level == UnitLevel.department || u.level == UnitLevel.school),
    ...armyAreaUnits,
  ];

  /// Get army area info by ID
  static ArmyAreaInfo? getArmyAreaInfo(int id) {
    try {
      return armyAreaInfo.firstWhere((a) => a.id == id);
    } catch (_) {
      return null;
    }
  }
}

// =============================================
// Models
// =============================================

/// ระดับหน่วย
enum UnitLevel {
  department,  // กรม
  center,      // ศูนย์
  school,      // โรงเรียน
  factory,     // กองโรงงาน
  battalion,   // กองพัน
  company,     // กองร้อย
  platoon,     // หมวด
  squad,       // หมู่
}

extension UnitLevelExtension on UnitLevel {
  String get thaiName {
    switch (this) {
      case UnitLevel.department:
        return 'กรม';
      case UnitLevel.center:
        return 'ศูนย์';
      case UnitLevel.school:
        return 'โรงเรียน';
      case UnitLevel.factory:
        return 'กองโรงงาน';
      case UnitLevel.battalion:
        return 'กองพัน';
      case UnitLevel.company:
        return 'กองร้อย';
      case UnitLevel.platoon:
        return 'หมวด';
      case UnitLevel.squad:
        return 'หมู่';
    }
  }

  String get symbol {
    switch (this) {
      case UnitLevel.department:
        return '|||';
      case UnitLevel.center:
        return '◆';
      case UnitLevel.school:
        return '🎓';
      case UnitLevel.factory:
        return '⚙';
      case UnitLevel.battalion:
        return '||';
      case UnitLevel.company:
        return '|';
      case UnitLevel.platoon:
        return '••';
      case UnitLevel.squad:
        return '•';
    }
  }

  int get sortOrder {
    switch (this) {
      case UnitLevel.department:
        return 0;
      case UnitLevel.center:
        return 1;
      case UnitLevel.school:
        return 1;
      case UnitLevel.factory:
        return 1;
      case UnitLevel.battalion:
        return 2;
      case UnitLevel.company:
        return 3;
      case UnitLevel.platoon:
        return 4;
      case UnitLevel.squad:
        return 5;
    }
  }
}

/// ที่ตั้งหน่วย
class UnitLocation {
  final String name;
  final String province;
  final String district;
  final double latitude;
  final double longitude;

  const UnitLocation({
    required this.name,
    required this.province,
    required this.district,
    required this.latitude,
    required this.longitude,
  });

  String get fullAddress => '$name, $district, $province';
}

/// หน่วยทหารสื่อสาร
class SignalUnit {
  final String id;
  final String name;
  final String nameEn;
  final String abbreviation;
  final UnitLevel level;
  final String? parentId;
  final UnitLocation location;
  final String commanderRank;
  final String description;
  final List<String> missions;
  final List<String> childUnitIds;
  final int? personnelMin;
  final int? personnelMax;
  final int? armyArea;
  final Color color;

  const SignalUnit({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.abbreviation,
    required this.level,
    this.parentId,
    required this.location,
    required this.commanderRank,
    required this.description,
    required this.missions,
    required this.childUnitIds,
    this.personnelMin,
    this.personnelMax,
    this.armyArea,
    required this.color,
  });

  String get personnelRange {
    if (personnelMin != null && personnelMax != null) {
      return '$personnelMin - $personnelMax นาย';
    }
    return '-';
  }
}

/// ข้อมูลกองทัพภาค
class ArmyAreaInfo {
  final int id;
  final String name;
  final String nameEn;
  final String abbreviation;
  final String region;
  final String headquarters;
  final List<String> signalBattalions;
  final Color color;
  final double latitude;
  final double longitude;

  const ArmyAreaInfo({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.abbreviation,
    required this.region,
    required this.headquarters,
    required this.signalBattalions,
    required this.color,
    required this.latitude,
    required this.longitude,
  });
}
