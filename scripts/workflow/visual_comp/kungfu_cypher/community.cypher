// call LPA to assign community label
CALL gds.labelPropagation.write(
  'community',
  {
    relationshipWeightProperty: 'weight',
    maxIterations: 10,
    writeProperty: 'community'
  }
)