-- Generated; occurrences are not deduplicated.
import Dag
import MixedDag
open Finset UpperBridge
namespace Node1209Rows051
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
def target : Finset ℕ := {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 48, 49, 50, 51, 52, 54, 55, 56, 57, 58, 60, 62, 63, 64, 65, 66, 68, 69, 70, 72, 74, 75, 76, 77, 78, 80, 81, 82, 84, 85, 86, 87, 88, 90, 91, 92, 93, 94, 95, 96, 98, 99, 100, 102, 104, 105, 106, 108, 110, 111, 112, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 128, 129, 130, 132, 133, 134, 135, 136, 138, 140, 141, 142, 143, 144, 145, 147, 148, 150, 152, 153, 154, 155, 156, 159, 160, 161, 162, 164, 165, 168, 170, 171, 172, 174, 175, 176, 177, 180, 182, 183, 184, 185, 186, 187, 188, 189, 190, 192, 195, 196, 198, 200, 201, 203, 204, 205, 207, 208, 209, 210, 212, 213, 215, 216, 217, 220, 221, 222, 224, 225, 228, 230, 231, 232, 234, 235, 236, 238, 240, 242, 243, 244, 245, 246, 247, 248, 250, 252, 253, 255, 256, 258, 259, 260, 261, 264, 265, 266, 268, 270, 272, 273, 275, 276, 279, 280, 282, 284, 285, 286, 287, 288, 290, 294, 295, 296, 297, 299, 300, 301, 304, 305, 306, 308, 310, 312, 315, 318, 319, 320, 322, 323, 324, 325, 328, 329, 330, 333, 335, 336, 338, 340, 341, 342, 344, 345, 348, 350, 351, 352, 354, 355, 357, 360, 363, 364, 366, 368, 369, 370, 372, 374, 375, 376, 377, 378, 380, 384, 385, 387, 390, 391, 392, 396, 399, 400, 402, 403, 405, 406, 407, 408, 410, 414, 416, 418, 420, 423, 424, 425, 426, 429, 430, 432, 434, 435, 437, 440, 441, 442, 444, 448, 450, 451, 455, 456, 459, 460, 462, 464, 465, 468, 470, 472, 473, 475, 476, 477, 480, 481, 483, 484, 486, 488, 490, 492, 493, 494, 495, 496, 500, 504, 506, 507, 510, 512, 513, 516, 517, 518, 520, 522, 525, 527, 528, 530, 531, 532, 533, 536, 539, 540, 544, 546, 549, 550, 551, 552, 555, 558, 559, 560, 561, 564, 567, 568, 570, 572, 574, 575, 576, 578, 580, 585, 588, 589, 590, 592, 594, 595, 598, 600, 602, 603, 605, 608, 609, 610, 611, 612, 615, 616, 620, 621, 624, 627, 629, 630, 636, 637, 638, 639, 640, 644, 645, 646, 648, 650, 651, 656, 658, 660, 663, 665, 666, 667, 670, 672, 675, 676, 680, 682, 684, 686, 688, 690, 693, 696, 697, 700, 702, 703, 704, 705, 708, 710, 713, 714, 715, 720, 725, 726, 728, 729, 731, 732, 735, 736, 738, 740, 741, 742, 744, 748, 750, 752, 754, 756, 759, 760, 765, 768, 770, 774, 775, 777, 779, 780, 782, 783, 784, 792, 795, 798, 799, 800, 804, 805, 806, 810, 812, 814, 816, 817, 819, 820, 825, 828, 832, 833, 836, 837, 840, 845, 846, 847, 850, 851, 852, 855, 858, 860, 861, 864, 867, 868, 870, 874, 875, 880, 882, 884, 885, 888, 891, 893, 896, 897, 899, 900, 902, 903, 910, 912, 915, 918, 920, 924, 925, 928, 930, 931, 935, 936, 940, 943, 945, 946, 950, 952, 954, 957, 960, 962, 966, 968, 969, 972, 975, 980, 984, 986, 987, 988, 989, 990, 992, 999, 1000, 1001, 1005, 1007, 1008, 1012, 1014, 1015, 1020, 1023, 1025, 1026, 1029, 1032, 1034, 1035, 1036, 1040, 1044, 1045, 1050, 1053, 1054, 1056, 1060, 1062, 1064, 1065, 1066, 1071, 1073, 1075, 1078, 1080, 1081, 1085, 1088, 1089, 1092, 1098, 1100, 1102, 1104, 1105, 1107, 1110, 1113, 1116, 1118, 1120, 1122, 1125, 1127, 1128, 1131, 1134, 1140, 1144, 1147, 1148, 1150, 1152, 1155, 1160, 1161, 1166, 1170, 1173, 1175, 1176, 1178, 1180, 1183, 1184, 1188, 1189, 1190, 1196, 1197, 1200, 1204, 1206, 1209, 1210, 1215, 1216, 1218, 1219, 1220, 1221, 1222, 1224, 1225, 1230, 1232, 1235, 1239, 1240, 1242, 1247, 1248, 1250, 1254, 1258, 1260, 1265, 1269, 1271, 1272, 1274, 1275, 1276, 1278, 1280, 1281, 1287, 1288, 1290, 1292, 1295, 1296, 1300, 1302, 1305, 1309, 1311, 1312, 1316, 1320, 1323, 1325, 1326, 1330, 1332, 1333, 1334, 1340, 1344, 1350, 1352, 1353, 1360, 1363, 1364, 1365, 1368, 1372, 1375, 1376, 1377, 1378, 1380, 1386, 1392, 1394, 1395, 1400, 1404, 1406, 1407, 1408, 1410, 1416, 1419, 1420, 1421, 1425, 1426, 1428, 1430, 1431, 1435, 1440, 1443, 1449, 1450, 1452, 1456, 1457, 1458, 1462, 1463, 1464, 1470, 1472, 1476, 1479, 1480, 1482, 1484, 1485, 1488, 1495, 1496, 1500, 1504, 1505, 1508, 1512, 1517, 1518, 1519, 1520, 1521, 1530, 1536, 1537, 1539, 1540, 1547, 1548, 1550, 1551, 1554, 1558, 1560, 1564, 1566, 1568, 1573, 1575, 1581, 1584, 1590, 1591, 1593, 1595, 1596, 1598, 1599, 1600, 1608, 1610, 1612, 1615, 1617, 1620, 1624, 1625, 1628, 1632, 1634, 1638, 1640, 1643, 1645, 1650, 1652, 1653, 1656, 1664, 1665, 1666, 1672, 1674, 1677, 1680, 1683, 1690, 1692, 1694, 1696, 1700, 1701, 1702, 1704, 1705, 1708, 1710, 1711, 1715, 1716, 1720, 1722, 1725, 1728, 1729, 1734, 1736, 1739, 1740, 1748, 1749, 1750, 1755, 1760, 1763, 1764, 1767, 1768, 1770, 1771, 1776, 1782, 1785, 1786, 1792, 1794, 1798, 1800, 1802, 1804, 1806, 1813, 1815, 1820, 1824, 1827, 1829, 1830, 1833, 1836, 1840, 1845, 1848, 1850, 1855, 1856, 1859, 1860, 1862, 1863, 1870, 1872, 1875, 1876, 1880, 1881, 1886, 1887, 1888, 1890, 1892, 1900}
def imageId408 : ℕ := 1092
def row408 : MixedDag.Row := ⟨412, 1, 1, 475⟩
def source408 : Finset ℕ := {682, 1166, 1643}
def Check408 : Prop := (row408).source < 1209 ∧ 0 < (row408).mul ∧ 0 < (row408).div ∧ (∀ x ∈ source408, (row408).div ∣ x * (row408).mul) ∧ ArchiveScaling.image source408 (row408).mul (row408).div ⊆ target
instance : Decidable Check408 := by unfold Check408; infer_instance
theorem check408 : Check408 := by decide
theorem bound408 (h : Extended.Bound source408 1) : Extended.Bound (ArchiveScaling.image source408 (row408).mul (row408).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check408
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check408
#print axioms bound408
def imageId409 : ℕ := 1093
def row409 : MixedDag.Row := ⟨414, 1, 1, 434⟩
def source409 : Finset ℕ := {561, 850, 1650}
def Check409 : Prop := (row409).source < 1209 ∧ 0 < (row409).mul ∧ 0 < (row409).div ∧ (∀ x ∈ source409, (row409).div ∣ x * (row409).mul) ∧ ArchiveScaling.image source409 (row409).mul (row409).div ⊆ target
instance : Decidable Check409 := by unfold Check409; infer_instance
theorem check409 : Check409 := by decide
theorem bound409 (h : Extended.Bound source409 1) : Extended.Bound (ArchiveScaling.image source409 (row409).mul (row409).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check409
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check409
#print axioms bound409
def imageId410 : ℕ := 1094
def row410 : MixedDag.Row := ⟨415, 1, 1, 206⟩
def source410 : Finset ℕ := {812, 1596, 1653}
def Check410 : Prop := (row410).source < 1209 ∧ 0 < (row410).mul ∧ 0 < (row410).div ∧ (∀ x ∈ source410, (row410).div ∣ x * (row410).mul) ∧ ArchiveScaling.image source410 (row410).mul (row410).div ⊆ target
instance : Decidable Check410 := by unfold Check410; infer_instance
theorem check410 : Check410 := by decide
theorem bound410 (h : Extended.Bound source410 1) : Extended.Bound (ArchiveScaling.image source410 (row410).mul (row410).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check410
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check410
#print axioms bound410
def imageId411 : ℕ := 1095
def row411 : MixedDag.Row := ⟨417, 1, 1, 162⟩
def source411 : Finset ℕ := {510, 735, 1666}
def Check411 : Prop := (row411).source < 1209 ∧ 0 < (row411).mul ∧ 0 < (row411).div ∧ (∀ x ∈ source411, (row411).div ∣ x * (row411).mul) ∧ ArchiveScaling.image source411 (row411).mul (row411).div ⊆ target
instance : Decidable Check411 := by unfold Check411; infer_instance
theorem check411 : Check411 := by decide
theorem bound411 (h : Extended.Bound source411 1) : Extended.Bound (ArchiveScaling.image source411 (row411).mul (row411).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check411
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check411
#print axioms bound411
def imageId412 : ℕ := 1097
def row412 : MixedDag.Row := ⟨419, 1, 1, 299⟩
def source412 : Finset ℕ := {156, 172, 1677}
def Check412 : Prop := (row412).source < 1209 ∧ 0 < (row412).mul ∧ 0 < (row412).div ∧ (∀ x ∈ source412, (row412).div ∣ x * (row412).mul) ∧ ArchiveScaling.image source412 (row412).mul (row412).div ⊆ target
instance : Decidable Check412 := by unfold Check412; infer_instance
theorem check412 : Check412 := by decide
theorem bound412 (h : Extended.Bound source412 1) : Extended.Bound (ArchiveScaling.image source412 (row412).mul (row412).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check412
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check412
#print axioms bound412
def imageId413 : ℕ := 1098
def row413 : MixedDag.Row := ⟨420, 1, 1, 264⟩
def source413 : Finset ℕ := {455, 624, 1680}
def Check413 : Prop := (row413).source < 1209 ∧ 0 < (row413).mul ∧ 0 < (row413).div ∧ (∀ x ∈ source413, (row413).div ∣ x * (row413).mul) ∧ ArchiveScaling.image source413 (row413).mul (row413).div ⊆ target
instance : Decidable Check413 := by unfold Check413; infer_instance
theorem check413 : Check413 := by decide
theorem bound413 (h : Extended.Bound source413 1) : Extended.Bound (ArchiveScaling.image source413 (row413).mul (row413).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check413
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check413
#print axioms bound413
def imageId414 : ℕ := 1099
def row414 : MixedDag.Row := ⟨421, 1, 1, 475⟩
def source414 : Finset ℕ := {396, 517, 1692}
def Check414 : Prop := (row414).source < 1209 ∧ 0 < (row414).mul ∧ 0 < (row414).div ∧ (∀ x ∈ source414, (row414).div ∣ x * (row414).mul) ∧ ArchiveScaling.image source414 (row414).mul (row414).div ⊆ target
instance : Decidable Check414 := by unfold Check414; infer_instance
theorem check414 : Check414 := by decide
theorem bound414 (h : Extended.Bound source414 1) : Extended.Bound (ArchiveScaling.image source414 (row414).mul (row414).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check414
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check414
#print axioms bound414
def imageId415 : ℕ := 1100
def row415 : MixedDag.Row := ⟨422, 1, 1, 427⟩
def source415 : Finset ℕ := {672, 1113, 1696}
def Check415 : Prop := (row415).source < 1209 ∧ 0 < (row415).mul ∧ 0 < (row415).div ∧ (∀ x ∈ source415, (row415).div ∣ x * (row415).mul) ∧ ArchiveScaling.image source415 (row415).mul (row415).div ⊆ target
instance : Decidable Check415 := by unfold Check415; infer_instance
theorem check415 : Check415 := by decide
theorem bound415 (h : Extended.Bound source415 1) : Extended.Bound (ArchiveScaling.image source415 (row415).mul (row415).div) 1 := by
  obtain ⟨_, hm, hd, hex, _⟩ := check415
  exact ArchivePack.scaled_bound hm hd hex h
#print axioms check415
#print axioms bound415
end Node1209Rows051
