# Joukowski
The code performs the Joukowski transformation of a circle and calculates streamlines around a Joukowski airfoil.

# Introduction
It is well known that two-dimensional potential flows of ideal fluid can be described by regular complex functions [e.g. 1]. For example, a flow around a circle on the $\zeta$-plain with the radius $r$ and the ciculation $\Gamma$ is described by a complex potential

$$W(\zeta)=U_0\left(\zeta e^{-i\alpha}+\frac{r^2}{\zeta}e^{i\alpha}\right)-i\frac{\Gamma}{2\pi}\log\zeta,$$

where $U_0$ is the velocity at the infinity and $\alpha$ is the angle of attack. Here the center of the circle is assumed to be located at the origin, and if the center is at $\zeta_0=\xi_0+i\eta_0$, $\zeta$ should be replaced by $\zeta-\zeta_0$. The stream function at $\zeta=\xi+i\eta$ is then given as

$$\psi(\zeta)=\Im W(\zeta)=U_0\left(1-\frac{r^2}{\xi^2+\eta^2}(\eta\cos\alpha-\xi\sin\alpha)\right)-\frac{\Gamma}{2\pi}\log(\sqrt{\xi^2+\eta^2})$$

Streamlines can be obtained by drawing coutours of $\psi(\zeta)$.

Joukowski airfoils are a class of airfoils that can be obtained from the Joukowski transformation of the circle. The Joukowski transformation from the $\zeta$- to the $z$-plain is defined as

$z=\zeta+\frac{a^2}{\zeta},$

where $a$ is a real parameter. Streamlines around the airfoil are also obtained by transforming the streamlines on the $\zeta$-plain. In order to satisfy Kutta's condition, which demands that a stagnation point be located at the trailing edge, the circulation should be $\Gamma=-4\pi rU_0\sin(\alpha+\beta)$, where $\sin\beta=\eta_0/r$. It follows from the Kutta-Joukowski theorem that the lift is given by $L=-\rho U_0L$. 

# What the code can do

The code can calculate a Joukowski airfoil and streamlines that satisfy Kutta's condition. An example with $\xi_0/a=-0.1$, $\eta_0/a=0.25$, and $\alpha=15^\circ$ is shown in the figure below. The airfoil is output in airfoil.dat and the streamlines are output in stream.dat.

![joukowski](https://github.com/user-attachments/assets/4ba5e0b5-be19-45ff-bad7-663b0c5807f7)

# Reference:
[1] 太田有・藤澤信道 (2020), 『流体の力学』, 共立出版.
