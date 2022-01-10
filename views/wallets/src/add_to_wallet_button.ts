import platform from 'platform'
import { Plugin, UpgradedElement, WalletType } from './types'

function determineWalletType(): WalletType {
  if (platform!.os!.family == 'Android') {
    return WalletType.GooglePay
  } else if (platform.name == 'Safari') {
    return WalletType.AppleWallet
  }

  return WalletType.Unsupported
}

export default class AddToWalletButton implements Plugin {
  private element: UpgradedElement
  private _walletType: WalletType

  constructor(element: HTMLElement) {
    this.element = element as UpgradedElement
    this._walletType = determineWalletType()

    this.upgradeElement()
  }

  get walletType(): WalletType {
    return this._walletType
  }

  get locale(): string {
    return this.element.dataset.locale!
  }

  private async upgradeElement() {
    // TODO: replace with strategy/factory
    if (this.walletType == WalletType.AppleWallet) {
      // TODO: Apple Wallet
    } else if (this.walletType == WalletType.GooglePay) {
      // TODO: Google Pay
    } else {
      // uh oh
    }
  }
}
