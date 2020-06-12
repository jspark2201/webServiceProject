function uploadAlert(){
			Swal.fire({
				  title: '게시하겠습니까?',
				  text: "외부 프로젝트는 완료상태로 게시만 가능합니다.",
				  icon: 'info',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '게시'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				      '완료!',
				      '모집완료하였습니다.',
				      'success'
				    )
				  }
			})
		}
