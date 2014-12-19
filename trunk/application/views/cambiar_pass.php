<!--<form class="form-horizontal" name="formu" id="formu" method="post" action="<?php echo base_url()?>index.php/promocion/guardar_ingreso_promocion" autocomplete="off">
    <div class="form-group">
        <label for="correo" class="col-sm-3 control-label">Correo <span class="asterisk">*</span></label>
        <div class="col-sm-8">
            <input type="text" data-req="true" data-tip="cor" name="correo" id="correo" class="form-control" />
        </div>
    </div>
    <ul class="pager wizard">
        <li><button class="btn btn-success" type="submit" name="guardar" id="guardar"><span class="glyphicon glyphicon-send"></span> Enviar</button></li>
	</ul>    
</form>-->
<form role="form" id="feedbackForm">
 <img id="captcha" src="<?php echo base_url()?>/index.php/sessiones/capcha" alt="CAPTCHA Image" />
  <a href="#" onclick="document.getElementById('captcha').src = '<?php echo base_url()?>/index.php/sessiones/capcha'; return false" class="btn btn-info btn-sm">Show a Different Image</a><br/>
  <div class="form-group" style="margin-top: 10px;">
    <input type="text" class="form-control" name="captcha_code" id="captcha_code" placeholder="For security, please enter the code displayed in the box." />
    <span class="help-block" style="display: none;">Please enter the code displayed within the image.</span>
  </div>
  
  <span class="help-block" style="display: none;">Please enter a the security code.</span>
  <button type="submit" id="feedbackSubmit" class="btn btn-primary btn-lg" style="display: block; margin-top: 10px;">Send Feedback</button>
  </form>
  <script>
  $(document).ready(function() {
  $("#feedbackSubmit").click(function() {
        $.ajax({
            type: "POST",
            url: "<?php echo base_url()?>/index.php/sessiones/sendmail",
            data: $("#feedbackForm").serialize(),
            success: function(data) {
                alert(data.message);
            },
            error: function(response) {
                alert("no funciona!");
            }
        });
    return false;
  }); 
});
</script>