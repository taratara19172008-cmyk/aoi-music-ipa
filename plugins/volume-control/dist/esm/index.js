import { registerPlugin } from '@capacitor/core';
const VolumeControl = registerPlugin('VolumeControl', {
    web: () => Promise.resolve({ setVolume: () => Promise.resolve(), getVolume: () => Promise.resolve({ value: 0 }) }),
});
export * from './definitions';
export { VolumeControl };
