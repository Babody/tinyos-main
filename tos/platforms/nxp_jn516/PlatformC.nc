/**
 * Copyright (c) 2015, Technische Universitaet Berlin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 * - Neither the name of the Technische Universitaet Berlin nor the names
 *   of its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * @author Tim Bormann <code@tkn.tu-berlin.de>
 * @author Jasper Büsch <code@tkn.tu-berlin.de>
 */

configuration PlatformC
{
  provides interface Init;
}
implementation
{
  components PlatformP;
  Init = PlatformP;

  components Jn516TimerInitC;
  PlatformP.Jn516TimerInit -> Jn516TimerInitC;

  components Jn516WakeTimerInitC;
  PlatformP.Jn516WakeTimerInit -> Jn516WakeTimerInitC;

  components TinySchedulerC;
  PlatformP.Scheduler -> TinySchedulerC;

  components HplJn516UartC;
  PlatformP.Uart0Control -> HplJn516UartC.Uart0Control;
  PlatformP.Uart0Init -> HplJn516UartC.Uart0Init;

  components Jn516TimerP;
  PlatformP.Jn516Timer -> Jn516TimerP;

  components CounterMilli32C;
  PlatformP.CounterInit -> CounterMilli32C.Init;
}
