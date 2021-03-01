# En el enunciado se pide insertar detrás de la línea 
# root ALL=(ALL:ALL)   ALL
# Pero no existe en el fichero /etc/sudoers
# Lo más parecido es: 
# root    ALL=(ALL)       ALL
# Asumimos que es un error en el enunciado
# Lo mismo ocurre con 
# ansible ALL=(ALL:ALL) ALL:NOPASWD
# visudo indica que la sintaxis no es válida. Lo sustituimos por 
# ansible  ALL=(ALL)   NOPASSWD: ALL

ansible nodos -m lineinfile -a "path='/etc/sudoers' \
    state='present' \
    insertafter='^root\s+ALL=\(ALL\)\s+ALL$' \
    line='ansible  ALL=(ALL)   NOPASSWD: ALL' \
    validate='/usr/sbin/visudo -cf %s'"