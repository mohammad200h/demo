
"use strict";

let ListNamedTrajectories = require('./ListNamedTrajectories.js')
let ForceController = require('./ForceController.js')
let ExecutePlannedTrajectory = require('./ExecutePlannedTrajectory.js')
let PlanNamedTrajectory = require('./PlanNamedTrajectory.js')
let PlanTrajectoryFromPrefix = require('./PlanTrajectoryFromPrefix.js')
let ChangeControlType = require('./ChangeControlType.js')
let NullifyDemand = require('./NullifyDemand.js')
let SetPidGains = require('./SetPidGains.js')
let SetEffortControllerGains = require('./SetEffortControllerGains.js')
let GetFastGraspFromBoundingBox = require('./GetFastGraspFromBoundingBox.js')
let GetSegmentedLine = require('./GetSegmentedLine.js')
let SetDebugData = require('./SetDebugData.js')
let RobotTeachMode = require('./RobotTeachMode.js')
let SetMixedPositionVelocityPidGains = require('./SetMixedPositionVelocityPidGains.js')
let SetImuScale = require('./SetImuScale.js')
let which_fingers_are_touching = require('./which_fingers_are_touching.js')
let PlanTrajectoryFromList = require('./PlanTrajectoryFromList.js')
let ChangeMotorSystemControls = require('./ChangeMotorSystemControls.js')
let ManualSelfTest = require('./ManualSelfTest.js')
let is_hand_occupied = require('./is_hand_occupied.js')
let SetTeachMode = require('./SetTeachMode.js')
let SimpleMotorFlasher = require('./SimpleMotorFlasher.js')

module.exports = {
  ListNamedTrajectories: ListNamedTrajectories,
  ForceController: ForceController,
  ExecutePlannedTrajectory: ExecutePlannedTrajectory,
  PlanNamedTrajectory: PlanNamedTrajectory,
  PlanTrajectoryFromPrefix: PlanTrajectoryFromPrefix,
  ChangeControlType: ChangeControlType,
  NullifyDemand: NullifyDemand,
  SetPidGains: SetPidGains,
  SetEffortControllerGains: SetEffortControllerGains,
  GetFastGraspFromBoundingBox: GetFastGraspFromBoundingBox,
  GetSegmentedLine: GetSegmentedLine,
  SetDebugData: SetDebugData,
  RobotTeachMode: RobotTeachMode,
  SetMixedPositionVelocityPidGains: SetMixedPositionVelocityPidGains,
  SetImuScale: SetImuScale,
  which_fingers_are_touching: which_fingers_are_touching,
  PlanTrajectoryFromList: PlanTrajectoryFromList,
  ChangeMotorSystemControls: ChangeMotorSystemControls,
  ManualSelfTest: ManualSelfTest,
  is_hand_occupied: is_hand_occupied,
  SetTeachMode: SetTeachMode,
  SimpleMotorFlasher: SimpleMotorFlasher,
};
