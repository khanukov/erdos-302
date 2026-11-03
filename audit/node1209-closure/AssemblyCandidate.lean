import Dense
import Node1209SourceCandidate

/- Candidate: the eight concrete checker obligations are explicit.  In particular,
   no bound, valid prefix, or archive provenance is assumed. -/
namespace MixedDag
/-- Bounded validity is precisely the premise consumed by `sound`. -/
def Valid {ε : Type} (extraCheck : (ℕ → Node ε) → ℕ → ε → Prop)
    (nodes : ℕ → Node ε) (count : ℕ) : Prop :=
  ∀ i < count, Check extraCheck nodes i
end MixedDag

namespace Node1209AssemblyCandidate
set_option maxRecDepth 100000
set_option maxHeartbeats 100000000

/-- The validity predicate is the exact bounded checker used by MixedDag.sound. -/
def Valid : Prop := MixedDag.Valid MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 376

theorem valid
    (h4 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 4)
    (h5 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 5)
    (h7 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 7)
    (h8 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8)
    (h14 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 14)
    (h15 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 15)
    (h374 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 374)
    (h375 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 375) : Valid := by
  intro i hi
  interval_cases i
  · exact Node1209Dense.check0
  · exact Node1209Dense.check1
  · exact Node1209Dense.check2
  · exact Node1209Dense.check3
  · exact h4
  · exact h5
  · exact Node1209Dense.check6
  · exact h7
  · exact h8
  · exact Node1209Dense.check9
  · exact Node1209Dense.check10
  · exact Node1209Dense.check11
  · exact Node1209Dense.check12
  · exact Node1209Dense.check13
  · exact h14
  · exact h15
  · exact Node1209Dense.check16
  · exact Node1209Dense.check17
  · exact Node1209Dense.check18
  · exact Node1209Dense.check19
  · exact Node1209Dense.check20
  · exact Node1209Dense.check21
  · exact Node1209Dense.check22
  · exact Node1209Dense.check23
  · exact Node1209Dense.check24
  · exact Node1209Dense.check25
  · exact Node1209Dense.check26
  · exact Node1209Dense.check27
  · exact Node1209Dense.check28
  · exact Node1209Dense.check29
  · exact Node1209Dense.check30
  · exact Node1209Dense.check31
  · exact Node1209Dense.check32
  · exact Node1209Dense.check33
  · exact Node1209Dense.check34
  · exact Node1209Dense.check35
  · exact Node1209Dense.check36
  · exact Node1209Dense.check37
  · exact Node1209Dense.check38
  · exact Node1209Dense.check39
  · exact Node1209Dense.check40
  · exact Node1209Dense.check41
  · exact Node1209Dense.check42
  · exact Node1209Dense.check43
  · exact Node1209Dense.check44
  · exact Node1209Dense.check45
  · exact Node1209Dense.check46
  · exact Node1209Dense.check47
  · exact Node1209Dense.check48
  · exact Node1209Dense.check49
  · exact Node1209Dense.check50
  · exact Node1209Dense.check51
  · exact Node1209Dense.check52
  · exact Node1209Dense.check53
  · exact Node1209Dense.check54
  · exact Node1209Dense.check55
  · exact Node1209Dense.check56
  · exact Node1209Dense.check57
  · exact Node1209Dense.check58
  · exact Node1209Dense.check59
  · exact Node1209Dense.check60
  · exact Node1209Dense.check61
  · exact Node1209Dense.check62
  · exact Node1209Dense.check63
  · exact Node1209Dense.check64
  · exact Node1209Dense.check65
  · exact Node1209Dense.check66
  · exact Node1209Dense.check67
  · exact Node1209Dense.check68
  · exact Node1209Dense.check69
  · exact Node1209Dense.check70
  · exact Node1209Dense.check71
  · exact Node1209Dense.check72
  · exact Node1209Dense.check73
  · exact Node1209Dense.check74
  · exact Node1209Dense.check75
  · exact Node1209Dense.check76
  · exact Node1209Dense.check77
  · exact Node1209Dense.check78
  · exact Node1209Dense.check79
  · exact Node1209Dense.check80
  · exact Node1209Dense.check81
  · exact Node1209Dense.check82
  · exact Node1209Dense.check83
  · exact Node1209Dense.check84
  · exact Node1209Dense.check85
  · exact Node1209Dense.check86
  · exact Node1209Dense.check87
  · exact Node1209Dense.check88
  · exact Node1209Dense.check89
  · exact Node1209Dense.check90
  · exact Node1209Dense.check91
  · exact Node1209Dense.check92
  · exact Node1209Dense.check93
  · exact Node1209Dense.check94
  · exact Node1209Dense.check95
  · exact Node1209Dense.check96
  · exact Node1209Dense.check97
  · exact Node1209Dense.check98
  · exact Node1209Dense.check99
  · exact Node1209Dense.check100
  · exact Node1209Dense.check101
  · exact Node1209Dense.check102
  · exact Node1209Dense.check103
  · exact Node1209Dense.check104
  · exact Node1209Dense.check105
  · exact Node1209Dense.check106
  · exact Node1209Dense.check107
  · exact Node1209Dense.check108
  · exact Node1209Dense.check109
  · exact Node1209Dense.check110
  · exact Node1209Dense.check111
  · exact Node1209Dense.check112
  · exact Node1209Dense.check113
  · exact Node1209Dense.check114
  · exact Node1209Dense.check115
  · exact Node1209Dense.check116
  · exact Node1209Dense.check117
  · exact Node1209Dense.check118
  · exact Node1209Dense.check119
  · exact Node1209Dense.check120
  · exact Node1209Dense.check121
  · exact Node1209Dense.check122
  · exact Node1209Dense.check123
  · exact Node1209Dense.check124
  · exact Node1209Dense.check125
  · exact Node1209Dense.check126
  · exact Node1209Dense.check127
  · exact Node1209Dense.check128
  · exact Node1209Dense.check129
  · exact Node1209Dense.check130
  · exact Node1209Dense.check131
  · exact Node1209Dense.check132
  · exact Node1209Dense.check133
  · exact Node1209Dense.check134
  · exact Node1209Dense.check135
  · exact Node1209Dense.check136
  · exact Node1209Dense.check137
  · exact Node1209Dense.check138
  · exact Node1209Dense.check139
  · exact Node1209Dense.check140
  · exact Node1209Dense.check141
  · exact Node1209Dense.check142
  · exact Node1209Dense.check143
  · exact Node1209Dense.check144
  · exact Node1209Dense.check145
  · exact Node1209Dense.check146
  · exact Node1209Dense.check147
  · exact Node1209Dense.check148
  · exact Node1209Dense.check149
  · exact Node1209Dense.check150
  · exact Node1209Dense.check151
  · exact Node1209Dense.check152
  · exact Node1209Dense.check153
  · exact Node1209Dense.check154
  · exact Node1209Dense.check155
  · exact Node1209Dense.check156
  · exact Node1209Dense.check157
  · exact Node1209Dense.check158
  · exact Node1209Dense.check159
  · exact Node1209Dense.check160
  · exact Node1209Dense.check161
  · exact Node1209Dense.check162
  · exact Node1209Dense.check163
  · exact Node1209Dense.check164
  · exact Node1209Dense.check165
  · exact Node1209Dense.check166
  · exact Node1209Dense.check167
  · exact Node1209Dense.check168
  · exact Node1209Dense.check169
  · exact Node1209Dense.check170
  · exact Node1209Dense.check171
  · exact Node1209Dense.check172
  · exact Node1209Dense.check173
  · exact Node1209Dense.check174
  · exact Node1209Dense.check175
  · exact Node1209Dense.check176
  · exact Node1209Dense.check177
  · exact Node1209Dense.check178
  · exact Node1209Dense.check179
  · exact Node1209Dense.check180
  · exact Node1209Dense.check181
  · exact Node1209Dense.check182
  · exact Node1209Dense.check183
  · exact Node1209Dense.check184
  · exact Node1209Dense.check185
  · exact Node1209Dense.check186
  · exact Node1209Dense.check187
  · exact Node1209Dense.check188
  · exact Node1209Dense.check189
  · exact Node1209Dense.check190
  · exact Node1209Dense.check191
  · exact Node1209Dense.check192
  · exact Node1209Dense.check193
  · exact Node1209Dense.check194
  · exact Node1209Dense.check195
  · exact Node1209Dense.check196
  · exact Node1209Dense.check197
  · exact Node1209Dense.check198
  · exact Node1209Dense.check199
  · exact Node1209Dense.check200
  · exact Node1209Dense.check201
  · exact Node1209Dense.check202
  · exact Node1209Dense.check203
  · exact Node1209Dense.check204
  · exact Node1209Dense.check205
  · exact Node1209Dense.check206
  · exact Node1209Dense.check207
  · exact Node1209Dense.check208
  · exact Node1209Dense.check209
  · exact Node1209Dense.check210
  · exact Node1209Dense.check211
  · exact Node1209Dense.check212
  · exact Node1209Dense.check213
  · exact Node1209Dense.check214
  · exact Node1209Dense.check215
  · exact Node1209Dense.check216
  · exact Node1209Dense.check217
  · exact Node1209Dense.check218
  · exact Node1209Dense.check219
  · exact Node1209Dense.check220
  · exact Node1209Dense.check221
  · exact Node1209Dense.check222
  · exact Node1209Dense.check223
  · exact Node1209Dense.check224
  · exact Node1209Dense.check225
  · exact Node1209Dense.check226
  · exact Node1209Dense.check227
  · exact Node1209Dense.check228
  · exact Node1209Dense.check229
  · exact Node1209Dense.check230
  · exact Node1209Dense.check231
  · exact Node1209Dense.check232
  · exact Node1209Dense.check233
  · exact Node1209Dense.check234
  · exact Node1209Dense.check235
  · exact Node1209Dense.check236
  · exact Node1209Dense.check237
  · exact Node1209Dense.check238
  · exact Node1209Dense.check239
  · exact Node1209Dense.check240
  · exact Node1209Dense.check241
  · exact Node1209Dense.check242
  · exact Node1209Dense.check243
  · exact Node1209Dense.check244
  · exact Node1209Dense.check245
  · exact Node1209Dense.check246
  · exact Node1209Dense.check247
  · exact Node1209Dense.check248
  · exact Node1209Dense.check249
  · exact Node1209Dense.check250
  · exact Node1209Dense.check251
  · exact Node1209Dense.check252
  · exact Node1209Dense.check253
  · exact Node1209Dense.check254
  · exact Node1209Dense.check255
  · exact Node1209Dense.check256
  · exact Node1209Dense.check257
  · exact Node1209Dense.check258
  · exact Node1209Dense.check259
  · exact Node1209Dense.check260
  · exact Node1209Dense.check261
  · exact Node1209Dense.check262
  · exact Node1209Dense.check263
  · exact Node1209Dense.check264
  · exact Node1209Dense.check265
  · exact Node1209Dense.check266
  · exact Node1209Dense.check267
  · exact Node1209Dense.check268
  · exact Node1209Dense.check269
  · exact Node1209Dense.check270
  · exact Node1209Dense.check271
  · exact Node1209Dense.check272
  · exact Node1209Dense.check273
  · exact Node1209Dense.check274
  · exact Node1209Dense.check275
  · exact Node1209Dense.check276
  · exact Node1209Dense.check277
  · exact Node1209Dense.check278
  · exact Node1209Dense.check279
  · exact Node1209Dense.check280
  · exact Node1209Dense.check281
  · exact Node1209Dense.check282
  · exact Node1209Dense.check283
  · exact Node1209Dense.check284
  · exact Node1209Dense.check285
  · exact Node1209Dense.check286
  · exact Node1209Dense.check287
  · exact Node1209Dense.check288
  · exact Node1209Dense.check289
  · exact Node1209Dense.check290
  · exact Node1209Dense.check291
  · exact Node1209Dense.check292
  · exact Node1209Dense.check293
  · exact Node1209Dense.check294
  · exact Node1209Dense.check295
  · exact Node1209Dense.check296
  · exact Node1209Dense.check297
  · exact Node1209Dense.check298
  · exact Node1209Dense.check299
  · exact Node1209Dense.check300
  · exact Node1209Dense.check301
  · exact Node1209Dense.check302
  · exact Node1209Dense.check303
  · exact Node1209Dense.check304
  · exact Node1209Dense.check305
  · exact Node1209Dense.check306
  · exact Node1209Dense.check307
  · exact Node1209Dense.check308
  · exact Node1209Dense.check309
  · exact Node1209Dense.check310
  · exact Node1209Dense.check311
  · exact Node1209Dense.check312
  · exact Node1209Dense.check313
  · exact Node1209Dense.check314
  · exact Node1209Dense.check315
  · exact Node1209Dense.check316
  · exact Node1209Dense.check317
  · exact Node1209Dense.check318
  · exact Node1209Dense.check319
  · exact Node1209Dense.check320
  · exact Node1209Dense.check321
  · exact Node1209Dense.check322
  · exact Node1209Dense.check323
  · exact Node1209Dense.check324
  · exact Node1209Dense.check325
  · exact Node1209Dense.check326
  · exact Node1209Dense.check327
  · exact Node1209Dense.check328
  · exact Node1209Dense.check329
  · exact Node1209Dense.check330
  · exact Node1209Dense.check331
  · exact Node1209Dense.check332
  · exact Node1209Dense.check333
  · exact Node1209Dense.check334
  · exact Node1209Dense.check335
  · exact Node1209Dense.check336
  · exact Node1209Dense.check337
  · exact Node1209Dense.check338
  · exact Node1209Dense.check339
  · exact Node1209Dense.check340
  · exact Node1209Dense.check341
  · exact Node1209Dense.check342
  · exact Node1209Dense.check343
  · exact Node1209Dense.check344
  · exact Node1209Dense.check345
  · exact Node1209Dense.check346
  · exact Node1209Dense.check347
  · exact Node1209Dense.check348
  · exact Node1209Dense.check349
  · exact Node1209Dense.check350
  · exact Node1209Dense.check351
  · exact Node1209Dense.check352
  · exact Node1209Dense.check353
  · exact Node1209Dense.check354
  · exact Node1209Dense.check355
  · exact Node1209Dense.check356
  · exact Node1209Dense.check357
  · exact Node1209Dense.check358
  · exact Node1209Dense.check359
  · exact Node1209Dense.check360
  · exact Node1209Dense.check361
  · exact Node1209Dense.check362
  · exact Node1209Dense.check363
  · exact Node1209Dense.check364
  · exact Node1209Dense.check365
  · exact Node1209Dense.check366
  · exact Node1209Dense.check367
  · exact Node1209Dense.check368
  · exact Node1209Dense.check369
  · exact Node1209Dense.check370
  · exact Node1209Dense.check371
  · exact Node1209Dense.check372
  · exact Node1209Dense.check373
  · exact h374
  · exact h375

