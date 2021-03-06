<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>

<commons:popupHeader />


<script src="${pageContext.request.contextPath}/js/json/util.js"></script>
    <div id="main-body-header">
        <fmt:message key="usersAdmin.employment.unassign.label.title"/>
    </div>

    <div id="main-body-content"> 
         <ui:jsontable url="${pageContext.request.contextPath}/web/json/directory/admin/organization/employee/unassign/list?${pageContext.request.queryString}"
                       var="JsonDataTable2"
                       divToUpdate="formList2" 
                       jsonData="data"
                       rowsPerPage="1000000"
                       width="100%"
                       sort="employeeCode"
                       desc="false"
                       checkbox="true"
                       checkboxId="id"
                       checkboxButton1="general.method.label.unassign"
                       checkboxButton2="general.method.label.close"
                       checkboxCallback1="unassign"
                       checkboxCallback2="closeDialog"
                       fields="['id','firstName','lastName','startDate','endDate']"
                       column1="{key: 'firstName', label: 'usersAdmin.employment.unassign.label.first.name', sortable: true}"
                       column2="{key: 'lastName', label: 'usersAdmin.employment.unassign.label.last.name', sortable: false}"
                       column3="{key: 'startDate', label: 'usersAdmin.employment.unassign.label.start.date', sortable: true}"
                       column4="{key: 'endDate', label: 'usersAdmin.employment.unassign.label.end.date', sortable: false}"
                       />
    </div>
    
    <script>
        function unassign(id){
               var callback = {
                    success : function() {
                        //parent.closeDialog();
                        parent.location.reload(true);
                    }
                }
                var request = ConnectionManager.post('${pageContext.request.contextPath}/web/directory/admin/organization/employee/unassign/submit', callback, 'unassignId='+id+'&departmentId=${departmentId}');
        
        }
        
        
        function closeDialog() {
            if (parent && parent.closeDialog) {
                parent.closeDialog();
            }
            return false;
        }
    </script>
    
<commons:popupFooter />