<?php 
    headerTienda($data);
?>
<script>
  document.querySelector('header').classList.add('header-v4');
</script>
<div class="container text-center">
	<main class="app-content">
      <div class="page-error tile">
        <?= $data['page']['Pag_Contenido']; ?>
        <p><a class="btn btn-dark" href="javascript:window.history.back();">Regresar</a></p>
      </div>
    </main>
</div>
<?php footerTienda($data); ?>

