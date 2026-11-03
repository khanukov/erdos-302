-- Generated; occurrences are not deduplicated.
import Dag
import MixedDag
open Finset UpperBridge
namespace Node1209Rows033
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def target : Finset ℕ := {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 48, 49, 50, 51, 52, 54, 55, 56, 57, 58, 60, 62, 63, 64, 65, 66, 68, 69, 70, 72, 74, 75, 76, 77, 78, 80, 81, 82, 84, 85, 86, 87, 88, 90, 91, 92, 93, 94, 95, 96, 98, 99, 100, 102, 104, 105, 106, 108, 110, 111, 112, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 128, 129, 130, 132, 133, 134, 135, 136, 138, 140, 141, 142, 143, 144, 145, 147, 148, 150, 152, 153, 154, 155, 156, 159, 160, 161, 162, 164, 165, 168, 170, 171, 172, 174, 175, 176, 177, 180, 182, 183, 184, 185, 186, 187, 188, 189, 190, 192, 195, 196, 198, 200, 201, 203, 204, 205, 207, 208, 209, 210, 212, 213, 215, 216, 217, 220, 221, 222, 224, 225, 228, 230, 231, 232, 234, 235, 236, 238, 240, 242, 243, 244, 245, 246, 247, 248, 250, 252, 253, 255, 256, 258, 259, 260, 261, 264, 265, 266, 268, 270, 272, 273, 275, 276, 279, 280, 282, 284, 285, 286, 287, 288, 290, 294, 295, 296, 297, 299, 300, 301, 304, 305, 306, 308, 310, 312, 315, 318, 319, 320, 322, 323, 324, 325, 328, 329, 330, 333, 335, 336, 338, 340, 341, 342, 344, 345, 348, 350, 351, 352, 354, 355, 357, 360, 363, 364, 366, 368, 369, 370, 372, 374, 375, 376, 377, 378, 380, 384, 385, 387, 390, 391, 392, 396, 399, 400, 402, 403, 405, 406, 407, 408, 410, 414, 416, 418, 420, 423, 424, 425, 426, 429, 430, 432, 434, 435, 437, 440, 441, 442, 444, 448, 450, 451, 455, 456, 459, 460, 462, 464, 465, 468, 470, 472, 473, 475, 476, 477, 480, 481, 483, 484, 486, 488, 490, 492, 493, 494, 495, 496, 500, 504, 506, 507, 510, 512, 513, 516, 517, 518, 520, 522, 525, 527, 528, 530, 531, 532, 533, 536, 539, 540, 544, 546, 549, 550, 551, 552, 555, 558, 559, 560, 561, 564, 567, 568, 570, 572, 574, 575, 576, 578, 580, 585, 588, 589, 590, 592, 594, 595, 598, 600, 602, 603, 605, 608, 609, 610, 611, 612, 615, 616, 620, 621, 624, 627, 629, 630, 636, 637, 638, 639, 640, 644, 645, 646, 648, 650, 651, 656, 658, 660, 663, 665, 666, 667, 670, 672, 675, 676, 680, 682, 684, 686, 688, 690, 693, 696, 697, 700, 702, 703, 704, 705, 708, 710, 713, 714, 715, 720, 725, 726, 728, 729, 731, 732, 735, 736, 738, 740, 741, 742, 744, 748, 750, 752, 754, 756, 759, 760, 765, 768, 770, 774, 775, 777, 779, 780, 782, 783, 784, 792, 795, 798, 799, 800, 804, 805, 806, 810, 812, 814, 816, 817, 819, 820, 825, 828, 832, 833, 836, 837, 840, 845, 846, 847, 850, 851, 852, 855, 858, 860, 861, 864, 867, 868, 870, 874, 875, 880, 882, 884, 885, 888, 891, 893, 896, 897, 899, 900, 902, 903, 910, 912, 915, 918, 920, 924, 925, 928, 930, 931, 935, 936, 940, 943, 945, 946, 950, 952, 954, 957, 960, 962, 966, 968, 969, 972, 975, 980, 984, 986, 987, 988, 989, 990, 992, 999, 1000, 1001, 1005, 1007, 1008, 1012, 1014, 1015, 1020, 1023, 1025, 1026, 1029, 1032, 1034, 1035, 1036, 1040, 1044, 1045, 1050, 1053, 1054, 1056, 1060, 1062, 1064, 1065, 1066, 1071, 1073, 1075, 1078, 1080, 1081, 1085, 1088, 1089, 1092, 1098, 1100, 1102, 1104, 1105, 1107, 1110, 1113, 1116, 1118, 1120, 1122, 1125, 1127, 1128, 1131, 1134, 1140, 1144, 1147, 1148, 1150, 1152, 1155, 1160, 1161, 1166, 1170, 1173, 1175, 1176, 1178, 1180, 1183, 1184, 1188, 1189, 1190, 1196, 1197, 1200, 1204, 1206, 1209, 1210, 1215, 1216, 1218, 1219, 1220, 1221, 1222, 1224, 1225, 1230, 1232, 1235, 1239, 1240, 1242, 1247, 1248, 1250, 1254, 1258, 1260, 1265, 1269, 1271, 1272, 1274, 1275, 1276, 1278, 1280, 1281, 1287, 1288, 1290, 1292, 1295, 1296, 1300, 1302, 1305, 1309, 1311, 1312, 1316, 1320, 1323, 1325, 1326, 1330, 1332, 1333, 1334, 1340, 1344, 1350, 1352, 1353, 1360, 1363, 1364, 1365, 1368, 1372, 1375, 1376, 1377, 1378, 1380, 1386, 1392, 1394, 1395, 1400, 1404, 1406, 1407, 1408, 1410, 1416, 1419, 1420, 1421, 1425, 1426, 1428, 1430, 1431, 1435, 1440, 1443, 1449, 1450, 1452, 1456, 1457, 1458, 1462, 1463, 1464, 1470, 1472, 1476, 1479, 1480, 1482, 1484, 1485, 1488, 1495, 1496, 1500, 1504, 1505, 1508, 1512, 1517, 1518, 1519, 1520, 1521, 1530, 1536, 1537, 1539, 1540, 1547, 1548, 1550, 1551, 1554, 1558, 1560, 1564, 1566, 1568, 1573, 1575, 1581, 1584, 1590, 1591, 1593, 1595, 1596, 1598, 1599, 1600, 1608, 1610, 1612, 1615, 1617, 1620, 1624, 1625, 1628, 1632, 1634, 1638, 1640, 1643, 1645, 1650, 1652, 1653, 1656, 1664, 1665, 1666, 1672, 1674, 1677, 1680, 1683, 1690, 1692, 1694, 1696, 1700, 1701, 1702, 1704, 1705, 1708, 1710, 1711, 1715, 1716, 1720, 1722, 1725, 1728, 1729, 1734, 1736, 1739, 1740, 1748, 1749, 1750, 1755, 1760, 1763, 1764, 1767, 1768, 1770, 1771, 1776, 1782, 1785, 1786, 1792, 1794, 1798, 1800, 1802, 1804, 1806, 1813, 1815, 1820, 1824, 1827, 1829, 1830, 1833, 1836, 1840, 1845, 1848, 1850, 1855, 1856, 1859, 1860, 1862, 1863, 1870, 1872, 1875, 1876, 1880, 1881, 1886, 1887, 1888, 1890, 1892, 1900}
def imageId264 : ℕ := 2458
def row264 : MixedDag.Row := ⟨173, 3, 1, 74⟩
def source264 : Finset ℕ := {221, 390, 510}
def Check264 : Prop := (row264).source < 1209 ∧ 0 < (row264).mul ∧ 0 < (row264).div ∧ (∀ x ∈ source264, (row264).div ∣ x * (row264).mul) ∧ ArchiveScaling.image source264 (row264).mul (row264).div ⊆ target
instance : Decidable Check264 := by unfold Check264; infer_instance
theorem check264 : Check264 := by decide
theorem bound264 (h : Extended.Bound source264 1) : Extended.Bound (ArchiveScaling.image source264 (row264).mul (row264).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check264
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check264
#print axioms bound264
def imageId265 : ℕ := 1063
def row265 : MixedDag.Row := ⟨177, 1, 1, 40⟩
def source265 : Finset ℕ := {238, 434, 527}
def Check265 : Prop := (row265).source < 1209 ∧ 0 < (row265).mul ∧ 0 < (row265).div ∧ (∀ x ∈ source265, (row265).div ∣ x * (row265).mul) ∧ ArchiveScaling.image source265 (row265).mul (row265).div ⊆ target
instance : Decidable Check265 := by unfold Check265; infer_instance
theorem check265 : Check265 := by decide
theorem bound265 (h : Extended.Bound source265 1) : Extended.Bound (ArchiveScaling.image source265 (row265).mul (row265).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check265
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check265
#print axioms bound265
def imageId266 : ℕ := 1064
def row266 : MixedDag.Row := ⟨179, 3, 1, 123⟩
def source266 : Finset ℕ := {140, 189, 540}
def Check266 : Prop := (row266).source < 1209 ∧ 0 < (row266).mul ∧ 0 < (row266).div ∧ (∀ x ∈ source266, (row266).div ∣ x * (row266).mul) ∧ ArchiveScaling.image source266 (row266).mul (row266).div ⊆ target
instance : Decidable Check266 := by unfold Check266; infer_instance
theorem check266 : Check266 := by decide
theorem bound266 (h : Extended.Bound source266 1) : Extended.Bound (ArchiveScaling.image source266 (row266).mul (row266).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check266
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check266
#print axioms bound266
def imageId267 : ℕ := 648
def row267 : MixedDag.Row := ⟨180, 2, 1, 97⟩
def source267 : Finset ℕ := {255, 480, 544}
def Check267 : Prop := (row267).source < 1209 ∧ 0 < (row267).mul ∧ 0 < (row267).div ∧ (∀ x ∈ source267, (row267).div ∣ x * (row267).mul) ∧ ArchiveScaling.image source267 (row267).mul (row267).div ⊆ target
instance : Decidable Check267 := by unfold Check267; infer_instance
theorem check267 : Check267 := by decide
theorem bound267 (h : Extended.Bound source267 1) : Extended.Bound (ArchiveScaling.image source267 (row267).mul (row267).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check267
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check267
#print axioms bound267
def imageId268 : ℕ := 1065
def row268 : MixedDag.Row := ⟨180, 3, 1, 352⟩
def source268 : Finset ℕ := {255, 480, 544}
def Check268 : Prop := (row268).source < 1209 ∧ 0 < (row268).mul ∧ 0 < (row268).div ∧ (∀ x ∈ source268, (row268).div ∣ x * (row268).mul) ∧ ArchiveScaling.image source268 (row268).mul (row268).div ⊆ target
instance : Decidable Check268 := by unfold Check268; infer_instance
theorem check268 : Check268 := by decide
theorem bound268 (h : Extended.Bound source268 1) : Extended.Bound (ArchiveScaling.image source268 (row268).mul (row268).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check268
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check268
#print axioms bound268
def imageId269 : ℕ := 1068
def row269 : MixedDag.Row := ⟨184, 3, 1, 116⟩
def source269 : Finset ℕ := {23, 24, 552}
def Check269 : Prop := (row269).source < 1209 ∧ 0 < (row269).mul ∧ 0 < (row269).div ∧ (∀ x ∈ source269, (row269).div ∣ x * (row269).mul) ∧ ArchiveScaling.image source269 (row269).mul (row269).div ⊆ target
instance : Decidable Check269 := by unfold Check269; infer_instance
theorem check269 : Check269 := by decide
theorem bound269 (h : Extended.Bound source269 1) : Extended.Bound (ArchiveScaling.image source269 (row269).mul (row269).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check269
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check269
#print axioms bound269
def imageId270 : ℕ := 1069
def row270 : MixedDag.Row := ⟨186, 3, 1, 40⟩
def source270 : Finset ℕ := {272, 528, 561}
def Check270 : Prop := (row270).source < 1209 ∧ 0 < (row270).mul ∧ 0 < (row270).div ∧ (∀ x ∈ source270, (row270).div ∣ x * (row270).mul) ∧ ArchiveScaling.image source270 (row270).mul (row270).div ⊆ target
instance : Decidable Check270 := by unfold Check270; infer_instance
theorem check270 : Check270 := by decide
theorem bound270 (h : Extended.Bound source270 1) : Extended.Bound (ArchiveScaling.image source270 (row270).mul (row270).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check270
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check270
#print axioms bound270
def imageId271 : ℕ := 2638
def row271 : MixedDag.Row := ⟨190, 3, 1, 33⟩
def source271 : Finset ℕ := {228, 372, 589}
def Check271 : Prop := (row271).source < 1209 ∧ 0 < (row271).mul ∧ 0 < (row271).div ∧ (∀ x ∈ source271, (row271).div ∣ x * (row271).mul) ∧ ArchiveScaling.image source271 (row271).mul (row271).div ⊆ target
instance : Decidable Check271 := by unfold Check271; infer_instance
theorem check271 : Check271 := by decide
theorem bound271 (h : Extended.Bound source271 1) : Extended.Bound (ArchiveScaling.image source271 (row271).mul (row271).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check271
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check271
#print axioms bound271
end Node1209Rows033