theorem source_bound
    (h4 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 4)
    (h5 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 5)
    (h7 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 7)
    (h8 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8)
    (h14 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 14)
    (h15 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 15)
    (h374 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 374)
    (h375 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 375) : Extended.Bound ExtensionFirstArchive.source 258 := by
  have hv := valid h4 h5 h7 h8 h14 h15 h374 h375
  have hb := MixedCaseTrimCandidate.sound Node1209Dense.nodes 376 hv 375 (by decide)
  change Extended.Bound Node1209SourceCandidate.node.support
    Node1209SourceCandidate.node.demand at hb
  rw [Node1209SourceCandidate.support_identity,
    Node1209SourceCandidate.demand_identity] at hb
  exact hb

theorem target_bound
    (h4 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 4)
    (h5 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 5)
    (h7 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 7)
    (h8 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 8)
    (h14 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 14)
    (h15 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 15)
    (h374 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 374)
    (h375 : MixedDag.Check MixedCaseTrimCandidate.extraCheck Node1209Dense.nodes 375) : Extended.Bound ExtensionFirstArchive.target 242 :=
  FirstExtensionBridge.target_bound (source_bound h4 h5 h7 h8 h14 h15 h374 h375)

#print axioms valid
#print axioms source_bound
#print axioms target_bound
end Node1209AssemblyCandidate
