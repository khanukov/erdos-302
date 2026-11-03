import ActualPrefix256Checks0
import ActualPrefix256Checks1
import ActualPrefix256Checks2
import ActualPrefix256Checks3
import ActualPrefix256Checks4
import ActualPrefix256Checks5
import ActualPrefix256Checks6
import ActualPrefix256Checks7
import ActualPrefix256Checks8
import ActualPrefix256Checks9
import ActualPrefix256Checks10
import ActualPrefix256Checks11
import ActualPrefix256Checks12
import ActualPrefix256Checks13
import ActualPrefix256Checks14
import ActualPrefix256Checks15

namespace ActualPrefix256
open ActualPrefix256Data MixedCaseTrimCandidate
set_option maxHeartbeats 4000000 in
theorem checked : ∀ i < 256, MixedDag.Check extraCheck nodes i := by
  intro i hi
  interval_cases i <;> first | exact check0 | exact check1 | exact check2 | exact check3 | exact check4 | exact check5 | exact check6 | exact check7 | exact check8 | exact check9 | exact check10 | exact check11 | exact check12 | exact check13 | exact check14 | exact check15 | exact check16 | exact check17 | exact check18 | exact check19 | exact check20 | exact check21 | exact check22 | exact check23 | exact check24 | exact check25 | exact check26 | exact check27 | exact check28 | exact check29 | exact check30 | exact check31 | exact check32 | exact check33 | exact check34 | exact check35 | exact check36 | exact check37 | exact check38 | exact check39 | exact check40 | exact check41 | exact check42 | exact check43 | exact check44 | exact check45 | exact check46 | exact check47 | exact check48 | exact check49 | exact check50 | exact check51 | exact check52 | exact check53 | exact check54 | exact check55 | exact check56 | exact check57 | exact check58 | exact check59 | exact check60 | exact check61 | exact check62 | exact check63 | exact check64 | exact check65 | exact check66 | exact check67 | exact check68 | exact check69 | exact check70 | exact check71 | exact check72 | exact check73 | exact check74 | exact check75 | exact check76 | exact check77 | exact check78 | exact check79 | exact check80 | exact check81 | exact check82 | exact check83 | exact check84 | exact check85 | exact check86 | exact check87 | exact check88 | exact check89 | exact check90 | exact check91 | exact check92 | exact check93 | exact check94 | exact check95 | exact check96 | exact check97 | exact check98 | exact check99 | exact check100 | exact check101 | exact check102 | exact check103 | exact check104 | exact check105 | exact check106 | exact check107 | exact check108 | exact check109 | exact check110 | exact check111 | exact check112 | exact check113 | exact check114 | exact check115 | exact check116 | exact check117 | exact check118 | exact check119 | exact check120 | exact check121 | exact check122 | exact check123 | exact check124 | exact check125 | exact check126 | exact check127 | exact check128 | exact check129 | exact check130 | exact check131 | exact check132 | exact check133 | exact check134 | exact check135 | exact check136 | exact check137 | exact check138 | exact check139 | exact check140 | exact check141 | exact check142 | exact check143 | exact check144 | exact check145 | exact check146 | exact check147 | exact check148 | exact check149 | exact check150 | exact check151 | exact check152 | exact check153 | exact check154 | exact check155 | exact check156 | exact check157 | exact check158 | exact check159 | exact check160 | exact check161 | exact check162 | exact check163 | exact check164 | exact check165 | exact check166 | exact check167 | exact check168 | exact check169 | exact check170 | exact check171 | exact check172 | exact check173 | exact check174 | exact check175 | exact check176 | exact check177 | exact check178 | exact check179 | exact check180 | exact check181 | exact check182 | exact check183 | exact check184 | exact check185 | exact check186 | exact check187 | exact check188 | exact check189 | exact check190 | exact check191 | exact check192 | exact check193 | exact check194 | exact check195 | exact check196 | exact check197 | exact check198 | exact check199 | exact check200 | exact check201 | exact check202 | exact check203 | exact check204 | exact check205 | exact check206 | exact check207 | exact check208 | exact check209 | exact check210 | exact check211 | exact check212 | exact check213 | exact check214 | exact check215 | exact check216 | exact check217 | exact check218 | exact check219 | exact check220 | exact check221 | exact check222 | exact check223 | exact check224 | exact check225 | exact check226 | exact check227 | exact check228 | exact check229 | exact check230 | exact check231 | exact check232 | exact check233 | exact check234 | exact check235 | exact check236 | exact check237 | exact check238 | exact check239 | exact check240 | exact check241 | exact check242 | exact check243 | exact check244 | exact check245 | exact check246 | exact check247 | exact check248 | exact check249 | exact check250 | exact check251 | exact check252 | exact check253 | exact check254 | exact check255
theorem sound : ∀ i < 256, Extended.Bound (nodes i).support (nodes i).demand :=
  MixedCaseTrimCandidate.sound nodes 256 checked
#print axioms checked
#print axioms sound
end ActualPrefix256
