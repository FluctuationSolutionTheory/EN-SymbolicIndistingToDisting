# README

## About
These Matlab scripts are used to obtain symbolic expressions for the thermodynamic constributions to the distinguishable ion-ion Kirkwood-Buff integrals (KBIs) as linear combinations of indistinguishable ion KBIs.
For the common ion case, the provided Matlab script ```CommonAnion.m``` symbolically inverts the 6×6 matrix formed from the three electroneutrality plus three indistinguishable ion KBI equations
to provide expressions for the six distinguishable ion-ion KBIs in terms of the three indistinguishable ion KBIs. The example code is setup for I = 1.5 M CaCl<sub>2</sub> + 0.5 M NaCl (*aq*) but could easily be setup for other 
common anion or common cation systems. For example, to setup the code instead for the common cation case, simply perform the following index changes to the provided common anion code: + will become –, 
+' will become –', and – will become +. Likewise, ```Binary.m``` symbolically inverts the 10×10 matrix formed from the four electroneutrality plus six indistinguishable ion KBI equations applicable to a binary salt 
mixture of I and I' to provide expressions for the ten distinguishable ion-ion KBIs in terms of six indistinguishable ion KBIs. For both Matlab scripts, the number of ions of each type 
is used as input, but molarities could be used instead. The other input required is the formal charge on the ions in the system. If the results are desired for any composition, ```f``` can be kept as a symbolic variable 
instead of being evaluated numerically. For more information, see our article, referenced below.

## Example Usage
```matlab -nodisplay -nosplash -nodesktop -r "run('CommonAnion.m');exit;" >& myCommonAnion.out```

```matlab -nodisplay -nosplash -nodesktop -r "run('Binary.m');exit;" >& myBinary.out```

## Reference
E.A. Ploetz, N.D. Smyers, and P.E. Smith, "Ion-Ion Association in Bulk Mixed Electrolytes Using Global and Local Electroneutrality Constraints"
Journal of Physical Chemistry B, In Revision.

## Maintainer
[@FluctuationSolutionTheory](https://github.com/FluctuationSolutionTheory)

## License
AGPL-v3.0 © 2024 [Elizabeth A. Ploetz and Paul E. Smith]

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program (see LICENSE file).
