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



function deleteAlert() {
	Swal.fire({
		  title: '삭제하시겠습니까?',
		  text: "복구할수없습니다!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.value) {
		    Swal.fire(
		      '삭제!',
		      '삭제되었습니다.',
		      'success'
		    )
		  }
		})

}
