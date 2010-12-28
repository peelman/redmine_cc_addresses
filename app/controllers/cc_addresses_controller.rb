class CcAddressesController < ApplicationController
  before_filter :find_project, :except => [ :new_issue_add_cc ]
  before_filter :authorize, :except => [ :new_issue_add_cc ]
  unloadable

  def create
    @cc_address = CcAddress.new(params[:new_address])
    respond_to do |format|
      if @cc_address.save
        format.html { redirect_to :controller => 'issues', :action => 'show', :id => @issue }
        format.js do
          render :update do |page|
            if @cc_address.errors.empty?
              @cc_address = nil
            end
            page.replace_html "cc-addresses", :partial => 'issues/cc_addresses', :locals => { :issue => @issue, :project => @project }
          end
        end
      else
        format.html { redirect_to :controller => 'issues', :action => 'show', :id => @issue }
        format.js do
          render :update do |page|
            page.replace_html "cc-addresses", :partial => 'issues/cc_addresses', :locals => { :issue => @issue, :project => @project }
          end
        end
      end
    end
  end

  def destroy
    cc_address = CcAddress.find(params[:id])
    if request.post? && @issue.cc_addresses.include?(cc_address)
      cc_address.destroy
      @issue.reload
    end
    respond_to do |format|
      format.html { redirect_to :controller => 'issues', :action => 'show', :id => @issue }
      format.js { render(:update) { |page| page.replace_html "cc-addresses", :partial => 'issues/cc_addresses', :locals => { :issue => @issue, :project => @project } } }
    end
  end

  def new_issue_add_cc
    @issue = Issue.new
    @issue.cc_addresses.build
    respond_to do |format|
      format.html { render :partial => 'issues/cc_addresses/new_ajax', :locals => { :issue => @issue } }
      format.js { render(:update) { |page| page.insert_html :bottom, 'div-cc-addresses', :partial => 'issues/cc_addresses/new_ajax', :locals => { :issue => @issue } } }
    end
  end

private
  def find_project
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
