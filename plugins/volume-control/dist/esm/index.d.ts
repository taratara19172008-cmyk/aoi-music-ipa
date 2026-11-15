export interface VolumeControlPlugin {
    setVolume(options: { value: number }): Promise<void>;
    getVolume(): Promise<{ value: number }>;
}
declare const VolumeControl: VolumeControlPlugin;
export { VolumeControl };
