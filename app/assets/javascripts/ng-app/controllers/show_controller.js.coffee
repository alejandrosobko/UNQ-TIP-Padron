angular.module('padronApp').controller('ShowCtrl', ($stateParams, Dentist, $uibModal, errorHandler, $location, moment) ->
  @dentist = undefined

  Dentist.get(id: $stateParams.dentistId).then(
    (response) =>
      @dentist = Dentist.build(response)
      @years = _.uniq(_.map(response.visits, (visit) -> moment(visit.visitDate).year()))
    (error) =>
      $location.path('/')
      errorHandler.error("No existe un odontólogo con id: #{$stateParams.dentistId}")
  )

  @getDateFor = (visit) ->
    new Date(visit.visitDate)

  @delete = ->
    $uibModal.open(
      templateUrl: 'modals/delete_dentist.html'
      controller: 'ModalDeleteDentistCtrl as modalCtrl'
      resolve:
        deleteFunction: => @deleteFunction
        dentist: => @dentist
    )

  @deleteFunction = =>
    @dentist.delete({id: @dentist.id}).then(
      (response) =>
        @dentist = new Dentist
        errorHandler.info("Se borró el odontólogo correctamente")
        $location.path('/')
      (error) => errorHandler.error("Ocurrió un error interno borrando al odontólogo. Por favor intente nuevamente")
    )

  @openMaps = (index) ->
    $uibModal.open(
      templateUrl: 'modals/google_maps.html'
      controller: 'MapsCtrl as mapsCtrl'
      size: 'lg'
      resolve:
        dentist: => @dentist
        index: => index
    )

  @visitsInYear = (year) ->
    visits = _.select(@dentist.visits, (visit) -> moment(visit.visitDate).year() == year)
    _.sortBy(visits, (visit) -> -moment(visit.visitDate))


  @sortByDay = (day) ->
    days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
    days.indexOf(day.day)


  @
)