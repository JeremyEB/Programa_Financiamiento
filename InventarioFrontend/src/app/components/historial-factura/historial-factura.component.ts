import { query } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { debounceTime } from 'rxjs';
import { historialFacturas, updateFactura } from 'src/app/models/modelos';
import { ApiService } from 'src/app/services/api.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import pdfMake from 'pdfmake/build/pdfMake';
import pdfFonts from 'pdfmake/build/vfs_fonts';
pdfMake.vfs = pdfFonts.pdfMake.vfs;

@Component({
  selector: 'app-historial-factura',
  templateUrl: './historial-factura.component.html',
  styleUrls: ['./historial-factura.component.css']
})
export class HistorialFacturaComponent implements OnInit {
  u_Factura: updateFactura = new updateFactura();
  h_facturas: historialFacturas = new historialFacturas();
  dataTable4:any = [];
  dataTable5: any = [];
  control3 = new FormControl()
  public facturas: Array<any> = []
  constructor(
    private apiService: ApiService,
    public modal: NgbModal
  ){ }

  event(){
    this.apiService.allFacturas,
    this.apiService.allClientes
  }

  ngOnInit(): void {
    this.ObserverChangeSearch4();
    this.onDataTable();
  }

  ObserverChangeSearch4(){
    this.control3.valueChanges
    .pipe(
      debounceTime(500)
    )
    .subscribe(query => {
      console.log(query);
      this.apiService.searchFacturadetail(query).subscribe(
        (res:any) => {
          this.facturas = res;
        },
        (object) => {
          console.log(object)
        }
      )
    })
  }

  onDataTable(){
    this.apiService.getProbandoFactura().subscribe(res=>{
      this.dataTable4 = res;
      console.log(res)
    });
  }

  onDataTable2(){
    this.apiService.getHistorial().subscribe(res => {
      this.dataTable5 = res;
      console.log(res)
    });
  }

  onUpdateFactura(u_Factura:updateFactura):void{
    this.apiService.updateProbandoFactura(u_Factura.ID_Facturas, u_Factura).subscribe(res => {
      if(res){
        alert(`Se ha realizado un pago del empleado ${u_Factura.Nombre_Apellido}`);
      } else{
        alert('Error')
      }
    })
  }

  onAddHistorialFactura(h_facturas: historialFacturas): void{
    this.apiService.addHistorial(h_facturas).subscribe(res => {
      if(res){
        alert(`La factura fue actualizada`);
        console.log(h_facturas, res)
      } else {
        alert("Error")
      }
    })
}

  onSetData(select:any){
    /*Actualizar Facturas */
    this.u_Factura.ID_Facturas = select.ID_Facturas;
    this.u_Factura.Monto_Solicitado = select.Monto_Solicitado;
    this.u_Factura.Tasa = select.Tasa;
    this.u_Factura.Cuotas = select.Cuotas;
    this.u_Factura.Cuotas_Mensuales = select.Cuotas_Mensuales;
    this.u_Factura.Monto_Pagar = select.Monto_Pagar;
    this.u_Factura.Capital = select.Capital;
    this.u_Factura.Interes = select.Interes;
    this.u_Factura.Fecha = select.Fecha;
    this.u_Factura.Usuario_ID = select.Usuario_ID;
    this.u_Factura.Nombre_Apellido = select.Nombre_Apellido;
    this.u_Factura.Telefono = select.Telefono;
    this.u_Factura.Cedula = select.Cedula;
    /*Creando Factura Historial*/
    this.h_facturas.Factura_ID = this.u_Factura.ID_Facturas;
    this.h_facturas.Monto_Solicitado = this.u_Factura.Monto_Solicitado;
    this.h_facturas.Tasa = this.u_Factura.Tasa;
    this.h_facturas.Cuotas = this.u_Factura.Cuotas;
    this.h_facturas.Cuotas_Mensuales = this.u_Factura.Cuotas_Mensuales;
    this.h_facturas.Monto_Pagar = this.u_Factura.Monto_Pagar;
    this.h_facturas.Capital = this.u_Factura.Capital;
    this.h_facturas.Interes = this.u_Factura.Interes;
    this.h_facturas.Fecha = this.u_Factura.Fecha;
    this.h_facturas.Usuario_ID = this.u_Factura.Usuario_ID;
    this.h_facturas.Nombre_Apellido = this.u_Factura.Nombre_Apellido;
    this.h_facturas.Telefono = this.u_Factura.Telefono;
    this.h_facturas.Cedula = this.u_Factura.Cedula;
  }

  //PDF
  createPdf(){
    const pdfDefinition: any = {
      content:[
        {
          stack:[
            'Grupos FYCAS',
            {text: 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eligendi magnam vel facere cupiditate expedita, quos accusantium. Sapiente quos suscipit aliquam iusto voluptates quia, ipsa totam saepe? Nihil nulla expedita incidunt!', style:'body'}
          ],
          style:'header'
        },
        {
          text:'Factura para: ' + this.u_Factura.Nombre_Apellido + '\n',
          style:'subheader'
        },
        {
          text:'ID_Factura: ' + this.u_Factura.ID_Facturas + '\n',
          style:'body'
        },
        {
          text:'Monto Solicitado: ' + this.u_Factura.Monto_Solicitado + '\n',
          style: 'body'
        },
        {
          text: 'Tasa: ' + this.u_Factura.Tasa + '\n',
          style: 'body'
        },
        {
          text: 'Cuotas: ' + this.u_Factura.Cuotas + '\n',
          style: 'body'
        },
        {
          text: 'Cuotas Mensuales: ' + this.u_Factura.Cuotas_Mensuales + '\n',
          style: 'body'
        },
        {
          text: 'Monto A Pagar: ' + this.u_Factura.Monto_Pagar + '\n',
          style: 'body'
        },
        {
          text: 'Capital: ' + this.u_Factura.Capital + '\n',
          style: 'body'
        },
        {
          text: 'Interes: ' + this.u_Factura.Interes + '\n',
          style: 'body'
        },
        {
          text: 'Fecha ' + this.u_Factura.Fecha + '\n',
          style: 'body'
        }
      ],
      styles: {
        header: {
          fontSize: 20,
          bold: true,
          alignment: 'center',
          margin:[0,10,0,30]
        },
        subheader: {
          fontSize: 14,
          alignment: 'right',
          margin:[0,10,0,10]
        },
        body:{
          fontSize:12,
          margin:[0,10,0,10]
        }
      }
    }
    const pdf = pdfMake.createPdf(pdfDefinition);
    pdf.open();
  }

}
