from sqlalchemy.orm import declarative_base

# One metadata/registry per physical database
BaseInvd = declarative_base()  #  ← Invention-Disclosure
BaseDr = declarative_base()  #  ← pmv_dr
BaseDrafting = declarative_base() #  ← pmv_drafting
BaseCsd =declarative_base()    #  ← pmv_csd   
