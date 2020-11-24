create table DictOKVED (
   CodeId               VARCHAR(8)           not null,
   CodeVersion          VARCHAR(10)          not null,
   CodeName             VARCHAR(1000)        not null,
   constraint PK_DICTOKVED primary key (CodeId, CodeVersion)
);

comment on table DictOKVED is
'�������������� ������������� ����� ������������� ������������ ����� ';
create table LegalPerson (
   LpOGRN               VARCHAR(13)          not null,
   LpOGRNDate           DATE                 not null,
   OkvedBaseCode        VARCHAR(8)           null,
   OkvedVersion         VARCHAR(10)          null,
   constraint PK_LEGALPERSON primary key (LpOGRN)
);

comment on table LegalPerson is
'�������� � ����������� ���� (��)';

comment on column LegalPerson.LpOGRN is
'�������� ��������������� ��������������� ����� ������������ ����';

comment on column LegalPerson.LpcOGRNDate is
'���� ���������� ����. ��� ��, ��������� ����� 01.07.2002 �., �������� ����� ����������� ��';


alter table LegalPerson
   add constraint FK_LEGALPER_REFERENCE_DICTOKVE foreign key (OkvedBaseCode, OkvedVersion)
      references DictOKVED (CodeId, CodeVersion)
      on delete restrict on update restrict;
