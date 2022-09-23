import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'compound' : () => Promise<undefined>,
  'gerCurrentValue' : () => Promise<number>,
  'topUp' : (arg_0: number) => Promise<undefined>,
  'withdraw' : (arg_0: number) => Promise<undefined>,
}
