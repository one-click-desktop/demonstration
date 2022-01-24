# Konfiguracja boxa do LDAPa

0. Zainstalować pakiet `openldap`.
1. Plik `/etc/openldap/ldap.conf`: ustawić `BASE` i `URI` do AD (Ansible).
2. Zainstalować pakiet `nss-pam-ldapd`.
3. Plik `/etc/nsswitch.conf`: Ustawić poniższe wartości:
    ```
    passwd: files ldap
    group: files ldap
    shadow: files ldap
    ```
4. Plik `/etc/nslcd.conf`: Zmienić klucze, aby pasowały do AD (Ansible):
    * `base`
    * `uri`
    * `binddn` - DN readme
    * `bindpw` - hasło readme
    * `rootpwmoddn` - DN admina
    * `base group` - DN grup
    * `base passwd` - DN userów
    * `base shadow` - DN userów
5. Ustawić permy do `/etc/nslcd.conf` na `0600`.
6. Enable i restart `nslcd.service`.
7. Zmodyfikować [PAMa](https://wiki.archlinux.org/title/LDAP_authentication#PAM_Configuration)