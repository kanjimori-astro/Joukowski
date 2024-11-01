program joukowski
implicit none

integer::i,j,k,l,imax,jmax,kmax
real(8)::xi_0,eta_0,psi,Gamma,xi,eta,f,df,alpha,beta,r,ximax,psi_target
real(8)::psi_pre,x_stream,y_stream,x_airfoil,y_airfoil,eta_stream
real(8),parameter::pi=acos(-1d0)

!input
!--------------------
xi_0  = -0.1 !xi_0/a
eta_0 = 0.25 !eta_0/a
alpha = 15   !Attack angle in degree
!--------------------

open(10,file='stream.dat' ) !Output file for streamlines
open(11,file='airfoil.dat') !Output file for the Joukowski airfoil

write(*,*) "# xi_0/a=",xi_0
write(*,*) "# eta_0/a=",eta_0
write(*,*) "# alpha [degree]=",alpha

alpha = pi*alpha/180d0
r     = sqrt((1d0-xi_0)**2d0+eta_0**2d0) !Radius of the circle on the zeta-plain
beta  = asin(eta_0/r)
Gamma = -4d0*pi*r*sin(alpha+beta)        !Circulation determined by Kutta's condition

ximax=10d0  !The calculated region is -ximax<xi/a<ximax 
imax=100
jmax=1000
kmax=10     !The number of streamlines is 2*kmax+1

!write(*,*) r,Gamma/4d0/pi

!Drawing streamlines
do k = -kmax,kmax
	psi_target = 0.5*k-Gamma/(2d0*pi)*log(r) !k=0 corresponds to the stagnation point
	write(10,*) "# psi=",psi_target
	write(10,*) "# k=",k
	
	xi = -ximax
	do i = -imax,imax
		xi  = xi+ximax/imax
		eta = -ximax*2d0
		do j = -jmax,jmax
			eta = eta+ximax*2d0/jmax
			psi = (1d0-r**2d0/(xi**2d0+eta**2d0))*(eta*cos(alpha)-xi*sin(alpha))&
			-Gamma/(2d0*pi)*log(sqrt(xi**2d0+eta**2d0))
			if ((psi_pre-psi_target)*(psi-psi_target)<0d0 .and. eta**2d0+xi**2d0>r**2d0) then
				eta_stream = eta
				!Joukowski-transforming streamlines on the zeta-plain to the z-plain
				call joukowski_transform(xi+xi_0,eta_stream+eta_0,x_stream,y_stream)
				if (j .ne. -jmax) exit
			end if
			psi_pre = psi
		end do
	write(10,*) x_stream,y_stream
!	write(10,*) xi,eta_stream
	end do
	write(10,*)
end do

!Joukowski transform for the airfoil
do i = -360,360
	call joukowski_transform(r*cos(i/180d0*pi)+xi_0,r*sin(i/180d0*pi)+eta_0,x_airfoil,y_airfoil)
	write(11,*) x_airfoil,y_airfoil
end do

close(10)
close(11)

contains

!Subroutine for the Joukowski transform
subroutine joukowski_transform(xi,eta,x,y)
	real(8),intent(in) ::xi,eta
	real(8),intent(out)::x,y
	x = xi *(1d0+1d0/(xi**2d0+eta**2d0))
	y = eta*(1d0-1d0/(xi**2d0+eta**2d0))
end subroutine

end program