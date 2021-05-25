 {include file='../Layout/header.tpl'}
   
    <title>Downloads - Admin</title>
    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

          <h1 class="title-bar-title">
            <span class="d-ib"><i class="fa fa-download"></i> {$site_title} </span>
          </h1>
                
 {include file='../Downloads/menu.tpl'}

    {if $deleted}<div class="alert alert-success">Download Deleted Successfully</div>{/if}
    </div>

       <div class="row">
            <div class="col-xs-12">
                <div class="panel">
                 <div class="panel-body">
             <div class="table-responsive">
             <table class="table table-middle">
              <thead>
               <tr>
                <th><div class="fa fa-tag"></div> ID</th>
                <th><div class="fa fa-pencil"></div> Name</th>
                <th style="text-align: center"><div class="fa fa-user"></div> User</th>
                <th style="text-align: center"><div class="fa fa-link"></div> Item</th>
                <th style="text-align: center"><div class="fa fa-unsorted"></div> Status</th>
                <th style="text-align: center"><div class="fa fa-calendar"></div> Created</th>
                <th style="text-align: center"><div class="fa fa-mail-reply-all"></div> Actions</th>
               </tr>
               </thead>
               <tbody>
               <tr>
            {foreach from=$download item=foo}

                 <td style="font-size: 14px;"><b>#{$foo['id']}</b></td>
                 <td style="font-size: 14px;">{$foo['name']}</td>
                 <td style="text-align: center">
                   <a href="{$ADM}users/view/{$foo['user_id']}/">
                      <button class="btn btn-info btn-xs"><i class="fa fa-user"></i> {$foo['user']}</button>
                    </a>
                 </td>
                 <td style="text-align: center">
                     <a href="{$HOST}item/{$foo['item_id']}/{$foo['link']}/" target="_blank">
                         <button class="btn btn-info btn-xs"><i class="fa fa-eye" style="font-size: 15px;"></i></button>
                     </a>
                  </td>
                        
                {if $foo['status']==1}
                  <td class="alert alert-success text-center" style="text-align: center;font-size: 14px;">Active</td>
                {elseif $foo['status']==2}
                  <td class="alert alert-danger text-center" style="text-align: center;font-size: 14px;">Inactive</td>
                {elseif $foo['status']==3}
                  <td class="alert alert-danger text-center" style="text-align: center;font-size: 14px;">Refunded</td>
                {/if}
                                  
                  <td style="text-align: center;font-size: 14px;">{$foo['created']}</td>

                   <td style="text-align: center">
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                    </tr>
           {/foreach}

                    </tbody>
                   </table>
                  </div>  
                 </div>         
              </div>
              
 {if $download}

  <div class="row" style="text-align: center"> 
  <ul class="pagination">{$paging} </ul></div>

 {else}

  <center><span class="alert alert-danger text-center">No downloads to show...</span></center>

 {/if}
 
                        </div>
                    </div>
                </div>     
                
{include file='../Layout/footer.tpl'}