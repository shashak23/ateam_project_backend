/**
 * 
 */
 var activeModal = [];
 
 function Modal(title, content, isShowFooter) {
	 this.html = `
	 	<div class="modal" style="visibility: visible; opacity: 1;">
	 		<div class="modal-header">
	 			<div>
	 				${title}
	 			</div>
	 		</div>
	 		<div class="modal-content">
	 			${content}
	 		</div>
	 		${isShowFooter ? `<div class="modal-footer">
	 			
	 		</div>`: ""}
	 	</div>
	 `;
 }
 
 Modal.prototype.show = function(jQuery, appendTo) {
	 let modalId = Math.random() + "";
	 let modal = jQuery(this.html);
	 
	 modal.attr("id", modalId);
	 activeModal.push("#" + modalId);
	 
	 jQuery(appendTo).append(modal);
	 
	 return modal;
 }
 
 Modal.prototype.close = function(jQuery) {
	 let modalSize = activeModal.length;
	 let latestModalId = activeModal[modalSize-1];
	 activeModal.slice(0, modalSize - 1);
	 
	 jQuery(latestModalId).remove();
	 
 }