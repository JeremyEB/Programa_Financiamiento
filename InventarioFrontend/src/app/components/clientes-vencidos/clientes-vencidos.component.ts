import { Component, OnInit } from '@angular/core';
import { historialFacturas, updateFactura } from 'src/app/models/modelos';
import { ApiService } from 'src/app/services/api.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { debounceTime } from 'rxjs';
import {FormControl} from '@angular/forms';

@Component({
  selector: 'app-clientes-vencidos',
  templateUrl: './clientes-vencidos.component.html',
  styleUrls: ['./clientes-vencidos.component.css']
})
export class ClientesVencidosComponent implements OnInit {
  control = new FormControl();
  public facturas: Array<any> = [];
  dataTable: any = [];
  constructor(
    private apiService: ApiService
  ){ }

  event(){
    this.apiService.allHistorial
  }

  ngOnInit(): void {
    this.ObserverChangeSearch();
  }

  ObserverChangeSearch(){
    this.control.valueChanges
    .pipe(
      debounceTime(500)
    )
    .subscribe(query =>{
      console.log(query);
      this.apiService.BuscarFacturaFecha(query).subscribe(
        (res:any) => {
          this.facturas = res;
        },
        (object) =>{
          console.log(object)
        }
      )
    });
  }

  onDataTable(){
    this.apiService.getHistorial().subscribe(res => {
      this.dataTable = res;
      console.log(res)
    })
  }



}