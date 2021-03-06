.. _readme:

dotfiles-formula
================

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/dotfiles-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/dotfiles-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

A SaltStack formula that is empty. It has dummy content to help with a quick
start on a new formula and it serves as a style guide.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

If you need (non-default) configuration, please pay attention to the ``pillar.example`` file and/or `Special notes`_ section.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Special notes
-------------

None

Available states
----------------

.. contents::
   :local:

``dotfiles``
^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This installs the dotfiles package,
manages the dotfiles configuration file and then
starts the associated dotfiles service.

``dotfiles.package``
^^^^^^^^^^^^^^^^^^^^

This state will install the dotfiles package only.

``dotfiles.config``
^^^^^^^^^^^^^^^^^^^

This state will configure the dotfiles service and has a dependency on ``dotfiles.install``
via include list.

``dotfiles.service``
^^^^^^^^^^^^^^^^^^^^

This state will start the dotfiles service and has a dependency on ``dotfiles.config``
via include list.

``dotfiles.clean``
^^^^^^^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

this state will undo everything performed in the ``dotfiles`` meta-state in reverse order, i.e.
stops the service,
removes the configuration file and
then uninstalls the package.

``dotfiles.service.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will stop the dotfiles service and disable it at boot time.

``dotfiles.config.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the configuration of the dotfiles service and has a
dependency on ``dotfiles.service.clean`` via include list.

``dotfiles.package.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the dotfiles package and has a depency on
``dotfiles.config.clean`` via include list.

``dotfiles.subcomponent``
^^^^^^^^^^^^^^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This state installs a subcomponent configuration file before
configuring and starting the dotfiles service.

``dotfiles.subcomponent.config``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will configure the dotfiles subcomponent and has a
dependency on ``dotfiles.config`` via include list.

``dotfiles.subcomponent.config.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the configuration of the dotfiles subcomponent
and reload the dotfiles service by a dependency on
``dotfiles.service.running`` via include list and ``watch_in``
requisite.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``dotfiles`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

