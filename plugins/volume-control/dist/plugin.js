var capacitorVolumeControlAoi = (function (exports, core) {
    'use strict';
    const VolumeControl = core.registerPlugin('VolumeControl', {
        web: () => Promise.resolve({ setVolume: () => Promise.resolve(), getVolume: () => Promise.resolve({ value: 0 }) }),
    });
    exports.VolumeControl = VolumeControl;
    return exports;
})({}, capacitorExports);
