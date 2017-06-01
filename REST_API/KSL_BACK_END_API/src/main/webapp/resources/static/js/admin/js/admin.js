/**
 *  JS FOR ADMIN PAGE 
 */

var app = angular.module('appuserlist', []);
app.controller('userlistconrtoller',['$scope', '$http','$rootScope',function($scope, $http) {
	alert("test in controller");
/*  function get person*/
  $scope.getUser = function(){
	  alert("test in function");
    $http({
        method : "GET",
        url : "http://localhost:8080/api/user"
      }).then(function success(response) {
          $scope.user = response.data.DATA;
          console.log(response);
        }, function error(response) {
          $scope.user = response.statusText;
      }); 
  }
  $scope.getUser();



/*function add person*/
  /*$scope.addPerson = function(){
      $http({
        method : "POST",
        data:{
           AGE:$scope.inputage,
           NAME:$scope.inputname
        },
        url : "http://120.136.24.174:2222/person"
      }).then(function success(response) {
          swal("Success","Your item have been add","success");
          $scope.getPersons();
          $("#myModal").modal("hide");
        }, function error(response) {
          $scope.person = response.statusText;
      });

      $scope.clearForm();

  }
  */


/*function clear form */
  /*$scope.clearForm = function(){
    $scope.inputname = null,
    $scope.inputage=null

  }*/

/*function clear for edit*/

/*$scope.clearUpdate = function(){
  $scope.updatename = null,
  $scope.updateage = null
}*/
/*function get id*/
  /*$scope.getElementId = function(id){
      
        $http({
          url : "http://120.136.24.174:2222/person/"+id,
          method : "GET"
        }).then(function success(response) {
            $scope.xx = response.data.PERSON;            
            $scope.updatename = $scope.xx.NAME;
            $scope.updateage= $scope.xx.AGE;
            $scope.gid = $scope.xx.ID;
          }, function error(response) {
            $scope.xx = response.statusText;
        });
  }*/

/*function delete*/
  /*$scope.deletePerson = function(id){
        swal({
          title: "Are you sure?",
          text: "Do you want to delete this item!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#5bc0de",confirmButtonText: "Yes, delete it!",
          cancelButtonText: "No, cancel delete!",
          closeOnConfirm: false,
          closeOnCancel: false }, 
        function(isConfirm){ 
           if (isConfirm) {
              swal("Deleted!", "File Deleted", "success");
              $http({
            url: 'http://120.136.24.174:2222/person/'+id,
            method: 'DELETE'
            }).then(function(response){
            $scope.getPersons();
            });
           } else {
              swal("Cancelled", "Not Deleted", "error");
           }
        });


        // $http({
        //   url : "http://120.136.24.174:2222/person/"+id,
        //   method : "DELETE"
        // }).then(function success(response) {
        //     alert("Delete");
        //     $scope.getPersons();
        //   }, function error(response) {
        //     $scope.xx = response.statusText;
        // });
  }



  function update person
    $scope.updatePerson = function(gid) {
        $http({
          method: 'PUT',
          data:{
              AGE:$scope.updateage,
              ID:gid,
              NAME:$scope.updatename
          },
          url : "http://120.136.24.174:2222/person/",
          headers: { 'Content-Type': 'application/JSON' }
                
          }).then(function success(response){
                    $scope.persons = response.data.PERSON;
                    $scope.getPersons();
                    swal("Update","You have been update!","success");
                    $("#ModalUpdate").modal("hide");
                    $scope.clearUpdate();
                },function error(response){
                    $scope.persons =response.statusText;
          });
    }*/

/*    validate form */

    // $scope.ValiName="/^[a-zA-Z\s]*$/";

    // $scope.ValiAge="/^[0-9]{1,2}$/";
  
}]);