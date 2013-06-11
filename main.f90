program main 

#define Vec integer(8)

  interface

    subroutine VecCreate(x, n)
      Vec :: x
      integer :: n
    end subroutine VecCreate

    subroutine VecSetValue(x, i, vec)
      Vec :: x
      integer :: i
      real(8) :: vec(*)
    end subroutine VecSetValue

    subroutine VecPrint(x)
      Vec :: x
    end subroutine VecPrint

    subroutine VecDestroy(x)
      Vec :: x
    end subroutine VecDestroy

  end interface

  Vec :: x
  integer :: n = 4
  integer :: i
  real(8) :: vec(4) = (/1.0_8,2.0_8,3.0_8,4.0_8/)

  call VecCreate(x, n)
  do i = 1, n
    call VecSetValue(x, i-1, vec(i))
  end do
  call VecPrint(x)
  vec = (/5.0_8, 6.0_8, 7.0_8, 8.0_8/)
  call VecPrint(x)
  call VecDestroy(x)

end program main 
