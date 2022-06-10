    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<?= media();?>/images/avatar.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><?= $_SESSION['userData']['Per_Nombres']; ?></p>
          <p class="app-sidebar__user-designation"><?= $_SESSION['userData']['Rol_Nombre']; ?></p>
        </div>
      </div>
      <ul class="app-menu">
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>" target="_blank">
                <i class="app-menu__icon fa fas fa-globe" aria-hidden="true"></i>
                <span class="app-menu__label">Ver sitio web</span>
            </a>
        </li>
        <?php if(!empty($_SESSION['permisos'][1]['Perm_read'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/dashboard">
                <i class="app-menu__icon fa fa-dashboard"></i>
                <span class="app-menu__label">Dashboard</span>
            </a>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][2]['Perm_read'])){ ?>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <i class="app-menu__icon fa fa-users" aria-hidden="true"></i>
                <span class="app-menu__label">Seguridad</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<?= base_url(); ?>/usuarios"><i class="icon fa fa-circle-o"></i> Usuarios</a></li>
                <li><a class="treeview-item" href="<?= base_url(); ?>/roles"><i class="icon fa fa-circle-o"></i> Roles</a></li>
				<!--<li><a class="treeview-item" href="</?= base_url(); ?>/parametros"><i class="icon fa fa-circle-o"></i> Parametros</a></li>-->
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][3]['Perm_read'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/clientes">
                <i class="app-menu__icon fa fa-user" aria-hidden="true"></i>
                <span class="app-menu__label">Clientes</span>
            </a>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][4]['Perm_read']) || !empty($_SESSION['permisos'][6]['Perm_read'])){ ?>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <i class="app-menu__icon fa fa-archive" aria-hidden="true"></i>
                <span class="app-menu__label">Tienda</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <?php if(!empty($_SESSION['permisos'][4]['Perm_read'])){ ?>
                <li><a class="treeview-item" href="<?= base_url(); ?>/productos"><i class="icon fa fa-circle-o"></i> Productos</a></li>
                <?php } ?>
                <?php if(!empty($_SESSION['permisos'][6]['Perm_read'])){ ?>
                <li><a class="treeview-item" href="<?= base_url(); ?>/categorias"><i class="icon fa fa-circle-o"></i> Categorías</a></li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['permisos'][5]['Perm_read'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/pedidos">
                <i class="app-menu__icon fa fa-shopping-cart" aria-hidden="true"></i>
                <span class="app-menu__label">Pedidos</span>
            </a>
        </li>
         <?php } ?>

        <?php if(!empty($_SESSION['permisos'][MDSUSCRIPTORES]['Perm_read'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/suscriptores">
                <i class="app-menu__icon fas fa-user-tie" aria-hidden="true"></i>
                <span class="app-menu__label">Suscriptores</span>
            </a>
        </li>
         <?php } ?>

         <?php if(!empty($_SESSION['permisos'][8]['Perm_read'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/contactos">
                <i class="app-menu__icon fas fa-envelope" aria-hidden="true"></i>
                <span class="app-menu__label">Mensajes</span>
            </a>
        </li>
         <?php } ?>

         <?php if(!empty($_SESSION['permisos'][9]['Perm_read'])){ ?>
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/paginas">
                <i class="app-menu__icon fas fa-file-alt" aria-hidden="true"></i>
                <span class="app-menu__label">Páginas</span>
            </a>
        </li> 
		<?php } ?>
		<?php if(!empty($_SESSION['permisos'][MDPARAMETROS]['Perm_read'])){ ?>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <i class="app-menu__icon fa fa-cog" aria-hidden="true"></i>
                <span class="app-menu__label">Parametros</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a class="treeview-item" href="<?= base_url(); ?>/parametros"><i class="icon fa fa-circle-o"></i> Parametros</a></li>
            </ul>
        </li>
         <?php } ?>
		
        <li>
            <a class="app-menu__item" href="<?= base_url(); ?>/logout">
                <i class="app-menu__icon fa fa-sign-out" aria-hidden="true"></i>
                <span class="app-menu__label">Logout</span>
            </a>
        </li>
      </ul>
    </aside>