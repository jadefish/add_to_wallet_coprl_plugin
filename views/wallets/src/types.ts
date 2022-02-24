// TODO: move plugin and element types to a @coprl/types.d.ts package
export interface PluginConstructor {
  new(element: HTMLElement): Plugin
};
export interface Plugin {};
export type UpgradedElement = HTMLElement & { vComponent: any };

export enum WalletType {
  AppleWallet = 'apple_wallet',
  GooglePay = 'google_pay',
  Unsupported = 'unsupported'
};
