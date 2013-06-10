program main 

#define Vec integer(8)

  Vec :: x
  integer :: n = 4
  integer :: i
  real(8) :: vec(4) = (/1.0_8,2.0_8,3.0_8,4.0_8/)

  call VecCreate(x, n)
  do i = 1, n
    call VecSetValue(x, i-1, vec(i))
  end do
  call VecPrint(x, n)
  call VecDestroy(x)

end program main 