# Signer
Máquina virtual provisionada por vagrant para firma de documentos PDF

# Aprovisionar

En la carpeta del repositorio ejecutar
```
$ vagrant up
```
# Firmar un documento

```
$ vagrant ssh
$ cd /vagrant
$ ./docusigner <infile.pdf> <outfile.pdf>
```

# Verificar firma de documento

```
$ pdfsig <document.pdf>
```
