program fortrancpp

  ! program options
  implicit none

  ! define explicit interfaces
  interface
    subroutine change_data (npts, vec) bind (c)
      use iso_c_binding
      integer(c_int), VALUE :: npts
      real(c_double) :: vec(*)
    end subroutine change_data
  end interface

  ! define variables
  integer :: npts
  real(8), allocatable :: vec(:)

  ! read in from user
  print *, 'How many data points to read in:'
  read *, npts

  ! allocate vector
  allocate(vec(npts))

  ! read in from user
  print *, 'Enter values of vector:'
  read *, vec

  ! call c++ program to multiply data by two
  call change_data(npts, vec)

  ! print results to user
  print *, 'After multiplying by 2'
  print *, vec

  ! deallocate vector
  deallocate(vec)

end program fortrancpp
