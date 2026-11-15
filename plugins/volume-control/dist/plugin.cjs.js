'use strict';
const core = require('@capacitor/core');
const VolumeControl = core.registerPlugin('VolumeControl', {
    web: () => Promise.resolve({ setVolume: () => Promise.resolve(), getVolume: () => Promise.resolve({ value: 0 }) }),
});
exports.VolumeControl = VolumeControl;
