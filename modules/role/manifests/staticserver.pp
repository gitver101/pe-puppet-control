# NFS static content server
class role::staticserver {
    nfs::server { 'static':
        mountroot   => '/srv/mediawiki-static',
        exportsfile => 'puppet:///modules/role/staticserver/exports',
    }

    ufw::allow { 'nfs annoyance (mw1)':
        from => '185.52.1.75',
    }

    ufw::allow { 'nfs annoyamce (mw2)':
        from => '185.52.2.113',
    }

    motd::role { 'role::staticserver':
        description => 'static hosting server',
    }
}
