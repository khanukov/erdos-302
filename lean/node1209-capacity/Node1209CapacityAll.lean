import Node1209Capacity000
import Node1209Capacity001
import Node1209Capacity002
import Node1209Capacity003
import Node1209Capacity004
import Node1209Capacity005
import Node1209Capacity006
import Node1209Capacity007
import Node1209Capacity008
import Node1209Capacity009
import Node1209Capacity010
import Node1209Capacity011
import Node1209Capacity012
import Node1209Capacity013
import Node1209Capacity014
import Node1209Capacity015
import Node1209Capacity016
import Node1209Capacity017
import Node1209Capacity018
import Node1209Capacity019
import Node1209Capacity020
import Node1209Capacity021
import Node1209Capacity022
import Node1209Capacity023
import Node1209Capacity024
import Node1209Capacity025
import Node1209Capacity026
import Node1209Capacity027
import Node1209Capacity028
import Node1209Capacity029
import Node1209Capacity030
import Node1209Capacity031
import Node1209Capacity032
import Node1209Capacity033
import Node1209Capacity034
import Node1209Capacity035
import Node1209Capacity036
import Node1209Capacity037
import Node1209Capacity038
import Node1209Capacity039
import Node1209Capacity040
import Node1209Capacity041
import Node1209Capacity042
import Node1209Capacity043
import Node1209Capacity044
import Node1209Capacity045
import Node1209Capacity046
import Node1209Capacity047
import Node1209Capacity048
import Node1209Capacity049
import Node1209Capacity050
import Node1209Capacity051
import Node1209Capacity052
import Node1209Capacity053
import Node1209Capacity054
import Node1209Capacity055
import Node1209Capacity056
import Node1209Capacity057
import Node1209Capacity058
import Node1209Capacity059
import Node1209Capacity060
import Node1209Capacity061
import Node1209Capacity062
import Node1209Capacity063
import Node1209Capacity064
import Node1209Capacity065
import Node1209Capacity066
import Node1209Capacity067
import Node1209Capacity068
import Node1209Capacity069
import Node1209Capacity070
import Node1209Capacity071
import Node1209Capacity072
import Node1209Capacity073
import Node1209Capacity074
import Node1209Capacity075
import Node1209Capacity076
import Node1209Capacity077
import Node1209Capacity078
import Node1209Capacity079
import Node1209Capacity080
import Node1209Capacity081
import Node1209Capacity082
import Node1209Capacity083
import Node1209Capacity084
import Node1209Capacity085
import Node1209Capacity086
import Node1209Capacity087
import Node1209Capacity088
import Node1209Capacity089
import Node1209Capacity090
open Finset Node1209CapacityData
namespace Node1209CapacityAll
set_option maxRecDepth 65536
set_option maxHeartbeats 100000000
theorem coverage : target ⊆ (Node1209Capacity000.vertices ∪ (Node1209Capacity001.vertices ∪ (Node1209Capacity002.vertices ∪ (Node1209Capacity003.vertices ∪ (Node1209Capacity004.vertices ∪ (Node1209Capacity005.vertices ∪ (Node1209Capacity006.vertices ∪ (Node1209Capacity007.vertices ∪ (Node1209Capacity008.vertices ∪ (Node1209Capacity009.vertices ∪ (Node1209Capacity010.vertices ∪ (Node1209Capacity011.vertices ∪ (Node1209Capacity012.vertices ∪ (Node1209Capacity013.vertices ∪ (Node1209Capacity014.vertices ∪ (Node1209Capacity015.vertices ∪ (Node1209Capacity016.vertices ∪ (Node1209Capacity017.vertices ∪ (Node1209Capacity018.vertices ∪ (Node1209Capacity019.vertices ∪ (Node1209Capacity020.vertices ∪ (Node1209Capacity021.vertices ∪ (Node1209Capacity022.vertices ∪ (Node1209Capacity023.vertices ∪ (Node1209Capacity024.vertices ∪ (Node1209Capacity025.vertices ∪ (Node1209Capacity026.vertices ∪ (Node1209Capacity027.vertices ∪ (Node1209Capacity028.vertices ∪ (Node1209Capacity029.vertices ∪ (Node1209Capacity030.vertices ∪ (Node1209Capacity031.vertices ∪ (Node1209Capacity032.vertices ∪ (Node1209Capacity033.vertices ∪ (Node1209Capacity034.vertices ∪ (Node1209Capacity035.vertices ∪ (Node1209Capacity036.vertices ∪ (Node1209Capacity037.vertices ∪ (Node1209Capacity038.vertices ∪ (Node1209Capacity039.vertices ∪ (Node1209Capacity040.vertices ∪ (Node1209Capacity041.vertices ∪ (Node1209Capacity042.vertices ∪ (Node1209Capacity043.vertices ∪ (Node1209Capacity044.vertices ∪ (Node1209Capacity045.vertices ∪ (Node1209Capacity046.vertices ∪ (Node1209Capacity047.vertices ∪ (Node1209Capacity048.vertices ∪ (Node1209Capacity049.vertices ∪ (Node1209Capacity050.vertices ∪ (Node1209Capacity051.vertices ∪ (Node1209Capacity052.vertices ∪ (Node1209Capacity053.vertices ∪ (Node1209Capacity054.vertices ∪ (Node1209Capacity055.vertices ∪ (Node1209Capacity056.vertices ∪ (Node1209Capacity057.vertices ∪ (Node1209Capacity058.vertices ∪ (Node1209Capacity059.vertices ∪ (Node1209Capacity060.vertices ∪ (Node1209Capacity061.vertices ∪ (Node1209Capacity062.vertices ∪ (Node1209Capacity063.vertices ∪ (Node1209Capacity064.vertices ∪ (Node1209Capacity065.vertices ∪ (Node1209Capacity066.vertices ∪ (Node1209Capacity067.vertices ∪ (Node1209Capacity068.vertices ∪ (Node1209Capacity069.vertices ∪ (Node1209Capacity070.vertices ∪ (Node1209Capacity071.vertices ∪ (Node1209Capacity072.vertices ∪ (Node1209Capacity073.vertices ∪ (Node1209Capacity074.vertices ∪ (Node1209Capacity075.vertices ∪ (Node1209Capacity076.vertices ∪ (Node1209Capacity077.vertices ∪ (Node1209Capacity078.vertices ∪ (Node1209Capacity079.vertices ∪ (Node1209Capacity080.vertices ∪ (Node1209Capacity081.vertices ∪ (Node1209Capacity082.vertices ∪ (Node1209Capacity083.vertices ∪ (Node1209Capacity084.vertices ∪ (Node1209Capacity085.vertices ∪ (Node1209Capacity086.vertices ∪ (Node1209Capacity087.vertices ∪ (Node1209Capacity088.vertices ∪ (Node1209Capacity089.vertices ∪ (Node1209Capacity090.vertices))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) := by decide
theorem capacity : ∀ x ∈ target, load x ≤ 1001 := by
  intro x hx
  have h := coverage hx
  simp only [Finset.mem_union] at h
  rcases h with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9 | h10 | h11 | h12 | h13 | h14 | h15 | h16 | h17 | h18 | h19 | h20 | h21 | h22 | h23 | h24 | h25 | h26 | h27 | h28 | h29 | h30 | h31 | h32 | h33 | h34 | h35 | h36 | h37 | h38 | h39 | h40 | h41 | h42 | h43 | h44 | h45 | h46 | h47 | h48 | h49 | h50 | h51 | h52 | h53 | h54 | h55 | h56 | h57 | h58 | h59 | h60 | h61 | h62 | h63 | h64 | h65 | h66 | h67 | h68 | h69 | h70 | h71 | h72 | h73 | h74 | h75 | h76 | h77 | h78 | h79 | h80 | h81 | h82 | h83 | h84 | h85 | h86 | h87 | h88 | h89 | h90
  · exact Node1209Capacity000.capacity x h0
  · exact Node1209Capacity001.capacity x h1
  · exact Node1209Capacity002.capacity x h2
  · exact Node1209Capacity003.capacity x h3
  · exact Node1209Capacity004.capacity x h4
  · exact Node1209Capacity005.capacity x h5
  · exact Node1209Capacity006.capacity x h6
  · exact Node1209Capacity007.capacity x h7
  · exact Node1209Capacity008.capacity x h8
  · exact Node1209Capacity009.capacity x h9
  · exact Node1209Capacity010.capacity x h10
  · exact Node1209Capacity011.capacity x h11
  · exact Node1209Capacity012.capacity x h12
  · exact Node1209Capacity013.capacity x h13
  · exact Node1209Capacity014.capacity x h14
  · exact Node1209Capacity015.capacity x h15
  · exact Node1209Capacity016.capacity x h16
  · exact Node1209Capacity017.capacity x h17
  · exact Node1209Capacity018.capacity x h18
  · exact Node1209Capacity019.capacity x h19
  · exact Node1209Capacity020.capacity x h20
  · exact Node1209Capacity021.capacity x h21
  · exact Node1209Capacity022.capacity x h22
  · exact Node1209Capacity023.capacity x h23
  · exact Node1209Capacity024.capacity x h24
  · exact Node1209Capacity025.capacity x h25
  · exact Node1209Capacity026.capacity x h26
  · exact Node1209Capacity027.capacity x h27
  · exact Node1209Capacity028.capacity x h28
  · exact Node1209Capacity029.capacity x h29
  · exact Node1209Capacity030.capacity x h30
  · exact Node1209Capacity031.capacity x h31
  · exact Node1209Capacity032.capacity x h32
  · exact Node1209Capacity033.capacity x h33
  · exact Node1209Capacity034.capacity x h34
  · exact Node1209Capacity035.capacity x h35
  · exact Node1209Capacity036.capacity x h36
  · exact Node1209Capacity037.capacity x h37
  · exact Node1209Capacity038.capacity x h38
  · exact Node1209Capacity039.capacity x h39
  · exact Node1209Capacity040.capacity x h40
  · exact Node1209Capacity041.capacity x h41
  · exact Node1209Capacity042.capacity x h42
  · exact Node1209Capacity043.capacity x h43
  · exact Node1209Capacity044.capacity x h44
  · exact Node1209Capacity045.capacity x h45
  · exact Node1209Capacity046.capacity x h46
  · exact Node1209Capacity047.capacity x h47
  · exact Node1209Capacity048.capacity x h48
  · exact Node1209Capacity049.capacity x h49
  · exact Node1209Capacity050.capacity x h50
  · exact Node1209Capacity051.capacity x h51
  · exact Node1209Capacity052.capacity x h52
  · exact Node1209Capacity053.capacity x h53
  · exact Node1209Capacity054.capacity x h54
  · exact Node1209Capacity055.capacity x h55
  · exact Node1209Capacity056.capacity x h56
  · exact Node1209Capacity057.capacity x h57
  · exact Node1209Capacity058.capacity x h58
  · exact Node1209Capacity059.capacity x h59
  · exact Node1209Capacity060.capacity x h60
  · exact Node1209Capacity061.capacity x h61
  · exact Node1209Capacity062.capacity x h62
  · exact Node1209Capacity063.capacity x h63
  · exact Node1209Capacity064.capacity x h64
  · exact Node1209Capacity065.capacity x h65
  · exact Node1209Capacity066.capacity x h66
  · exact Node1209Capacity067.capacity x h67
  · exact Node1209Capacity068.capacity x h68
  · exact Node1209Capacity069.capacity x h69
  · exact Node1209Capacity070.capacity x h70
  · exact Node1209Capacity071.capacity x h71
  · exact Node1209Capacity072.capacity x h72
  · exact Node1209Capacity073.capacity x h73
  · exact Node1209Capacity074.capacity x h74
  · exact Node1209Capacity075.capacity x h75
  · exact Node1209Capacity076.capacity x h76
  · exact Node1209Capacity077.capacity x h77
  · exact Node1209Capacity078.capacity x h78
  · exact Node1209Capacity079.capacity x h79
  · exact Node1209Capacity080.capacity x h80
  · exact Node1209Capacity081.capacity x h81
  · exact Node1209Capacity082.capacity x h82
  · exact Node1209Capacity083.capacity x h83
  · exact Node1209Capacity084.capacity x h84
  · exact Node1209Capacity085.capacity x h85
  · exact Node1209Capacity086.capacity x h86
  · exact Node1209Capacity087.capacity x h87
  · exact Node1209Capacity088.capacity x h88
  · exact Node1209Capacity089.capacity x h89
  · exact Node1209Capacity090.capacity x h90
#print axioms coverage
#print axioms capacity
end Node1209CapacityAll
