function edit_click(input_id)
{
	document.getElementById(input_id).classList.remove('form-control-plaintext');
	document.getElementById(input_id).readOnly=false;
}