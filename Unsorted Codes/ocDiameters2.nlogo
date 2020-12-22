;; Creation of a single orbital plane

breed [
  planes plane
]

planes-own [
  mass
]

to setup
  clear-all
  set-default-shape planes "target"
  make-planes
  layout-circle planes (world-width / 2 - 1)
  ask planes [
    create-links-with other planes
  ]
  reset-ticks
end

to make-planes
  create-planes num-planes [
    set mass 1 + random 100
    set size 100 / num-planes
  ]
end

to go
  ask planes with [mass = 0] [
    set shape "dot"
    set color gray
  ]
  ask links with [[shape] of end1 = "dot" OR [shape] of end2 = "dot"] [
    die
  ]
  ask planes [
    if mass > 0 [
      if mass < sum [mass] of planes [
        exchange
      ]
    ]
  ]
  if any? planes with [mass = sum [mass] of planes] [
    ask planes with [mass = 0] [
      set shape "dot"
      set color gray
    ]
    ask links with [[shape] of end1 = "dot" OR [shape] of end2 = "dot"] [
      die
    ]
    stop
  ]
end

to exchange
  let i random num-planes
  if [mass] of plane i > 0 [
    ifelse random (mass + [mass] of plane i) < mass [
      set mass mass + 1
      ask plane i [
        set mass mass - 1
      ] ] [
      set mass mass - 1
      ask plane i [
        set mass mass + 1
      ]
    ]
  ]
end