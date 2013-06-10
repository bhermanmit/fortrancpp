program testcode

#define Vec integer(8)

  integer veclen 
  real mat, dot
  real vec1(2), vec2(2)
  real matrix1(3,3), matrix2(3,3), matrix3(3,3)
  real(8) :: vec3(4) = (/1.0_8,2.0_8,3.0_8,4.0_8/)
  Vec :: x
  integer :: n = 4

! interface
!   function testdot(veclen, vec1, vec2)
!     integer :: veclen
!     real :: vec1(*)
!     real :: vec2(*)
!     real :: dot
!   end function testdot

!   subroutine vecsetvalues(x, n, vec)
!     Vec :: x
!     integer :: n
!     real(8)        :: vec(*)
!   end subroutine vecsetvalues
! end interface

  veclen = 2
  matdim = 3

  vec1(1) = 1.0
  vec1(2) = 2.0
  vec2(1) = 3.0
  vec2(2) = 4.0 

  matrix1(1,1) = 1.0
  matrix1(2,1) = 0.0
  matrix1(3,1) = 0.0
  matrix1(1,2) = 0.0
  matrix1(2,2) = 1.0
  matrix1(3,2) = 0.0
  matrix1(1,3) = 0.0
  matrix1(2,3) = 0.0
  matrix1(3,3) = 1.0

  matrix2(1,1) = 1.0
  matrix2(2,1) = 0.0
  matrix2(3,1) = 0.0
  matrix2(1,2) = 0.0
  matrix2(2,2) = 2.0
  matrix2(3,2) = 0.0
  matrix2(1,3) = 0.0
  matrix2(2,3) = 0.0
  matrix2(3,3) = 3.0

  mat = 0.0;

! mat should get incremented by 1 in testret 
  do i = 1, 10
     call testret(mat)
  end do

! testdot should return the dot product of vec1 and vec2 as a real
  dot = testdot(veclen, vec1, vec2)

! testmat uses matrix1 and matrix2 to calculate matrix3
  call testmat(matdim, matrix1, matrix2, matrix3)

  print *, mat, '  ', dot
  print *, 
  do i = 1, matdim
    write (6,*) (matrix3(j,i), j=1,matdim)
  end do

! set values to vector
  print *, n
  call vecsetvalues(x, n, vec3)
  call vecgetvalues(x, n)

end program testcode
