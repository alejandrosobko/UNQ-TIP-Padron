[![Build Status](https://travis-ci.org/alejandrosobko/UNQ-TIP-Padron.svg?branch=master)](https://travis-ci.org/alejandrosobko/UNQ-TIP-Padron) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/1b733ae3c40d4f6aaf22edf5e5a579d5)](https://www.codacy.com/app/alee-sk8/padron?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=alejandrosobko/padron&amp;utm_campaign=Badge_Grade)
 

![Padrón](/app/assets/images/logo.png) 


# Padron de odontólogos

Load administrative information and save them to the database.

### Circuit

The workflow is described in the following link. Here you can look a normal flow of this application.

Workflow:  [workflow](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Workflow) 

Architecture documentation [Architecture Doc](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Arquitectura-1)

Architecture documentation (2nd release) [Architecture Doc - 2nd release](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Arquitectura-2)

Architecture documentation (3rd release) [Architecture Doc - 3rd release](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Arquitectura-3)

Responsibility of the components [Components Doc](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Responsabilidades)

Responsibility of the components (new) [Components Doc Updated](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Responsabilidades-(Nuevo))

1st release doc: [1 Doc] (https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Entrega-1)

2nd release doc: [2 Doc](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Entrega-2)

3rd release doc: [3 Doc](https://github.com/alejandrosobko/UNQ-TIP-Padron/wiki/Entrega-3)

DER: [DER](https://github.com/alejandrosobko/UNQ-TIP-Padron/blob/master/app/assets/images/doc/der.png?raw=true)

### Installation

* Clone this repo
* Move into project folder
* `gem install bundler`
* `bundle install`
* `bower install`
* `rake db:migrate`
* `rake db:seed` if you need fake data in db
