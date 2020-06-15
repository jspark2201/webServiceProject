function finAlert(){
			Swal.fire({
				  title: '모집완료 하시겠습니까?',
				  text: "취소 불가능합니다!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
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


