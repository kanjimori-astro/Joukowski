# Joukowski
The code performs the Joukowski transformation of a circle and calculates streamlines around a Joukowski airfoil.

# Introduction
It is well known that two-dimensional potential flows of ideal fluid can be described by regular complex functions. For example, a flow round a circle on the $\zeta$-plain with the radius $r$ and the ciculation $\Gamma$ is described by a complex potential

$$W(\zeta)=U_0\left(\zeta e^{-i\alpha}+\frac{r^2}{\zeta}e^{i\alpha}\right)-i\frac{\Gamma}{2\pi}\log\zeta,$$

where $U_0$ is the velocity at the infinity and $\alpha$ is the angle of attack. Here the center of the circle is assumed to be located at the origin, and if the center is at $\zeta_0=\xi_0+i\eta_0$, $\zeta$ should be replaced by $\zeta-\zeta_0$. The stream function at $\zeta=\xi+i\eta$ is then given as

$$\psi(\zeta)=\Im W(\zeta)=U_0\left(1-\frac{1}{\xi^2+\eta^2}(\eta\cos\alpha-\xi\sin\alpha)\right)-\frac{\Gamma}{2\pi}\log(\sqrt{\xi^2+\eta^2})$$

Joukowski airfoils are a class of airfoils that can be obtained from the Joukowski transform of the circle.
