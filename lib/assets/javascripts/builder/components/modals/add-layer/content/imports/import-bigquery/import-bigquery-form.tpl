<form class="Form js-form">
  <div class="Form-row u-flex__align--start">
    <div class="Form-rowLabel ImportOptions__label">
      <label class="Form-label CDB-Text CDB-Size-medium u-mainTextColor"><%- _t('components.modals.add-layer.imports.bigquery.field-billing-project') %></label>
    </div>
    <div class="">
      <input type="text" class="ImportOptions__input--long Form-input CDB-Text CDB-Size-medium js-textInput">
      <div class="ImportOptions__hint CDB-Text CDB-Size-medium u-altTextColor u-mt--8"><%= _t('components.modals.add-layer.imports.bigquery.billing-project-hint') %></div>
    </div>
  </div>
  <div class="Form-row u-flex__align--start">
    <div class="Form-rowLabel ImportOptions__label">
      <label class="Form-label CDB-Text CDB-Size-medium u-mainTextColor"><%- _t('components.modals.add-layer.imports.bigquery.field-sql-query') %></label>
    </div>
    <div>
      <div class="ImportOptions__CodeMirror">
        <textarea rows="4" cols="50" class="ImportOptions__input--long Form-input Form-textarea CDB-Text CDB-Size-medium js-textarea"></textarea>
        <% if (errorMessage) { %>
          <div class="ImportOptions__input-error CDB-Text">
            <%- errorMessage %>
          </div>
        <% } %>
      </div>
      <div class="ImportOptions__hint CDB-Text CDB-Size-medium u-altTextColor u-mt--8"><%- _t('components.modals.add-layer.imports.bigquery.sql-hint') %></div>
    </div>
  </div>
  <div class="Form-row">
    <div class="Form-rowLabel ImportOptions__label"></div>
    <div class="Form-row ImportOptions__input--long u-flex__justify--end">
      <button type="submit" class="CDB-Button CDB-Button--primary is-disabled js-submit">
        <span class="CDB-Button-Text CDB-Text is-semibold CDB-Size-small u-upperCase"><%- _t('components.modals.add-layer.imports.bigquery.run') %></span>
      </button>
    </div>
  </div>
  <div class="ImportOptions__feedback">
    <p class="CDB-Text CDB-Size-medium">
      <span class="u-secondaryTextColor"><%- _t('components.modals.add-layer.imports.bigquery.feedback-text') %> <a href="https://docs.google.com/forms/d/e/1FAIpQLSf9U6Yca37TlpguW_mC6nr9YdyBJzipCjf_QSHNkqlmkQ8dgQ/viewform" target="_blank"><%- _t('components.modals.add-layer.imports.bigquery.feedback-link') %></a></span>
    </p>
  </div>
</form>
