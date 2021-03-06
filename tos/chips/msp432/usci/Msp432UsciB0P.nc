/*
 * DO NOT MODIFY: This file cloned from Msp432UsciZ9P.nc for B0
*/
configuration Msp432UsciB0P {
  provides {
    interface HplMsp432Usci    as Usci;
    interface HplMsp432UsciInt as Interrupt;
  }
}
implementation {
  components new HplMsp432UsciC((uint32_t) EUSCI_B0, EUSCIB0_IRQn, 1) as UsciC;
  Usci      = UsciC;

  components HplMsp432UsciIntB0P as IsrP;
  Interrupt = IsrP;
}
