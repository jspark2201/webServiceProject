function logoutAlert() {
			setTimeout( 'goIndex()', 2000 )
			const Toast = Swal.mixin({
				  toast: true,
				  position: 'top-end',
				  showConfirmButton: false,
				  timer: 2000,
				  timerProgressBar: true,
				  onOpen: (toast) => {
				    toast.addEventListener('mouseenter', Swal.stopTimer)
				    toast.addEventListener('mouseleave', Swal.resumeTimer)
				  }
				})
				Toast.fire({
				  icon: 'success',
				  title: '로그아웃 합니다.',
				})
				
		}
		function goIndex(){
			location.href="index.html"
		}